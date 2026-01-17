import 'package:flutter/material.dart';
import 'package:data_visualization/data_visualization.dart';

class HierarchyExample extends StatelessWidget {
  const HierarchyExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return CustomPaint(
            size: Size(constraints.maxWidth, constraints.maxHeight),
            painter: TreemapPainter(),
          );
        },
      ),
    );
  }
}

class TreemapPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Build hierarchy
    final root = HierarchyNode<Map<String, dynamic>>(
      data: {'name': 'Root'},
      children: [
        HierarchyNode(
          data: {'name': 'Category A'},
          children: [
            HierarchyNode(data: {'name': 'A1', 'value': 100}),
            HierarchyNode(data: {'name': 'A2', 'value': 80}),
            HierarchyNode(data: {'name': 'A3', 'value': 60}),
          ],
        ),
        HierarchyNode(
          data: {'name': 'Category B'},
          children: [
            HierarchyNode(data: {'name': 'B1', 'value': 120}),
            HierarchyNode(data: {'name': 'B2', 'value': 90}),
          ],
        ),
        HierarchyNode(
          data: {'name': 'Category C'},
          children: [
            HierarchyNode(data: {'name': 'C1', 'value': 150}),
            HierarchyNode(data: {'name': 'C2', 'value': 70}),
            HierarchyNode(data: {'name': 'C3', 'value': 50}),
            HierarchyNode(data: {'name': 'C4', 'value': 40}),
          ],
        ),
      ],
    );

    // Calculate values
    root.sum((d) => (d['value'] as num?)?.toDouble() ?? 0);

    // Apply treemap layout
    final treemapLayout = Treemap<Map<String, dynamic>>()
      ..size(size.width, size.height);
    treemapLayout.layout(root);

    // Colors for each category
    final categoryColors = {
      'Category A': Colors.indigo,
      'Category B': Colors.teal,
      'Category C': Colors.orange,
    };

    final textPainter = TextPainter(textDirection: TextDirection.ltr);

    // Draw leaves
    for (final node in root.descendants()) {
      if (node.children.isEmpty) {
        // Find parent category
        var parent = node.parent;
        while (parent != null && parent.parent != root) {
          parent = parent.parent;
        }
        final categoryName = parent?.data['name'] as String? ?? '';
        final color = categoryColors[categoryName] ?? Colors.grey;

        final rect = Rect.fromLTRB(node.x0, node.y0, node.x1, node.y1);

        // Draw rectangle
        canvas.drawRect(
          rect,
          Paint()..color = color.withAlpha(200),
        );

        // Draw border
        canvas.drawRect(
          rect,
          Paint()
            ..color = Colors.white
            ..strokeWidth = 2
            ..style = PaintingStyle.stroke,
        );

        // Draw label if space allows
        final width = node.x1 - node.x0;
        final height = node.y1 - node.y0;
        if (width > 40 && height > 30) {
          final name = node.data['name'] as String;
          final value = node.data['value'];

          textPainter.text = TextSpan(
            text: name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          );
          textPainter.layout(maxWidth: width - 8);
          textPainter.paint(
            canvas,
            Offset(node.x0 + 4, node.y0 + 4),
          );

          if (height > 50 && value != null) {
            textPainter.text = TextSpan(
              text: value.toString(),
              style: TextStyle(
                color: Colors.white.withAlpha(200),
                fontSize: 11,
              ),
            );
            textPainter.layout(maxWidth: width - 8);
            textPainter.paint(
              canvas,
              Offset(node.x0 + 4, node.y0 + 20),
            );
          }
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
