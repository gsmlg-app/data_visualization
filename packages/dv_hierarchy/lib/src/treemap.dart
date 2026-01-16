import 'dart:math' as math;
import 'hierarchy.dart';

/// Treemap tiling methods.
enum TreemapTiling {
  /// Squarified tiling (default, produces square-ish rectangles).
  squarify,

  /// Binary tiling (recursive binary subdivision).
  binary,

  /// Slice tiling (horizontal strips).
  slice,

  /// Dice tiling (vertical strips).
  dice,

  /// Slice-and-dice tiling (alternates by depth).
  sliceDice,
}

/// Computes a treemap layout for hierarchical data.
///
/// A treemap recursively subdivides a rectangular area into smaller
/// rectangles, with each rectangle's size proportional to its value.
class Treemap<T> {
  /// The width of the treemap.
  double width;

  /// The height of the treemap.
  double height;

  /// The tiling method.
  TreemapTiling tiling;

  /// Padding between parent and children.
  double paddingInner;

  /// Padding around the outer edge.
  double paddingOuter;

  /// Padding at the top (for labels).
  double paddingTop;

  /// Padding at the right.
  double paddingRight;

  /// Padding at the bottom.
  double paddingBottom;

  /// Padding at the left.
  double paddingLeft;

  /// Whether to round coordinates to integers.
  bool round;

  /// Target aspect ratio for squarify tiling.
  double ratio;

  /// Golden ratio constant.
  static final double _goldenRatio = (1 + math.sqrt(5)) / 2;

  /// Creates a treemap layout.
  Treemap({
    this.width = 1,
    this.height = 1,
    this.tiling = TreemapTiling.squarify,
    this.paddingInner = 0,
    this.paddingOuter = 0,
    this.paddingTop = 0,
    this.paddingRight = 0,
    this.paddingBottom = 0,
    this.paddingLeft = 0,
    this.round = false,
    double? ratio,
  }) : ratio = ratio ?? _goldenRatio;

  /// Sets the size of the treemap.
  Treemap<T> size(double w, double h) {
    width = w;
    height = h;
    return this;
  }

  /// Sets uniform padding.
  Treemap<T> padding(double p) {
    paddingInner = p;
    paddingOuter = p;
    paddingTop = p;
    paddingRight = p;
    paddingBottom = p;
    paddingLeft = p;
    return this;
  }

  /// Computes the treemap layout for the given hierarchy.
  HierarchyNode<T> layout(HierarchyNode<T> root) {
    // Initialize root rectangle
    root.x0 = 0;
    root.y0 = 0;
    root.x1 = width;
    root.y1 = height;

    // Apply outer padding to root
    _applyPadding(root);

    // Layout each node
    for (final node in root.preOrder()) {
      if (node.children.isNotEmpty && node.value != null && node.value! > 0) {
        _layoutChildren(node);
      }
    }

    // Round if needed
    if (round) {
      for (final node in root.descendants()) {
        node.x0 = node.x0.roundToDouble();
        node.y0 = node.y0.roundToDouble();
        node.x1 = node.x1.roundToDouble();
        node.y1 = node.y1.roundToDouble();
      }
    }

    // Set center coordinates
    for (final node in root.descendants()) {
      node.x = (node.x0 + node.x1) / 2;
      node.y = (node.y0 + node.y1) / 2;
    }

    return root;
  }

  void _applyPadding(HierarchyNode<T> node) {
    final pt = node.depth == 0 ? paddingOuter : paddingTop + paddingInner;
    final pr = node.depth == 0 ? paddingOuter : paddingRight + paddingInner;
    final pb = node.depth == 0 ? paddingOuter : paddingBottom + paddingInner;
    final pl = node.depth == 0 ? paddingOuter : paddingLeft + paddingInner;

    if (node.x0 + pl < node.x1 - pr) {
      node.x0 += pl;
      node.x1 -= pr;
    } else {
      node.x0 = node.x1 = (node.x0 + node.x1) / 2;
    }

    if (node.y0 + pt < node.y1 - pb) {
      node.y0 += pt;
      node.y1 -= pb;
    } else {
      node.y0 = node.y1 = (node.y0 + node.y1) / 2;
    }
  }

