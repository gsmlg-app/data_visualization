import 'dart:math' as math;
import 'hierarchy.dart';

/// Computes a partition layout (also known as icicle or sunburst).
///
/// The partition layout recursively subdivides a rectangular area
/// into strips, with each level representing a depth in the hierarchy.
class Partition<T> {
  /// The width of the layout.
  double width;

  /// The height of the layout.
  double height;

  /// Padding between adjacent rectangles.
  double padding;

  /// Whether to round coordinates to integers.
  bool round;

  /// Creates a partition layout.
  Partition({
    this.width = 1,
    this.height = 1,
    this.padding = 0,
    this.round = false,
  });

  /// Sets the size of the layout.
  Partition<T> size(double w, double h) {
    width = w;
    height = h;
    return this;
  }

  /// Computes the partition layout for the given hierarchy.
  HierarchyNode<T> layout(HierarchyNode<T> root) {
    final maxDepth = root.height;

    // Layout using depth-first traversal
    _layoutNode(root, 0, width, 0, maxDepth);

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

  void _layoutNode(
      HierarchyNode<T> node, double x0, double x1, int depth, int maxDepth) {
    // Calculate vertical position based on depth
    final layerHeight = height / (maxDepth + 1);
    node.y0 = depth * layerHeight;
    node.y1 = (depth + 1) * layerHeight - padding;
    node.x0 = x0;
    node.x1 = x1 - (x1 > x0 ? padding : 0);

    if (node.children.isEmpty) return;

    // Calculate scale factor
    final nodeValue = node.value ?? 0;
    final availableWidth = x1 - x0 - padding;

    if (nodeValue <= 0) return;

    // Layout children
    var childX = x0;
    for (final child in node.children) {
      final childValue = child.value ?? 0;
      final childWidth = availableWidth * childValue / nodeValue;
      _layoutNode(child, childX, childX + childWidth, depth + 1, maxDepth);
      childX += childWidth;
    }
  }

  /// Creates a radial (sunburst) version of the partition layout.
  ///
  /// Returns the same node with x,y coordinates for the center of each arc,
  /// and x0,y0,x1,y1 representing startAngle, endAngle, innerRadius, outerRadius.
  HierarchyNode<T> radialLayout(HierarchyNode<T> root) {
    final maxDepth = root.height;

    // First do normal partition layout in normalized coordinates
    final tempPartition = Partition<T>(width: 2 * math.pi, height: 1);
    tempPartition._layoutNode(root, 0, 2 * math.pi, 0, maxDepth);

    // Convert to radial coordinates
    final innerRadius = math.min(width, height) * 0.1;
    final outerRadius = math.min(width, height) / 2;

    for (final node in root.descendants()) {
      // x0, x1 become angles
      final startAngle = node.x0;
      final endAngle = node.x1;

      // y0, y1 become radii
      final innerR = innerRadius + node.y0 * (outerRadius - innerRadius);
      final outerR = innerRadius + node.y1 * (outerRadius - innerRadius);

      // Store in the node
      node.x0 = startAngle;
      node.x1 = endAngle;
      node.y0 = innerR;
      node.y1 = outerR;

      // Center coordinates (midpoint of arc)
      final midAngle = (startAngle + endAngle) / 2;
      final midRadius = (innerR + outerR) / 2;
      node.x = width / 2 + midRadius * math.cos(midAngle - math.pi / 2);
      node.y = height / 2 + midRadius * math.sin(midAngle - math.pi / 2);
    }

    return root;
  }
}

/// Creates a partition layout with default settings.
Partition<T> partition<T>() => Partition<T>();

/// Creates a partition layout with the given size.
Partition<T> partitionWithSize<T>(double width, double height) =>
    Partition<T>(width: width, height: height);

/// Generates an arc path string for a radial partition node.
///
/// The node's x0,x1 should contain startAngle,endAngle and
/// y0,y1 should contain innerRadius,outerRadius.
String partitionArc<T>(HierarchyNode<T> node, double centerX, double centerY) {
  final startAngle = node.x0 - math.pi / 2;
  final endAngle = node.x1 - math.pi / 2;
  final innerRadius = node.y0;
  final outerRadius = node.y1;

  final largeArc = (endAngle - startAngle) > math.pi ? 1 : 0;

  final innerStartX = centerX + innerRadius * math.cos(startAngle);
  final innerStartY = centerY + innerRadius * math.sin(startAngle);
  final innerEndX = centerX + innerRadius * math.cos(endAngle);
  final innerEndY = centerY + innerRadius * math.sin(endAngle);

  final outerStartX = centerX + outerRadius * math.cos(startAngle);
  final outerStartY = centerY + outerRadius * math.sin(startAngle);
  final outerEndX = centerX + outerRadius * math.cos(endAngle);
  final outerEndY = centerY + outerRadius * math.sin(endAngle);

  return 'M$outerStartX,$outerStartY'
      'A$outerRadius,$outerRadius 0 $largeArc,1 $outerEndX,$outerEndY'
      'L$innerEndX,$innerEndY'
      'A$innerRadius,$innerRadius 0 $largeArc,0 $innerStartX,$innerStartY'
      'Z';
}
