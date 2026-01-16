import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:data_visualization/data_visualization.dart';

class LineChartScreen extends StatelessWidget {
  const LineChartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Generate sample data
    final data1 = List.generate(12, (i) => Point(i.toDouble(), 20 + 30 * math.sin(i * 0.5)));
    final data2 = List.generate(12, (i) => Point(i.toDouble(), 40 + 25 * math.cos(i * 0.3)));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Line Chart'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Monthly Sales Comparison',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: CustomPaint(
                size: Size.infinite,
                painter: LineChartPainter(
                  data1: data1,
                  data2: data2,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _legendItem(Colors.blue, '2024'),
                const SizedBox(width: 24),
                _legendItem(Colors.orange, '2025'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _legendItem(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 3,
          color: color,
        ),
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

    // Create scales
    final xScale = scaleLinear(
      domain: [0, 11],
      range: [margin.left, margin.left + chartWidth],
    );

    final yScale = scaleLinear(
      domain: [0, 80],
      range: [margin.top + chartHeight, margin.top],
    );

    // Draw grid lines
    final gridPaint = Paint()
      ..color = Colors.grey.withOpacity(0.3)
      ..strokeWidth = 1;

    for (double y = 0; y <= 80; y += 20) {
      final py = yScale(y);
      canvas.drawLine(
        Offset(margin.left, py),
        Offset(margin.left + chartWidth, py),
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

    // Draw Y axis labels
    final textPainter = TextPainter(
      textDirection: TextDirection.ltr,
    );

    for (double y = 0; y <= 80; y += 20) {
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

    // Draw X axis labels (months)
    const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    for (int i = 0; i < months.length; i++) {
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

    // Draw lines using curve
    final curve = curveCatmullRom();

    // Line 1
    final line1Points = curve.generate(data1.map((p) => Point(xScale(p.x), yScale(p.y))).toList());
    _drawLine(canvas, line1Points, Colors.blue);

    // Line 2
    final line2Points = curve.generate(data2.map((p) => Point(xScale(p.x), yScale(p.y))).toList());
    _drawLine(canvas, line2Points, Colors.orange);

    // Draw data points
    final pointPaint = Paint()..style = PaintingStyle.fill;

    for (final p in data1) {
      pointPaint.color = Colors.blue;
      canvas.drawCircle(Offset(xScale(p.x), yScale(p.y)), 4, pointPaint);
    }

    for (final p in data2) {
      pointPaint.color = Colors.orange;
      canvas.drawCircle(Offset(xScale(p.x), yScale(p.y)), 4, pointPaint);
    }
  }

  void _drawLine(Canvas canvas, List<Point> points, Color color) {
    if (points.length < 2) return;

    final paint = Paint()
      ..color = color
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final path = Path();
    path.moveTo(points.first.x, points.first.y);
    for (int i = 1; i < points.length; i++) {
      path.lineTo(points[i].x, points[i].y);
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