  void _layoutChildren(HierarchyNode<T> parent) {
    final children = parent.children;
    if (children.isEmpty) return;

    // Get parent bounds (after padding)
    final x0 = parent.x0;
    final y0 = parent.y0;
    final x1 = parent.x1;
    final y1 = parent.y1;

    switch (tiling) {
      case TreemapTiling.squarify:
        _squarify(children, x0, y0, x1, y1, parent.value ?? 0);
        break;
      case TreemapTiling.binary:
        _binary(children, x0, y0, x1, y1, parent.value ?? 0);
        break;
      case TreemapTiling.slice:
        _slice(children, x0, y0, x1, y1, parent.value ?? 0);
        break;
      case TreemapTiling.dice:
        _dice(children, x0, y0, x1, y1, parent.value ?? 0);
        break;
      case TreemapTiling.sliceDice:
        if (parent.depth % 2 == 0) {
          _slice(children, x0, y0, x1, y1, parent.value ?? 0);
        } else {
          _dice(children, x0, y0, x1, y1, parent.value ?? 0);
        }
        break;
    }

    // Apply padding to children
    for (final child in children) {
      if (child.children.isNotEmpty) {
        _applyPadding(child);
      }
    }
  }

  void _slice(List<HierarchyNode<T>> nodes, double x0, double y0, double x1,
      double y1, double value) {
    final k = value > 0 ? (y1 - y0) / value : 0;
    var y = y0;

    for (final node in nodes) {
      node.x0 = x0;
      node.x1 = x1;
      node.y0 = y;
      y += (node.value ?? 0) * k;
      node.y1 = y;
    }
  }

  void _dice(List<HierarchyNode<T>> nodes, double x0, double y0, double x1,
      double y1, double value) {
    final k = value > 0 ? (x1 - x0) / value : 0;
    var x = x0;

    for (final node in nodes) {
      node.y0 = y0;
      node.y1 = y1;
      node.x0 = x;
      x += (node.value ?? 0) * k;
      node.x1 = x;
    }
  }

  void _binary(List<HierarchyNode<T>> nodes, double x0, double y0, double x1,
      double y1, double value) {
    if (nodes.isEmpty) return;
    if (nodes.length == 1) {
      nodes[0].x0 = x0;
      nodes[0].y0 = y0;
      nodes[0].x1 = x1;
      nodes[0].y1 = y1;
      return;
    }

    // Sort by value descending
    final sorted = List<HierarchyNode<T>>.from(nodes)
      ..sort((a, b) => (b.value ?? 0).compareTo(a.value ?? 0));

    // Find split point
    double sumLeft = 0;
    final target = value / 2;
    int splitIndex = 0;

    for (int i = 0; i < sorted.length; i++) {
      sumLeft += sorted[i].value ?? 0;
      if (sumLeft >= target) {
        splitIndex = i + 1;
        break;
      }
    }

    if (splitIndex == 0) splitIndex = 1;
    if (splitIndex >= sorted.length) splitIndex = sorted.length - 1;

    final left = sorted.sublist(0, splitIndex);
    final right = sorted.sublist(splitIndex);

    final leftValue = left.fold<double>(0, (sum, n) => sum + (n.value ?? 0));
    final rightValue = right.fold<double>(0, (sum, n) => sum + (n.value ?? 0));

    // Split along longer axis
    if (x1 - x0 > y1 - y0) {
      final k = value > 0 ? (x1 - x0) / value : 0;
      final xMid = x0 + leftValue * k;
      _binary(left, x0, y0, xMid, y1, leftValue);
      _binary(right, xMid, y0, x1, y1, rightValue);
    } else {
      final k = value > 0 ? (y1 - y0) / value : 0;
      final yMid = y0 + leftValue * k;
      _binary(left, x0, y0, x1, yMid, leftValue);
      _binary(right, x0, yMid, x1, y1, rightValue);
    }
  }

