import 'dart:math' as math;
import 'hierarchy.dart';

/// Computes a cluster layout (dendrogram).
///
/// Unlike the tree layout, the cluster layout places all leaf nodes
/// at the same depth, which is useful for dendrograms in hierarchical
/// clustering visualizations.
class Cluster<T> {
  /// The width of the layout.
  double width;

  /// The height of the layout.
  double height;

  /// The horizontal separation between nodes.
  double Function(HierarchyNode<T>, HierarchyNode<T>)? separation;

  /// Node size (fixed size for all nodes).
  (double, double)? nodeSize;

  /// Creates a cluster layout.
  Cluster({
    this.width = 1,
    this.height = 1,
    this.separation,
    this.nodeSize,
  });

  /// Sets the size of the layout.
  Cluster<T> size(double w, double h) {
    width = w;
    height = h;
    nodeSize = null;
    return this;
  }

  /// Sets the node size.
  Cluster<T> setNodeSize(double w, double h) {
    nodeSize = (w, h);
    return this;
  }

  /// Sets the separation function.
  Cluster<T> setSeparation(
      double Function(HierarchyNode<T>, HierarchyNode<T>) fn) {
    separation = fn;
    return this;
  }

  /// Computes the cluster layout for the given hierarchy.
  HierarchyNode<T> layout(HierarchyNode<T> root) {
    final sep = separation ?? _defaultSeparation;

    // Get all leaves
    final leaves = root.leaves().toList();

    // Position leaves with separation
    var x = 0.0;
    HierarchyNode<T>? previousLeaf;

    for (final leaf in leaves) {
      if (previousLeaf != null) {
        x += sep(leaf, previousLeaf);
      }
      leaf.x = x;
      leaf.y = root.height.toDouble();
      previousLeaf = leaf;
    }

    // Position internal nodes (average of children)
    _positionInternalNodes(root);

    // Scale to fit layout size
    if (nodeSize != null) {
      // Use fixed node size
      for (final node in root.descendants()) {
        node.x *= nodeSize!.$1;
        node.y *= nodeSize!.$2;
      }
    } else {
      // Scale to fit width and height
      final maxX = leaves.isEmpty ? 0.0 : leaves.last.x;
      final maxY = root.height.toDouble();

      if (maxX > 0) {
        for (final node in root.descendants()) {
          node.x = node.x / maxX * width;
        }
      }

      if (maxY > 0) {
        for (final node in root.descendants()) {
          node.y = node.y / maxY * height;
        }
      }
    }

    // Set rectangular bounds
    for (final node in root.descendants()) {
      node.x0 = node.x - 5;
      node.y0 = node.y - 5;
      node.x1 = node.x + 5;
      node.y1 = node.y + 5;
    }

    return root;
  }

  double _defaultSeparation(HierarchyNode<T> a, HierarchyNode<T> b) {
    return a.parent == b.parent ? 1 : 2;
  }

  void _positionInternalNodes(HierarchyNode<T> node) {
    if (node.isLeaf) return;

    // First position all children
    for (final child in node.children) {
      _positionInternalNodes(child);
    }

    // Position this node at the average x of its children
    double sumX = 0;
    for (final child in node.children) {
      sumX += child.x;
    }
    node.x = sumX / node.children.length;

    // Y is the depth (inverted, so root is at top)
    node.y = node.depth.toDouble();
  }

  /// Creates a radial cluster layout (dendrogram in polar coordinates).
  HierarchyNode<T> radialLayout(HierarchyNode<T> root) {
    // First compute normal cluster layout
    layout(root);

    // Convert to radial coordinates
    final radius = math.min(width, height) / 2;

    for (final node in root.descendants()) {
      // x becomes angle, y becomes radius
      final angle = node.x / width * 2 * math.pi - math.pi / 2;
      final r = node.y / height * radius * 0.8;

      final oldX = node.x;
      final oldY = node.y;

      node.x = width / 2 + r * math.cos(angle);
      node.y = height / 2 + r * math.sin(angle);

      // Store angle and radius for link drawing
      node.x0 = angle;
      node.y0 = r;
      node.x1 = oldX;
      node.y1 = oldY;
    }

    return root;
  }
}

