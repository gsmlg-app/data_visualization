import 'dart:math' as math;
import 'hierarchy.dart';

/// Computes a tidy tree layout (Reingold-Tilford algorithm).
///
/// The tree layout positions nodes such that nodes at the same depth
/// are at the same y-coordinate, and the tree is as compact as possible.
class Tree<T> {
  /// The width of the layout.
  double width;

  /// The height of the layout.
  double height;

  /// The horizontal separation between nodes.
  double Function(HierarchyNode<T>, HierarchyNode<T>)? separation;

  /// Node size (fixed size for all nodes).
  (double, double)? nodeSize;

  /// Creates a tree layout.
  Tree({
    this.width = 1,
    this.height = 1,
    this.separation,
    this.nodeSize,
  });

  /// Sets the size of the layout.
  Tree<T> size(double w, double h) {
    width = w;
    height = h;
    nodeSize = null;
    return this;
  }

  /// Sets the node size.
  Tree<T> setNodeSize(double w, double h) {
    nodeSize = (w, h);
    return this;
  }

  /// Sets the separation function.
  Tree<T> setSeparation(double Function(HierarchyNode<T>, HierarchyNode<T>) fn) {
    separation = fn;
    return this;
  }

  /// Computes the tree layout for the given hierarchy.
  HierarchyNode<T> layout(HierarchyNode<T> root) {
    // Default separation
    final sep = separation ?? _defaultSeparation;

    // First pass: compute preliminary x-coordinates
    _firstPass(root, sep);

    // Second pass: compute final coordinates
    final leftmost = _secondPass(root, 0, sep);

    // Shift to ensure all x >= 0
    _shiftTree(root, -leftmost);

    // Scale to fit the layout size
    if (nodeSize != null) {
      // Use fixed node size
      for (final node in root.descendants()) {
        node.x *= nodeSize!.$1;
        node.y = node.depth * nodeSize!.$2;
      }
    } else {
      // Scale to fit width and height
      double maxX = 0;
      for (final node in root.descendants()) {
        if (node.x > maxX) maxX = node.x;
      }

      if (maxX > 0) {
        for (final node in root.descendants()) {
          node.x = node.x / maxX * width;
        }
      }

      final treeMaxDepth = root.height;
      for (final node in root.descendants()) {
        node.y = treeMaxDepth > 0 ? node.depth / treeMaxDepth * height : 0;
      }
    }

    // Set rectangular bounds (useful for drawing)
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

  void _firstPass(
      HierarchyNode<T> node, double Function(HierarchyNode<T>, HierarchyNode<T>) sep) {
    node.y = node.depth.toDouble();

    if (node.isLeaf) {
      // Leaf node
      final sibling = _leftSibling(node);
      if (sibling != null) {
        node.x = sibling.x + sep(node, sibling);
      } else {
        node.x = 0;
      }
    } else {
      // Internal node
      for (final child in node.children) {
        _firstPass(child, sep);
      }

      // Position between first and last child
      final firstChild = node.children.first;
      final lastChild = node.children.last;
      final midpoint = (firstChild.x + lastChild.x) / 2;

      final sibling = _leftSibling(node);
      if (sibling != null) {
        node.x = sibling.x + sep(node, sibling);
        // Store modifier for second pass
        node.r = node.x - midpoint; // Using r as temp storage
      } else {
        node.x = midpoint;
        node.r = 0;
      }
    }
  }

  double _secondPass(HierarchyNode<T> node, double modifier,
      double Function(HierarchyNode<T>, HierarchyNode<T>) sep) {
    node.x += modifier;

    double leftmost = node.x;
    for (final child in node.children) {
      final childLeft = _secondPass(child, modifier + node.r, sep);
      if (childLeft < leftmost) leftmost = childLeft;
    }

    // Check for conflicts with left siblings' subtrees
    _resolveConflicts(node, sep);

    return leftmost;
  }

  void _resolveConflicts(
      HierarchyNode<T> node, double Function(HierarchyNode<T>, HierarchyNode<T>) sep) {
    final parent = node.parent;
    if (parent == null) return;

    final nodeIndex = parent.children.indexOf(node);
    if (nodeIndex <= 0) return;

    // Check each left sibling
    for (int i = nodeIndex - 1; i >= 0; i--) {
      final sibling = parent.children[i];

      // Find contour conflict
      final conflict = _getConflict(sibling, node, sep);
      if (conflict > 0) {
        // Shift subtree
        _shiftSubtree(node, conflict);
      }
    }
  }

  double _getConflict(HierarchyNode<T> left, HierarchyNode<T> right,
      double Function(HierarchyNode<T>, HierarchyNode<T>) sep) {
    // Simple conflict detection: check if leftmost of right subtree
    // conflicts with rightmost of left subtree
    final leftContour = _rightContour(left);
    final rightContour = _leftContour(right);

    double maxConflict = 0;
    for (int i = 0; i < math.min(leftContour.length, rightContour.length); i++) {
      final requiredSep = sep(leftContour[i], rightContour[i]);
      final conflict = leftContour[i].x + requiredSep - rightContour[i].x;
      if (conflict > maxConflict) {
        maxConflict = conflict;
      }
    }

    return maxConflict;
  }

  List<HierarchyNode<T>> _rightContour(HierarchyNode<T> node) {
    final contour = <HierarchyNode<T>>[];
    HierarchyNode<T>? current = node;
    while (current != null) {
      contour.add(current);
      if (current.children.isNotEmpty) {
        current = current.children.last;
      } else {
        current = null;
      }
    }
    return contour;
  }

  List<HierarchyNode<T>> _leftContour(HierarchyNode<T> node) {
    final contour = <HierarchyNode<T>>[];
    HierarchyNode<T>? current = node;
    while (current != null) {
      contour.add(current);
      if (current.children.isNotEmpty) {
        current = current.children.first;
      } else {
        current = null;
      }
    }
    return contour;
  }

  void _shiftSubtree(HierarchyNode<T> node, double shift) {
    for (final n in node.descendants()) {
      n.x += shift;
    }
  }

  void _shiftTree(HierarchyNode<T> node, double shift) {
    for (final n in node.descendants()) {
      n.x += shift;
    }
  }

  HierarchyNode<T>? _leftSibling(HierarchyNode<T> node) {
    final parent = node.parent;
    if (parent == null) return null;

    final index = parent.children.indexOf(node);
    if (index <= 0) return null;

    return parent.children[index - 1];
  }

  /// Creates a radial tree layout.
  HierarchyNode<T> radialLayout(HierarchyNode<T> root) {
    // First compute normal tree layout
    layout(root);

    // Convert to radial coordinates
    final radius = math.min(width, height) / 2;

    for (final node in root.descendants()) {
      // x becomes angle, y becomes radius
      final angle = node.x / width * 2 * math.pi - math.pi / 2;
      final r = node.y / height * radius * 0.8; // 0.8 to leave room

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

/// Creates a tree layout with default settings.
Tree<T> tree<T>() => Tree<T>();

/// Creates a tree layout with the given size.
Tree<T> treeWithSize<T>(double width, double height) =>
    Tree<T>(width: width, height: height);

/// Generates a curved link path between two nodes.
String treeLink<T>(HierarchyNode<T> source, HierarchyNode<T> target) {
  final x0 = source.x;
  final y0 = source.y;
  final x1 = target.x;
  final y1 = target.y;

  // Curved link using cubic Bezier
  final my = (y0 + y1) / 2;
  return 'M$x0,${y0}C$x0,$my $x1,$my $x1,$y1';
}

/// Generates a horizontal curved link path between two nodes.
String treeLinkHorizontal<T>(HierarchyNode<T> source, HierarchyNode<T> target) {
  final x0 = source.x;
  final y0 = source.y;
  final x1 = target.x;
  final y1 = target.y;

  // Curved link using cubic Bezier
  final mx = (x0 + x1) / 2;
  return 'M$x0,${y0}C$mx,$y0 $mx,$y1 $x1,$y1';
}

/// Generates a radial link path between two nodes.
String treeLinkRadial<T>(
    HierarchyNode<T> source, HierarchyNode<T> target, double cx, double cy) {
  final sourceAngle = source.x0;
  final sourceRadius = source.y0;
  final targetAngle = target.x0;
  final targetRadius = target.y0;

  final x0 = cx + sourceRadius * math.cos(sourceAngle);
  final y0 = cy + sourceRadius * math.sin(sourceAngle);
  final x1 = cx + targetRadius * math.cos(targetAngle);
  final y1 = cy + targetRadius * math.sin(targetAngle);

  // Radial curved link
  final midRadius = (sourceRadius + targetRadius) / 2;
  final midAngle = (sourceAngle + targetAngle) / 2;
  final mx = cx + midRadius * math.cos(midAngle);
  final my = cy + midRadius * math.sin(midAngle);

  return 'M$x0,${y0}Q$mx,$my $x1,$y1';
}
