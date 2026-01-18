import 'dart:math' as math;
import 'package:flutter/material.dart';

class PackExample extends StatelessWidget {
  const PackExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Circle Packing',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            'Hierarchical data as nested circles',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.grey.shade600,
                ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return CustomPaint(
                  size: Size(constraints.maxWidth, constraints.maxHeight),
                  painter: PackPainter(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _PackNode {
  final String name;
  final double? value;
  final List<_PackNode> children;
  double x = 0;
  double y = 0;
  double r = 0;
  int depth = 0;

  _PackNode(this.name, {this.value, this.children = const []});

  bool get isLeaf => children.isEmpty;
}

class PackPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Build hierarchy
    final root = _PackNode('Root', children: [
      _PackNode('Tech', children: [
        _PackNode('Frontend', children: [
          _PackNode('React', value: 80),
          _PackNode('Vue', value: 45),
          _PackNode('Angular', value: 35),
        ]),
        _PackNode('Backend', children: [
          _PackNode('Node', value: 70),
          _PackNode('Python', value: 60),
          _PackNode('Go', value: 40),
        ]),
        _PackNode('Mobile', children: [
          _PackNode('Flutter', value: 55),
          _PackNode('React Native', value: 50),
        ]),
      ]),
      _PackNode('Design', children: [
        _PackNode('UI', value: 65),
        _PackNode('UX', value: 55),
        _PackNode('Brand', value: 40),
      ]),
      _PackNode('Data', children: [
        _PackNode('Analytics', value: 50),
        _PackNode('ML', value: 75),
        _PackNode('Viz', value: 45),
      ]),
    ]);

    // Calculate values and layout
    _calculateValues(root);
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width, size.height) / 2 - 20;
    _packLayout(root, center.dx, center.dy, radius);

    // Draw circles
    _drawCircles(canvas, root);
  }

  void _calculateValues(_PackNode node) {
    if (node.isLeaf) {
      node.r = math.sqrt(node.value ?? 1);
      return;
    }

    for (final child in node.children) {
      _calculateValues(child);
    }

    // Sum of children radii as proxy for parent size
    final childSum = node.children.fold(0.0, (sum, c) => sum + c.r * c.r);
    node.r = math.sqrt(childSum) * 1.5;
  }

  void _packLayout(_PackNode node, double cx, double cy, double maxR, [int depth = 0]) {
    node.x = cx;
    node.y = cy;
    node.depth = depth;

    if (node.isLeaf) {
      // Scale leaf radius to fit
      final scale = maxR / (node.r * 2);
      node.r = node.r * scale * 0.9;
      return;
    }

    // Simple circular packing for children
    final totalChildR = node.children.fold(0.0, (sum, c) => sum + c.r);
    final availableR = maxR * 0.85;
    final scale = availableR / (totalChildR * 1.2);

    // Position children in a circle
    final n = node.children.length;
    final childPositions = <Offset>[];

    if (n == 1) {
      childPositions.add(Offset(cx, cy));
    } else {
      final angleStep = 2 * math.pi / n;
      final placementR = availableR * 0.5;

      for (int i = 0; i < n; i++) {
        final angle = -math.pi / 2 + i * angleStep;
        childPositions.add(Offset(
          cx + placementR * math.cos(angle),
          cy + placementR * math.sin(angle),
        ));
      }
    }

    for (int i = 0; i < node.children.length; i++) {
      final child = node.children[i];
      final pos = childPositions[i];
      final childR = child.r * scale;
      _packLayout(child, pos.dx, pos.dy, childR, depth + 1);
    }

    node.r = maxR;
  }

  void _drawCircles(Canvas canvas, _PackNode node) {
    final colors = [
      Colors.grey.shade200,
      Colors.indigo.withAlpha(40),
      Colors.teal.withAlpha(60),
      Colors.orange.withAlpha(80),
      Colors.purple.withAlpha(100),
    ];

    final strokeColors = [
      Colors.grey.shade400,
      Colors.indigo.withAlpha(150),
      Colors.teal.withAlpha(180),
      Colors.orange.withAlpha(200),
      Colors.purple.withAlpha(220),
    ];

    final color = colors[node.depth % colors.length];
    final strokeColor = strokeColors[node.depth % strokeColors.length];

    // Draw circle
    canvas.drawCircle(
      Offset(node.x, node.y),
      node.r,
      Paint()..color = color,
    );
    canvas.drawCircle(
      Offset(node.x, node.y),
      node.r,
      Paint()
        ..color = strokeColor
        ..strokeWidth = node.isLeaf ? 1 : 2
        ..style = PaintingStyle.stroke,
    );

    // Draw label for leaves
    if (node.isLeaf && node.r > 15) {
      final textPainter = TextPainter(
        text: TextSpan(
          text: node.name,
          style: TextStyle(
            color: Colors.grey.shade800,
            fontSize: math.min(node.r * 0.4, 12),
            fontWeight: FontWeight.w500,
          ),
        ),
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center,
      );
      textPainter.layout(maxWidth: node.r * 1.8);
      textPainter.paint(
        canvas,
        Offset(node.x - textPainter.width / 2, node.y - textPainter.height / 2),
      );
    } else if (!node.isLeaf && node.depth <= 1) {
      // Draw label for top-level groups
      final textPainter = TextPainter(
        text: TextSpan(
          text: node.name,
          style: TextStyle(
            color: strokeColor,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(node.x - textPainter.width / 2, node.y - node.r + 10),
      );
    }

    // Draw children
    for (final child in node.children) {
      _drawCircles(canvas, child);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
