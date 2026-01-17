import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:data_visualization/data_visualization.dart';

class LineChartExample extends StatelessWidget {
  const LineChartExample({super.key});

  @override
  Widget build(BuildContext context) {
    final data1 = List.generate(
      12,
      (i) => Point(i.toDouble(), 30 + 40 * math.sin(i * 0.5) + math.Random(i).nextDouble() * 20),
    );
    final data2 = List.generate(
      12,
      (i) => Point(i.toDouble(), 50 + 30 * math.cos(i * 0.4) + math.Random(i + 100).nextDouble() * 15),
    );

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Expanded(
            child: CustomPaint(
              size: Size.infinite,
              painter: LineChartPainter(data1: data1, data2: data2),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _legendItem(Colors.indigo, 'Series A'),
              const SizedBox(width: 24),
              _legendItem(Colors.teal, 'Series B'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _legendItem(Color color, String label) {
    return Row(
      children: [
        Container(width: 16, height: 3, color: color),
        const SizedBox(width: 8),
        Text(label),
      ],
    );
  }
}

class LineChartPainter extends CustomPainter {
  final List<Point> data1;
  final List<Point> data2;

  LineChartPainter({required this.data1, required this.data2});

  @override
  void paint(Canvas canvas, Size size) {
    const margin = EdgeInsets.only(left: 50, right: 20, top: 20, bottom: 40);
    final chartWidth = size.width - margin.left - margin.right;
    final chartHeight = size.height - margin.top - margin.bottom;

    final xScale = scaleLinear(
      domain: [0, 11],
      range: [margin.left, margin.left + chartWidth],
    );

    final yScale = scaleLinear(
      domain: [0, 100],
      range: [margin.top + chartHeight, margin.top],
    );

    // Draw grid
    final gridPaint = Paint()
      ..color = Colors.grey.withAlpha(50)
      ..strokeWidth = 1;

    for (double y = 0; y <= 100; y += 20) {
      canvas.drawLine(
        Offset(margin.left, yScale(y)),
        Offset(margin.left + chartWidth, yScale(y)),
        gridPaint,
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

    // Draw lines
    final curve = curveCatmullRom();

    void drawLine(List<Point> data, Color color) {
      final points = data.map((p) => Point(xScale(p.x), yScale(p.y))).toList();
      final curvePoints = curve.generate(points);

      if (curvePoints.isEmpty) return;

      final path = Path();
      path.moveTo(curvePoints.first.x, curvePoints.first.y);
      for (int i = 1; i < curvePoints.length; i++) {
        path.lineTo(curvePoints[i].x, curvePoints[i].y);
      }

      canvas.drawPath(
        path,
        Paint()
          ..color = color
          ..strokeWidth = 2.5
          ..style = PaintingStyle.stroke,
      );

      // Draw points
      for (final p in points) {
        canvas.drawCircle(Offset(p.x, p.y), 4, Paint()..color = color);
        canvas.drawCircle(Offset(p.x, p.y), 2, Paint()..color = Colors.white);
      }
    }

    drawLine(data1, Colors.indigo);
    drawLine(data2, Colors.teal);

    // Draw labels
    final textPainter = TextPainter(textDirection: TextDirection.ltr);

    for (double y = 0; y <= 100; y += 20) {
      textPainter.text = TextSpan(
        text: y.toInt().toString(),
        style: const TextStyle(color: Colors.black54, fontSize: 12),
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(margin.left - textPainter.width - 8, yScale(y) - textPainter.height / 2),
      );
    }

    final months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    for (int i = 0; i < 12; i += 2) {
      textPainter.text = TextSpan(
        text: months[i],
        style: const TextStyle(color: Colors.black54, fontSize: 10),
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(xScale(i.toDouble()) - textPainter.width / 2, margin.top + chartHeight + 8),
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
