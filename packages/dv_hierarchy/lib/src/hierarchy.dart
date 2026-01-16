
/// Represents a node in a hierarchical data structure.
///
/// Each node has a value, optional data, and can have children.
/// The hierarchy supports various layout algorithms like treemap,
/// circle packing, partition, and tree layouts.
class HierarchyNode<T> {
  /// The data associated with this node.
  final T data;

  /// The depth of this node (root = 0).
  int depth;

  /// The height of this node (leaves = 0).
  int height;

  /// The parent node, or null if this is the root.
  HierarchyNode<T>? parent;

  /// The children of this node.
  List<HierarchyNode<T>> children;

  /// The numeric value of this node.
  /// For leaves, this is typically the node's own value.
  /// For internal nodes, this is typically the sum of descendants.
  double? value;

  /// Layout coordinates (set by layout algorithms).
  double x;
  double y;

  /// For rectangular layouts (treemap, partition).
  double x0;
  double y0;
  double x1;
  double y1;

  /// For circular layouts (pack, radial tree).
  double r;

  /// Creates a hierarchy node.
  HierarchyNode({
    required this.data,
    this.depth = 0,
    this.height = 0,
    this.parent,
    List<HierarchyNode<T>>? children,
    this.value,
    this.x = 0,
    this.y = 0,
    this.x0 = 0,
    this.y0 = 0,
    this.x1 = 0,
    this.y1 = 0,
    this.r = 0,
  }) : children = children ?? [];

  /// Creates a hierarchy from nested data.
  ///
  /// [data] is the root data.
  /// [children] extracts children from a data element.
  factory HierarchyNode.fromData(
    T data, {
    List<T> Function(T)? children,
  }) {
    final root = HierarchyNode<T>(data: data);
    root._buildTree(children ?? (_) => []);
    root._computeHeights();
    return root;
  }

  /// Creates a hierarchy from a flat list with id and parent id.
  ///
  /// [data] is the list of data elements.
  /// [id] extracts the id from a data element.
  /// [parentId] extracts the parent id from a data element.
  static HierarchyNode<T>? stratify<T>({
    required List<T> data,
    required String Function(T) id,
    required String? Function(T) parentId,
  }) {
    if (data.isEmpty) return null;

    // Create nodes for all data
    final nodeMap = <String, HierarchyNode<T>>{};
    for (final d in data) {
      final nodeId = id(d);
      nodeMap[nodeId] = HierarchyNode<T>(data: d);
    }

    // Find root and build parent-child relationships
    HierarchyNode<T>? root;

    for (final d in data) {
      final nodeId = id(d);
      final pId = parentId(d);
      final node = nodeMap[nodeId]!;

      if (pId == null || pId.isEmpty) {
        if (root != null) {
          throw StateError('Multiple roots found');
        }
        root = node;
      } else {
        final parentNode = nodeMap[pId];
        if (parentNode == null) {
          throw StateError('Parent node not found for id: $pId');
        }
        node.parent = parentNode;
        parentNode.children.add(node);
      }
    }

    if (root == null) {
      throw StateError('No root found');
    }

    // Compute depth and height
    root._computeDepths(0);
    root._computeHeights();

    return root;
  }

  void _buildTree(List<T> Function(T) childrenFn) {
    final childData = childrenFn(data);
    for (final cd in childData) {
      final child = HierarchyNode<T>(data: cd, parent: this, depth: depth + 1);
      children.add(child);
      child._buildTree(childrenFn);
    }
  }

  void _computeDepths(int d) {
    depth = d;
    for (final child in children) {
      child._computeDepths(d + 1);
    }
  }

  void _computeHeights() {
    if (children.isEmpty) {
      height = 0;
    } else {
      height = 0;
      for (final child in children) {
        child._computeHeights();
        if (child.height + 1 > height) {
          height = child.height + 1;
        }
      }
    }
  }

  /// Returns true if this node has no children.
  bool get isLeaf => children.isEmpty;

  /// Returns the root node.
  HierarchyNode<T> get root {
    HierarchyNode<T> node = this;
    while (node.parent != null) {
      node = node.parent!;
    }
    return node;
  }

  /// Returns the ancestors of this node (including itself).
  Iterable<HierarchyNode<T>> ancestors() sync* {
    HierarchyNode<T>? node = this;
    while (node != null) {
      yield node;
      node = node.parent;
    }
  }

  /// Returns the descendants of this node (including itself).
  Iterable<HierarchyNode<T>> descendants() sync* {
    yield this;
    for (final child in children) {
      yield* child.descendants();
    }
  }

  /// Returns the leaves of this subtree.
  Iterable<HierarchyNode<T>> leaves() sync* {
    if (isLeaf) {
      yield this;
    } else {
      for (final child in children) {
        yield* child.leaves();
      }
    }
  }

  /// Returns links (parent-child pairs) in this subtree.
  Iterable<HierarchyLink<T>> links() sync* {
    for (final child in children) {
      yield HierarchyLink(source: this, target: child);
      yield* child.links();
    }
  }

