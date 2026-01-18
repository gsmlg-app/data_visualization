import 'dart:math' as math;
import 'package:flutter/material.dart';

class TreeExample extends StatefulWidget {
  const TreeExample({super.key});

  @override
  State<TreeExample> createState() => _TreeExampleState();
}

class _TreeExampleState extends State<TreeExample> {
  String _orientation = 'Vertical';
  final orientations = ['Vertical', 'Horizontal', 'Radial'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Tree / Dendrogram',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const Spacer(),
              Wrap(
                spacing: 8,
                children: orientations.map((o) {
                  return ChoiceChip(
                    label: Text(o),
                    selected: _orientation == o,
                    onSelected: (_) => setState(() => _orientation = o),
                  );
                }).toList(),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return CustomPaint(
                      size: Size(constraints.maxWidth, constraints.maxHeight),
                      painter: TreePainter(orientation: _orientation),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TreeNode {
  final String name;
  final List<_TreeNode> children;
  double x = 0;
  double y = 0;

  _TreeNode(this.name, [this.children = const []]);
}

class TreePainter extends CustomPainter {
  final String orientation;

  TreePainter({required this.orientation});

  @override
  void paint(Canvas canvas, Size size) {
    // Build tree structure
    final root = _TreeNode('CEO', [
      _TreeNode('CTO', [
        _TreeNode('Dev Lead', [
          _TreeNode('Dev 1'),
          _TreeNode('Dev 2'),
          _TreeNode('Dev 3'),
        ]),
        _TreeNode('QA Lead', [
          _TreeNode('QA 1'),
          _TreeNode('QA 2'),
        ]),
      ]),
      _TreeNode('CFO', [
        _TreeNode('Accounting', [
          _TreeNode('Acc 1'),
        ]),
        _TreeNode('Finance'),
      ]),
      _TreeNode('COO', [
        _TreeNode('HR', [
          _TreeNode('HR 1'),
          _TreeNode('HR 2'),
        ]),
        _TreeNode('Operations'),
      ]),
    ]);

    // Layout tree
    if (orientation == 'Radial') {
      _layoutRadial(root, size);
    } else {
      _layoutLinear(root, size, orientation == 'Horizontal');
    }

    // Draw tree
    _drawTree(canvas, root, size);
  }

  void _layoutLinear(_TreeNode node, Size size, bool horizontal) {
    final margin = 60.0;
    final width = size.width - margin * 2;
    final height = size.height - margin * 2;

    // Count leaves and depth
    int countLeaves(_TreeNode n) {
      if (n.children.isEmpty) return 1;
      return n.children.fold(0, (sum, c) => sum + countLeaves(c));
    }

    int getDepth(_TreeNode n) {
      if (n.children.isEmpty) return 0;
      return 1 + n.children.map(getDepth).reduce((a, b) => a > b ? a : b);
    }

    final totalLeaves = countLeaves(node);
    final maxDepth = getDepth(node);

    void layout(_TreeNode n, int depth, int leafStart, int leafEnd) {
      if (horizontal) {
        n.x = margin + (depth / maxDepth) * width;
        n.y = margin + ((leafStart + leafEnd) / 2 / totalLeaves) * height;
      } else {
        n.x = margin + ((leafStart + leafEnd) / 2 / totalLeaves) * width;
        n.y = margin + (depth / maxDepth) * height;
      }

      if (n.children.isEmpty) return;

      int currentLeaf = leafStart;
      for (final child in n.children) {
        final childLeaves = countLeaves(child);
        layout(child, depth + 1, currentLeaf, currentLeaf + childLeaves);
        currentLeaf += childLeaves;
      }
    }

    layout(node, 0, 0, totalLeaves);
  }

  void _layoutRadial(_TreeNode node, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width, size.height) / 2 - 80;

    int countLeaves(_TreeNode n) {
      if (n.children.isEmpty) return 1;
      return n.children.fold(0, (sum, c) => sum + countLeaves(c));
    }

    int getDepth(_TreeNode n) {
      if (n.children.isEmpty) return 0;
      return 1 + n.children.map(getDepth).reduce((a, b) => a > b ? a : b);
    }

    final totalLeaves = countLeaves(node);
    final maxDepth = getDepth(node);

    void layout(_TreeNode n, int depth, double angleStart, double angleEnd) {
      if (depth == 0) {
        n.x = center.dx;
        n.y = center.dy;
      } else {
        final angle = (angleStart + angleEnd) / 2 - math.pi / 2;
        final r = (depth / maxDepth) * radius;
        n.x = center.dx + r * math.cos(angle);
        n.y = center.dy + r * math.sin(angle);
      }

      if (n.children.isEmpty) return;

      double currentAngle = angleStart;

      for (final child in n.children) {
        final childLeaves = countLeaves(child);
        final childAngleRange = (childLeaves / totalLeaves) * 2 * math.pi;
        layout(child, depth + 1, currentAngle, currentAngle + childAngleRange);
        currentAngle += childAngleRange;
      }
    }

    layout(node, 0, 0, 2 * math.pi);
  }

  void _drawTree(Canvas canvas, _TreeNode node, Size size) {
    // Draw links first
    void drawLinks(_TreeNode n) {
      for (final child in n.children) {
        // Draw curved link
        final path = Path();
        path.moveTo(n.x, n.y);

        if (orientation == 'Horizontal') {
          final midX = (n.x + child.x) / 2;
          path.cubicTo(midX, n.y, midX, child.y, child.x, child.y);
        } else if (orientation == 'Vertical') {
          final midY = (n.y + child.y) / 2;
          path.cubicTo(n.x, midY, child.x, midY, child.x, child.y);
        } else {
          // Radial - straight lines work better
          path.lineTo(child.x, child.y);
        }

        canvas.drawPath(
          path,
          Paint()
            ..color = Colors.grey.withAlpha(100)
            ..strokeWidth = 1.5
            ..style = PaintingStyle.stroke,
        );

        drawLinks(child);
      }
    }

    drawLinks(node);

    // Draw nodes
    void drawNodes(_TreeNode n, int depth) {
      final colors = [
        Colors.indigo,
        Colors.teal,
        Colors.orange,
        Colors.purple,
        Colors.pink,
      ];
      final color = colors[depth % colors.length];
      final nodeRadius = n.children.isEmpty ? 6.0 : 10.0;

      // Shadow
      canvas.drawCircle(
        Offset(n.x + 1, n.y + 1),
        nodeRadius,
        Paint()..color = Colors.black12,
      );

      // Node
      canvas.drawCircle(
        Offset(n.x, n.y),
        nodeRadius,
        Paint()..color = color,
      );
      canvas.drawCircle(
        Offset(n.x, n.y),
        nodeRadius,
        Paint()
          ..color = Colors.white
          ..strokeWidth = 2
          ..style = PaintingStyle.stroke,
      );

      // Label
      final textPainter = TextPainter(
        text: TextSpan(
          text: n.name,
          style: TextStyle(
            color: Colors.grey.shade700,
            fontSize: 10,
            fontWeight: n.children.isEmpty ? FontWeight.normal : FontWeight.w600,
          ),
        ),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();

      double labelX, labelY;
      if (orientation == 'Horizontal') {
        labelX = n.x - textPainter.width / 2;
        labelY = n.y - nodeRadius - textPainter.height - 4;
      } else if (orientation == 'Vertical') {
        if (n.children.isEmpty) {
          labelX = n.x + nodeRadius + 4;
          labelY = n.y - textPainter.height / 2;
        } else {
          labelX = n.x - textPainter.width / 2;
          labelY = n.y - nodeRadius - textPainter.height - 4;
        }
      } else {
        labelX = n.x - textPainter.width / 2;
        labelY = n.y + nodeRadius + 4;
      }

      textPainter.paint(canvas, Offset(labelX, labelY));

      for (final child in n.children) {
        drawNodes(child, depth + 1);
      }
    }

    drawNodes(node, 0);
  }

  @override
  bool shouldRepaint(covariant TreePainter oldDelegate) =>
      oldDelegate.orientation != orientation;
}