  void _squarify(List<HierarchyNode<T>> nodes, double x0, double y0, double x1,
      double y1, double value) {
    if (nodes.isEmpty) return;

    // Calculate scale factor
    final area = (x1 - x0) * (y1 - y0);
    final k = value > 0 ? area / value : 0;

    // Scale node values to areas
    final areas = nodes.map((n) => (n.value ?? 0) * k).toList();

    _squarifyRecursive(nodes, areas, x0, y0, x1, y1);
  }

  void _squarifyRecursive(List<HierarchyNode<T>> nodes, List<double> areas,
      double x0, double y0, double x1, double y1) {
    if (nodes.isEmpty) return;

    if (nodes.length == 1) {
      nodes[0].x0 = x0;
      nodes[0].y0 = y0;
      nodes[0].x1 = x1;
      nodes[0].y1 = y1;
      return;
    }

    final width = x1 - x0;
    final height = y1 - y0;
    final horizontal = width >= height;
    final sideLength = horizontal ? height : width;

    // Find the best row
    int rowEnd = 0;
    double rowArea = 0;
    double rowRatio = double.infinity;

    for (int i = 0; i < nodes.length; i++) {
      rowArea += areas[i];
      final newRatio = _worstRatio(areas.sublist(0, i + 1), sideLength, rowArea);

      if (newRatio <= rowRatio) {
        rowRatio = newRatio;
        rowEnd = i + 1;
      } else {
        break;
      }
    }

    // Layout the row
    final rowNodes = nodes.sublist(0, rowEnd);
    final rowAreas = areas.sublist(0, rowEnd);
    final totalRowArea = rowAreas.fold<double>(0, (a, b) => a + b);

    if (horizontal) {
      final rowWidth = sideLength > 0 ? totalRowArea / sideLength : 0;
      var cy = y0;
      for (int i = 0; i < rowNodes.length; i++) {
        final node = rowNodes[i];
        node.x0 = x0;
        node.x1 = x0 + rowWidth;
        node.y0 = cy;
        cy += rowWidth > 0 ? rowAreas[i] / rowWidth : 0;
        node.y1 = cy;
      }
      // Recurse with remaining nodes
      _squarifyRecursive(
        nodes.sublist(rowEnd),
        areas.sublist(rowEnd),
        x0 + rowWidth,
        y0,
        x1,
        y1,
      );
    } else {
      final rowHeight = sideLength > 0 ? totalRowArea / sideLength : 0;
      var cx = x0;
      for (int i = 0; i < rowNodes.length; i++) {
        final node = rowNodes[i];
        node.y0 = y0;
        node.y1 = y0 + rowHeight;
        node.x0 = cx;
        cx += rowHeight > 0 ? rowAreas[i] / rowHeight : 0;
        node.x1 = cx;
      }
      // Recurse with remaining nodes
      _squarifyRecursive(
        nodes.sublist(rowEnd),
        areas.sublist(rowEnd),
        x0,
        y0 + rowHeight,
        x1,
        y1,
      );
    }
  }

  double _worstRatio(List<double> row, double sideLength, double totalArea) {
    if (row.isEmpty || sideLength <= 0 || totalArea <= 0) return double.infinity;

    double minArea = double.infinity;
    double maxArea = 0;

    for (final area in row) {
      if (area < minArea) minArea = area;
      if (area > maxArea) maxArea = area;
    }

    if (minArea <= 0) return double.infinity;

    final maxRatio = (sideLength * sideLength * maxArea) / (totalArea * totalArea);
    final minRatio = (totalArea * totalArea) / (sideLength * sideLength * minArea);

    return math.max(maxRatio, minRatio);
  }
}

/// Creates a treemap layout with default settings.
Treemap<T> treemap<T>() => Treemap<T>();

/// Creates a treemap layout with the given size.
Treemap<T> treemapWithSize<T>(double width, double height) =>
    Treemap<T>(width: width, height: height);