/// Creates a cluster layout with default settings.
Cluster<T> cluster<T>() => Cluster<T>();

/// Creates a cluster layout with the given size.
Cluster<T> clusterWithSize<T>(double width, double height) =>
    Cluster<T>(width: width, height: height);

/// Generates a step link path between two nodes (for dendrograms).
///
/// This creates an elbow connector that first goes horizontally,
/// then vertically.
String clusterLinkStep<T>(HierarchyNode<T> source, HierarchyNode<T> target) {
  final x0 = source.x;
  final y0 = source.y;
  final x1 = target.x;
  final y1 = target.y;

  // Midpoint y
  final my = (y0 + y1) / 2;

  return 'M$x0,${y0}V${my}H${x1}V$y1';
}

/// Generates a curved link path between two nodes.
String clusterLink<T>(HierarchyNode<T> source, HierarchyNode<T> target) {
  final x0 = source.x;
  final y0 = source.y;
  final x1 = target.x;
  final y1 = target.y;

  // Curved link using cubic Bezier
  final my = (y0 + y1) / 2;
  return 'M$x0,${y0}C$x0,$my $x1,$my $x1,$y1';
}

/// Generates a radial step link path between two nodes.
String clusterLinkRadialStep<T>(
    HierarchyNode<T> source, HierarchyNode<T> target, double cx, double cy) {
  final sourceAngle = source.x0;
  final sourceRadius = source.y0;
  final targetAngle = target.x0;
  final targetRadius = target.y0;

  final x0 = cx + sourceRadius * math.cos(sourceAngle);
  final y0 = cy + sourceRadius * math.sin(sourceAngle);
  final x1 = cx + targetRadius * math.cos(targetAngle);
  final y1 = cy + targetRadius * math.sin(targetAngle);

  // Mid radius
  final midRadius = (sourceRadius + targetRadius) / 2;

  // Arc to midpoint at source angle
  final mx = cx + midRadius * math.cos(sourceAngle);
  final my = cy + midRadius * math.sin(sourceAngle);

  // Arc to midpoint at target angle
  final mx2 = cx + midRadius * math.cos(targetAngle);
  final my2 = cy + midRadius * math.sin(targetAngle);

  return 'M$x0,${y0}L$mx,$my A$midRadius,$midRadius 0 0,${targetAngle > sourceAngle ? 1 : 0} $mx2,$my2 L$x1,$y1';
}

/// Generates a radial curved link path between two nodes.
String clusterLinkRadial<T>(
    HierarchyNode<T> source, HierarchyNode<T> target, double cx, double cy) {
  final sourceAngle = source.x0;
  final sourceRadius = source.y0;
  final targetAngle = target.x0;
  final targetRadius = target.y0;

  final x0 = cx + sourceRadius * math.cos(sourceAngle);
  final y0 = cy + sourceRadius * math.sin(sourceAngle);
  final x1 = cx + targetRadius * math.cos(targetAngle);
  final y1 = cy + targetRadius * math.sin(targetAngle);

  // Control point
  final midRadius = (sourceRadius + targetRadius) / 2;
  final midAngle = (sourceAngle + targetAngle) / 2;
  final mx = cx + midRadius * math.cos(midAngle);
  final my = cy + midRadius * math.sin(midAngle);

  return 'M$x0,${y0}Q$mx,$my $x1,$y1';
}

/// Result of hierarchical clustering.
class ClusterResult<T> {
  /// The root of the hierarchical clustering tree.
  final HierarchyNode<ClusterNode<T>> root;

  /// The original data points.
  final List<T> data;

  const ClusterResult({
    required this.root,
    required this.data,
  });
}

/// Node data for hierarchical clustering.
class ClusterNode<T> {
  /// The data items in this cluster (only for leaf nodes).
  final List<T>? items;

  /// The height/distance at which this cluster was formed.
  final double height;

  /// Index of this node in the original data (for leaves).
  final int? index;

  const ClusterNode({
    this.items,
    required this.height,
    this.index,
  });
}