  /// Returns the path from this node to the target node.
  List<HierarchyNode<T>> path(HierarchyNode<T> target) {
    final start = this;
    final end = target;
    final startAncestors = start.ancestors().toList();
    final endAncestors = end.ancestors().toList();

    // Find common ancestor
    int common = 0;
    final startSet = startAncestors.toSet();
    for (int i = 0; i < endAncestors.length; i++) {
      if (startSet.contains(endAncestors[i])) {
        common = startAncestors.indexOf(endAncestors[i]);
        break;
      }
    }

    // Build path
    final path = startAncestors.sublist(0, common + 1);
    final endPath = <HierarchyNode<T>>[];
    for (final a in endAncestors) {
      if (a == startAncestors[common]) break;
      endPath.add(a);
    }
    path.addAll(endPath.reversed);

    return path;
  }

  /// Sums the values in the subtree using the given value accessor.
  HierarchyNode<T> sum(double Function(T) valueFn) {
    // Use post-order traversal so children are computed before parents
    for (final node in postOrder()) {
      if (node.isLeaf) {
        node.value = valueFn(node.data);
      } else {
        double sum = 0;
        for (final child in node.children) {
          if (child.value != null) {
            sum += child.value!;
          }
        }
        node.value = sum;
      }
    }
    return this;
  }

  /// Counts the number of leaves in each subtree.
  HierarchyNode<T> count() {
    // Use post-order traversal so children are computed before parents
    for (final node in postOrder()) {
      if (node.isLeaf) {
        node.value = 1;
      } else {
        double sum = 0;
        for (final child in node.children) {
          if (child.value != null) {
            sum += child.value!;
          }
        }
        node.value = sum;
      }
    }
    return this;
  }

  /// Sorts the children of each node using the given comparator.
  HierarchyNode<T> sort(int Function(HierarchyNode<T>, HierarchyNode<T>) compare) {
    for (final node in descendants()) {
      node.children.sort(compare);
    }
    return this;
  }

  /// Iterates over nodes in breadth-first order.
  Iterable<HierarchyNode<T>> bfs() sync* {
    final queue = <HierarchyNode<T>>[this];
    while (queue.isNotEmpty) {
      final node = queue.removeAt(0);
      yield node;
      queue.addAll(node.children);
    }
  }

  /// Iterates over nodes in depth-first pre-order.
  Iterable<HierarchyNode<T>> preOrder() sync* {
    yield this;
    for (final child in children) {
      yield* child.preOrder();
    }
  }

  /// Iterates over nodes in depth-first post-order.
  Iterable<HierarchyNode<T>> postOrder() sync* {
    for (final child in children) {
      yield* child.postOrder();
    }
    yield this;
  }

  /// Returns all nodes at a specific depth.
  List<HierarchyNode<T>> nodesAtDepth(int d) {
    return descendants().where((n) => n.depth == d).toList();
  }

  /// Applies a function to each node.
  HierarchyNode<T> each(void Function(HierarchyNode<T>) fn) {
    for (final node in descendants()) {
      fn(node);
    }
    return this;
  }

  /// Applies a function to each node after visiting children.
  HierarchyNode<T> eachAfter(void Function(HierarchyNode<T>) fn) {
    for (final node in postOrder()) {
      fn(node);
    }
    return this;
  }

  /// Applies a function to each node before visiting children.
  HierarchyNode<T> eachBefore(void Function(HierarchyNode<T>) fn) {
    for (final node in preOrder()) {
      fn(node);
    }
    return this;
  }

  /// Creates a copy of this subtree.
  HierarchyNode<T> copy() {
    final newNode = HierarchyNode<T>(
      data: data,
      depth: depth,
      height: height,
      value: value,
      x: x,
      y: y,
      x0: x0,
      y0: y0,
      x1: x1,
      y1: y1,
      r: r,
    );

    for (final child in children) {
      final newChild = child.copy();
      newChild.parent = newNode;
      newNode.children.add(newChild);
    }

    return newNode;
  }

  /// Returns the total number of nodes in this subtree.
  int get size => descendants().length;

  /// Returns the width of this node (for rectangular layouts).
  double get width => x1 - x0;

  /// Returns the height of this node (for rectangular layouts).
  double get rectHeight => y1 - y0;

  @override
  String toString() {
    return 'HierarchyNode(data: $data, depth: $depth, height: $height, '
        'value: $value, children: ${children.length})';
  }
}

/// Represents a link between two hierarchy nodes.
class HierarchyLink<T> {
  /// The source (parent) node.
  final HierarchyNode<T> source;

  /// The target (child) node.
  final HierarchyNode<T> target;

  const HierarchyLink({
    required this.source,
    required this.target,
  });

  @override
  String toString() => 'HierarchyLink(source: ${source.data}, target: ${target.data})';
}

/// Extension methods for sorting hierarchy nodes.
extension HierarchyNodeSorting<T> on HierarchyNode<T> {
  /// Sorts by value in ascending order.
  HierarchyNode<T> sortByValueAscending() {
    return sort((a, b) => (a.value ?? 0).compareTo(b.value ?? 0));
  }

  /// Sorts by value in descending order.
  HierarchyNode<T> sortByValueDescending() {
    return sort((a, b) => (b.value ?? 0).compareTo(a.value ?? 0));
  }

  /// Sorts by height in ascending order.
  HierarchyNode<T> sortByHeightAscending() {
    return sort((a, b) => a.height.compareTo(b.height));
  }

  /// Sorts by height in descending order.
  HierarchyNode<T> sortByHeightDescending() {
    return sort((a, b) => b.height.compareTo(a.height));
  }
}
