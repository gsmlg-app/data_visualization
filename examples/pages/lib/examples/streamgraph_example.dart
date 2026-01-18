import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:data_visualization/data_visualization.dart';

class StreamgraphExample extends StatelessWidget {
  const StreamgraphExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Music Genre Popularity Over Time',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return CustomPaint(
                  size: Size(constraints.maxWidth, constraints.maxHeight),
                  painter: StreamgraphPainter(),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 16,
            runSpacing: 8,
            children: [
              _legendItem(Colors.indigo, 'Rock'),
              _legendItem(Colors.teal, 'Pop'),
              _legendItem(Colors.orange, 'Hip Hop'),
              _legendItem(Colors.purple, 'Electronic'),
              _legendItem(Colors.pink, 'Jazz'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _legendItem(Color color, String label) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: color.withAlpha(180),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: 8),
        Text(label),
      ],
    );
  }
}

class StreamgraphPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const margin = EdgeInsets.only(left: 50, right: 20, top: 20, bottom: 40);
    final chartWidth = size.width - margin.left - margin.right;
    final chartHeight = size.height - margin.top - margin.bottom;

    // Generate data for 5 genres over 20 time points
    final random = math.Random(42);
    const numPoints = 20;
    const numLayers = 5;

    final data = List.generate(numLayers, (layer) {
      return List.generate(numPoints, (i) {
        final base = 10.0 + layer * 5;
        final amplitude = 15.0 + random.nextDouble() * 10;
        final frequency = 0.3 + random.nextDouble() * 0.2;
        final phase = layer * 0.5;
        return base + amplitude * math.sin(i * frequency + phase).abs();
      });
    });

    // Calculate stacked values with wiggle offset for streamgraph effect
    final stackedData = <List<(double, double)>>[];
    for (int layer = 0; layer < numLayers; layer++) {
      stackedData.add([]);
    }

    for (int i = 0; i < numPoints; i++) {
      double total = 0;
      for (int layer = 0; layer < numLayers; layer++) {
        total += data[layer][i];
      }

      // Center the stream around the middle
      double offset = -total / 2;
      for (int layer = 0; layer < numLayers; layer++) {
        final y0 = offset;
        final y1 = offset + data[layer][i];
        stackedData[layer].add((y0, y1));
        offset = y1;
      }
    }

    // Find min/max for y scale
    double minY = 0, maxY = 0;
    for (final layer in stackedData) {
      for (final point in layer) {
        if (point.$1 < minY) minY = point.$1;
        if (point.$2 > maxY) maxY = point.$2;
      }
    }

    final xScale = scaleLinear(
      domain: [0, numPoints - 1],
      range: [margin.left, margin.left + chartWidth],
    );

    final yScale = scaleLinear(
      domain: [minY * 1.1, maxY * 1.1],
      range: [margin.top + chartHeight, margin.top],
    );

    // Draw center line
    canvas.drawLine(
      Offset(margin.left, yScale(0)),
      Offset(margin.left + chartWidth, yScale(0)),
      Paint()
        ..color = Colors.grey.withAlpha(100)
        ..strokeWidth = 1,
    );

    final colors = [
      Colors.indigo,
      Colors.teal,
      Colors.orange,
      Colors.purple,
      Colors.pink,
    ];

    final curve = curveBasis();

    // Draw streams from bottom to top
    for (int layer = 0; layer < numLayers; layer++) {
      final topPoints = <Point>[];
      final bottomPoints = <Point>[];

      for (int i = 0; i < numPoints; i++) {
        final x = xScale(i.toDouble());
        topPoints.add(Point(x, yScale(stackedData[layer][i].$2)));
        bottomPoints.add(Point(x, yScale(stackedData[layer][i].$1)));
      }

      final smoothTop = curve.generate(topPoints);
      final smoothBottom = curve.generate(bottomPoints);

      if (smoothTop.isEmpty || smoothBottom.isEmpty) continue;

      final path = Path();
      path.moveTo(smoothTop.first.x, smoothTop.first.y);
      for (int i = 1; i < smoothTop.length; i++) {
        path.lineTo(smoothTop[i].x, smoothTop[i].y);
      }
      for (int i = smoothBottom.length - 1; i >= 0; i--) {
        path.lineTo(smoothBottom[i].x, smoothBottom[i].y);
      }
      path.close();

      canvas.drawPath(path, Paint()..color = colors[layer].withAlpha(180));

      // Draw top edge
      final edgePath = Path();
      edgePath.moveTo(smoothTop.first.x, smoothTop.first.y);
      for (int i = 1; i < smoothTop.length; i++) {
        edgePath.lineTo(smoothTop[i].x, smoothTop[i].y);
      }
      canvas.drawPath(
        edgePath,
        Paint()
          ..color = colors[layer].withAlpha(255)
          ..strokeWidth = 1
          ..style = PaintingStyle.stroke,
      );
    }

    // Draw axes
    final axisPaint = Paint()
      ..color = Colors.black54
      ..strokeWidth = 1;

    canvas.drawLine(
      Offset(margin.left, margin.top + chartHeight),
      Offset(margin.left + chartWidth, margin.top + chartHeight),
      axisPaint,
    );

    // X axis labels (years)
    final textPainter = TextPainter(textDirection: TextDirection.ltr);
    final years = ['2005', '2010', '2015', '2020', '2025'];
    for (int i = 0; i < years.length; i++) {
      final x = margin.left + (i / (years.length - 1)) * chartWidth;
      textPainter.text = TextSpan(
        text: years[i],
        style: const TextStyle(color: Colors.black54, fontSize: 11),
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(x - textPainter.width / 2, margin.top + chartHeight + 8),
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