/// Performs agglomerative hierarchical clustering.
///
/// [data] is the list of items to cluster.
/// [distance] computes the distance between two items.
/// [linkage] specifies how to compute distance between clusters.
ClusterResult<T> hierarchicalClustering<T>({
  required List<T> data,
  required double Function(T, T) distance,
  ClusterLinkage linkage = ClusterLinkage.average,
}) {
  if (data.isEmpty) {
    throw ArgumentError('Data cannot be empty');
  }

  if (data.length == 1) {
    final leaf = HierarchyNode<ClusterNode<T>>(
      data: ClusterNode<T>(items: [data[0]], height: 0, index: 0),
    );
    return ClusterResult(root: leaf, data: data);
  }

  // Compute distance matrix
  final n = data.length;
  final distances = List.generate(n, (i) => List<double>.filled(n, 0));

  for (int i = 0; i < n; i++) {
    for (int j = i + 1; j < n; j++) {
      final d = distance(data[i], data[j]);
      distances[i][j] = d;
      distances[j][i] = d;
    }
  }

  // Create leaf nodes
  final nodes = List.generate(
    n,
    (i) => HierarchyNode<ClusterNode<T>>(
      data: ClusterNode<T>(items: [data[i]], height: 0, index: i),
    ),
  );

  // Active cluster indices
  final active = List.generate(n, (i) => i);

  // Cluster sizes (for linkage calculations)
  final sizes = List.generate(n, (_) => 1);

  // Perform clustering
  while (active.length > 1) {
    // Find closest pair
    int minI = 0, minJ = 1;
    double minDist = double.infinity;

    for (int i = 0; i < active.length; i++) {
      for (int j = i + 1; j < active.length; j++) {
        final d = distances[active[i]][active[j]];
        if (d < minDist) {
          minDist = d;
          minI = i;
          minJ = j;
        }
      }
    }

    // Merge clusters
    final iIdx = active[minI];
    final jIdx = active[minJ];

    final newNode = HierarchyNode<ClusterNode<T>>(
      data: ClusterNode<T>(height: minDist),
    );
    newNode.children = [nodes[iIdx], nodes[jIdx]];
    nodes[iIdx].parent = newNode;
    nodes[jIdx].parent = newNode;

    // Add new node
    nodes.add(newNode);
    final newIdx = nodes.length - 1;

    // Update distances
    final newDistances =
        List.generate(nodes.length, (i) => List<double>.filled(nodes.length, 0));
    for (int i = 0; i < distances.length; i++) {
      for (int j = 0; j < distances.length; j++) {
        newDistances[i][j] = distances[i][j];
      }
    }

    // Compute distances to new cluster
    for (final k in active) {
      if (k == iIdx || k == jIdx) continue;

      double newDist;
      switch (linkage) {
        case ClusterLinkage.single:
          newDist = math.min(distances[iIdx][k], distances[jIdx][k]);
          break;
        case ClusterLinkage.complete:
          newDist = math.max(distances[iIdx][k], distances[jIdx][k]);
          break;
        case ClusterLinkage.average:
          final ni = sizes[iIdx];
          final nj = sizes[jIdx];
          newDist = (ni * distances[iIdx][k] + nj * distances[jIdx][k]) / (ni + nj);
          break;
      }
      newDistances[newIdx][k] = newDist;
      newDistances[k][newIdx] = newDist;
    }

    // Update active clusters
    active.remove(iIdx);
    active.remove(jIdx);
    active.add(newIdx);

    // Update sizes
    sizes.add(sizes[iIdx] + sizes[jIdx]);

    // Update distance matrix reference
    distances.clear();
    distances.addAll(newDistances);
  }

  // The root is the last remaining node
  final root = nodes[active.first];

  // Compute depths and heights
  root._computeDepthsAndHeights(0);

  return ClusterResult(root: root, data: data);
}

extension _ClusterNodeExtension<T> on HierarchyNode<T> {
  void _computeDepthsAndHeights(int d) {
    depth = d;
    if (children.isEmpty) {
      height = 0;
    } else {
      height = 0;
      for (final child in children) {
        child._computeDepthsAndHeights(d + 1);
        if (child.height + 1 > height) {
          height = child.height + 1;
        }
      }
    }
  }
}

/// Linkage methods for hierarchical clustering.
enum ClusterLinkage {
  /// Single linkage (minimum distance).
  single,

  /// Complete linkage (maximum distance).
  complete,

  /// Average linkage (UPGMA).
  average,
}
