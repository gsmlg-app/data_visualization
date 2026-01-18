import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:data_visualization/data_visualization.dart';

class ScatterChartExample extends StatelessWidget {
  const ScatterChartExample({super.key});

  @override
  Widget build(BuildContext context) {
    final random = math.Random(42);
    final data1 = List.generate(30, (i) {
      return (
        random.nextDouble() * 100,
        random.nextDouble() * 100,
        5 + random.nextDouble() * 15,
      );
    });
    final data2 = List.generate(20, (i) {
      return (
        30 + random.nextDouble() * 70,
        20 + random.nextDouble() * 60,
        5 + random.nextDouble() * 10,
      );
    });

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Expanded(
            child: CustomPaint(
              size: Size.infinite,
              painter: ScatterChartPainter(data1: data1, data2: data2),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _legendItem(Colors.indigo.withAlpha(150), 'Group A'),
              const SizedBox(width: 24),
              _legendItem(Colors.orange.withAlpha(150), 'Group B'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _legendItem(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 8),
        Text(label),
      ],
    );
  }
}

class ScatterChartPainter extends CustomPainter {
  final List<(double, double, double)> data1;
  final List<(double, double, double)> data2;

  ScatterChartPainter({required this.data1, required this.data2});

  @override
  void paint(Canvas canvas, Size size) {
    const margin = EdgeInsets.only(left: 50, right: 20, top: 20, bottom: 40);
    final chartWidth = size.width - margin.left - margin.right;
    final chartHeight = size.height - margin.top - margin.bottom;

    final xScale = scaleLinear(
      domain: [0, 100],
      range: [margin.left, margin.left + chartWidth],
    );

    final yScale = scaleLinear(
      domain: [0, 100],
      range: [margin.top + chartHeight, margin.top],
    );

    // Draw grid
    for (double v = 0; v <= 100; v += 20) {
      canvas.drawLine(
        Offset(margin.left, yScale(v)),
        Offset(margin.left + chartWidth, yScale(v)),
        Paint()..color = Colors.grey.withAlpha(50),
      );
      canvas.drawLine(
        Offset(xScale(v), margin.top),
        Offset(xScale(v), margin.top + chartHeight),
        Paint()..color = Colors.grey.withAlpha(50),
      );
    }

    // Draw axes
    final axisPaint = Paint()
      ..color = Colors.black54
      ..strokeWidth = 1;

    canvas.drawLine(
      Offset(margin.left, margin.top),
      Offset(margin.left, margin.top + chartHeight),
      axisPaint,
    );
    canvas.drawLine(
      Offset(margin.left, margin.top + chartHeight),
      Offset(margin.left + chartWidth, margin.top + chartHeight),
      axisPaint,
    );

    // Draw points
    for (final p in data1) {
      canvas.drawCircle(
        Offset(xScale(p.$1), yScale(p.$2)),
        p.$3,
        Paint()..color = Colors.indigo.withAlpha(150),
      );
    }

    for (final p in data2) {
      canvas.drawCircle(
        Offset(xScale(p.$1), yScale(p.$2)),
        p.$3,
        Paint()..color = Colors.orange.withAlpha(150),
      );
    }

    // Labels
    final textPainter = TextPainter(textDirection: TextDirection.ltr);

    for (double v = 0; v <= 100; v += 20) {
      textPainter.text = TextSpan(
        text: v.toInt().toString(),
        style: const TextStyle(color: Colors.black54, fontSize: 12),
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(margin.left - textPainter.width - 8, yScale(v) - textPainter.height / 2),
      );
      textPainter.paint(
        canvas,
        Offset(xScale(v) - textPainter.width / 2, margin.top + chartHeight + 8),
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
