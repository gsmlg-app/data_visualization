import 'package:flutter/material.dart';

class SankeyDiagramExample extends StatelessWidget {
  const SankeyDiagramExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Energy Flow',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            'Source to consumption pathway',
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
                  painter: SankeyDiagramPainter(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SankeyDiagramPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const margin = EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 30);
    final chartWidth = size.width - margin.left - margin.right;
    final chartHeight = size.height - margin.top - margin.bottom;

    // Define nodes in columns
    final columns = [
      // Sources
      [
        _SankeyNode(name: 'Solar', value: 120, color: Colors.amber),
        _SankeyNode(name: 'Wind', value: 80, color: Colors.cyan),
        _SankeyNode(name: 'Coal', value: 150, color: Colors.brown),
        _SankeyNode(name: 'Gas', value: 100, color: Colors.orange),
      ],
      // Intermediate
      [
        _SankeyNode(name: 'Renewable', value: 200, color: Colors.green),
        _SankeyNode(name: 'Fossil', value: 250, color: Colors.grey),
      ],
      // End use
      [
        _SankeyNode(name: 'Industry', value: 180, color: Colors.indigo),
        _SankeyNode(name: 'Transport', value: 120, color: Colors.purple),
        _SankeyNode(name: 'Buildings', value: 150, color: Colors.teal),
      ],
    ];

    // Define flows: (sourceCol, sourceIdx, targetCol, targetIdx, value)
    final flows = [
      (0, 0, 1, 0, 120.0), // Solar -> Renewable
      (0, 1, 1, 0, 80.0),  // Wind -> Renewable
      (0, 2, 1, 1, 150.0), // Coal -> Fossil
      (0, 3, 1, 1, 100.0), // Gas -> Fossil
      (1, 0, 2, 0, 80.0),  // Renewable -> Industry
      (1, 0, 2, 1, 50.0),  // Renewable -> Transport
      (1, 0, 2, 2, 70.0),  // Renewable -> Buildings
      (1, 1, 2, 0, 100.0), // Fossil -> Industry
      (1, 1, 2, 1, 70.0),  // Fossil -> Transport
      (1, 1, 2, 2, 80.0),  // Fossil -> Buildings
    ];

    // Calculate positions
    final nodeWidth = 25.0;
    final colWidth = (chartWidth - nodeWidth) / (columns.length - 1);

    // Position nodes within each column
    final nodePositions = <List<_NodePosition>>[];
    for (int col = 0; col < columns.length; col++) {
      final colNodes = columns[col];
      final totalValue = colNodes.fold(0.0, (sum, n) => sum + n.value);
      final nodeGap = 20.0;
      final availableHeight = chartHeight - (colNodes.length - 1) * nodeGap;

      final positions = <_NodePosition>[];
      double y = margin.top;

      for (final node in colNodes) {
        final nodeHeight = (node.value / totalValue) * availableHeight;
        positions.add(_NodePosition(
          x: margin.left + col * colWidth,
          y: y,
          width: nodeWidth,
          height: nodeHeight,
          node: node,
        ));
        y += nodeHeight + nodeGap;
      }
      nodePositions.add(positions);
    }

    // Track flow offsets for each node
    final sourceOffsets = List.generate(columns.length,
        (col) => List.filled(columns[col].length, 0.0));
    final targetOffsets = List.generate(columns.length,
        (col) => List.filled(columns[col].length, 0.0));

    // Draw flows
    for (final flow in flows) {
      final sourcePos = nodePositions[flow.$1][flow.$2];
      final targetPos = nodePositions[flow.$3][flow.$4];

      final sourceTotalValue = columns[flow.$1][flow.$2].value;
      final targetTotalValue = columns[flow.$3][flow.$4].value;

      final flowHeightSource = (flow.$5 / sourceTotalValue) * sourcePos.height;
      final flowHeightTarget = (flow.$5 / targetTotalValue) * targetPos.height;

      final sourceY = sourcePos.y + sourceOffsets[flow.$1][flow.$2];
      final targetY = targetPos.y + targetOffsets[flow.$3][flow.$4];

      sourceOffsets[flow.$1][flow.$2] += flowHeightSource;
      targetOffsets[flow.$3][flow.$4] += flowHeightTarget;

      // Draw flow path
      final path = Path();
      final x0 = sourcePos.x + sourcePos.width;
      final x1 = targetPos.x;
      final controlX = (x0 + x1) / 2;

      path.moveTo(x0, sourceY);
      path.cubicTo(
        controlX, sourceY,
        controlX, targetY,
        x1, targetY,
      );
      path.lineTo(x1, targetY + flowHeightTarget);
      path.cubicTo(
        controlX, targetY + flowHeightTarget,
        controlX, sourceY + flowHeightSource,
        x0, sourceY + flowHeightSource,
      );
      path.close();

      final flowColor = Color.lerp(
        sourcePos.node.color,
        targetPos.node.color,
        0.5,
      )!.withAlpha(120);

      canvas.drawPath(path, Paint()..color = flowColor);
    }

    // Draw nodes
    for (final colPositions in nodePositions) {
      for (final pos in colPositions) {
        final rect = RRect.fromRectAndRadius(
          Rect.fromLTWH(pos.x, pos.y, pos.width, pos.height),
          const Radius.circular(4),
        );
        canvas.drawRRect(rect, Paint()..color = pos.node.color);
        canvas.drawRRect(
          rect,
          Paint()
            ..color = pos.node.color.withAlpha(200)
            ..strokeWidth = 1
            ..style = PaintingStyle.stroke,
        );
      }
    }

    // Draw labels
    final textPainter = TextPainter(textDirection: TextDirection.ltr);
    for (int col = 0; col < nodePositions.length; col++) {
      for (final pos in nodePositions[col]) {
        textPainter.text = TextSpan(
          text: pos.node.name,
          style: TextStyle(
            color: pos.node.color,
            fontSize: 11,
            fontWeight: FontWeight.w600,
          ),
        );
        textPainter.layout();

        double labelX;
        if (col == 0) {
          labelX = pos.x - textPainter.width - 8;
        } else if (col == nodePositions.length - 1) {
          labelX = pos.x + pos.width + 8;
        } else {
          labelX = pos.x + pos.width / 2 - textPainter.width / 2;
        }

        textPainter.paint(
          canvas,
          Offset(labelX, pos.y + pos.height / 2 - textPainter.height / 2),
        );

        // Value label
        textPainter.text = TextSpan(
          text: '${pos.node.value.toInt()}',
          style: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 9,
          ),
        );
        textPainter.layout();

        if (col == 0) {
          textPainter.paint(
            canvas,
            Offset(pos.x - textPainter.width - 8, pos.y + pos.height / 2 + 8),
          );
        } else if (col == nodePositions.length - 1) {
          textPainter.paint(
            canvas,
            Offset(pos.x + pos.width + 8, pos.y + pos.height / 2 + 8),
          );
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _SankeyNode {
  final String name;
  final double value;
  final Color color;

  _SankeyNode({required this.name, required this.value, required this.color});
}

class _NodePosition {
  final double x;
  final double y;
  final double width;
  final double height;
  final _SankeyNode node;

  _NodePosition({
    required this.x,
    required this.y,
    required this.width,
    required this.height,
    required this.node,
  });
}
