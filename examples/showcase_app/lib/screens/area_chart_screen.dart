import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:data_visualization/data_visualization.dart';

class AreaChartScreen extends StatelessWidget {
  const AreaChartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Generate sample data
    final data1 = List.generate(20, (i) => Point(i.toDouble(), 10 + 15 * math.sin(i * 0.3).abs()));
    final data2 = List.generate(20, (i) => Point(i.toDouble(), 15 + 20 * math.cos(i * 0.2).abs()));
    final data3 = List.generate(20, (i) => Point(i.toDouble(), 8 + 12 * math.sin(i * 0.4 + 1).abs()));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Area Chart'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Traffic Sources Over Time',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: CustomPaint(
                size: Size.infinite,
                painter: AreaChartPainter(
                  data1: data1,
                  data2: data2,
                  data3: data3,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _legendItem(Colors.blue.withOpacity(0.7), 'Direct'),
                const SizedBox(width: 24),
                _legendItem(Colors.green.withOpacity(0.7), 'Organic'),
                const SizedBox(width: 24),
                _legendItem(Colors.purple.withOpacity(0.7), 'Referral'),
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
        Container(width: 16, height: 16, color: color),
        const SizedBox(width: 8),
        Text(label),
      ],
    );
  }
}

class AreaChartPainter extends CustomPainter {
  final List<Point> data1;
  final List<Point> data2;
  final List<Point> data3;

  AreaChartPainter({
    required this.data1,
    required this.data2,
    required this.data3,
  });

  @override
  void paint(Canvas canvas, Size size) {
    const margin = EdgeInsets.only(left: 50, right: 20, top: 20, bottom: 40);
    final chartWidth = size.width - margin.left - margin.right;
    final chartHeight = size.height - margin.top - margin.bottom;

    // Stack the data
    final stacked1 = data1;
    final stacked2 = List.generate(data2.length, (i) => Point(data2[i].x, data1[i].y + data2[i].y));
    final stacked3 = List.generate(data3.length, (i) => Point(data3[i].x, stacked2[i].y + data3[i].y));

    // Find max Y
    final maxY = stacked3.map((p) => p.y).reduce(math.max);

    // Create scales
    final xScale = scaleLinear(
      domain: [0, 19],
      range: [margin.left, margin.left + chartWidth],
    );

    final yScale = scaleLinear(
      domain: [0, maxY * 1.1],
      range: [margin.top + chartHeight, margin.top],
    );

    // Draw grid lines
    final gridPaint = Paint()
      ..color = Colors.grey.withOpacity(0.3)
      ..strokeWidth = 1;

    for (double y = 0; y <= maxY * 1.1; y += 20) {
      final py = yScale(y);
      canvas.drawLine(
        Offset(margin.left, py),
        Offset(margin.left + chartWidth, py),
        gridPaint,
      );
    }

    // Draw stacked areas (bottom to top)
    final curve = curveBasis();

    // Area 3 (top)
    _drawArea(
      canvas,
      curve.generate(stacked2.map((p) => Point(xScale(p.x), yScale(p.y))).toList()),
      curve.generate(stacked3.map((p) => Point(xScale(p.x), yScale(p.y))).toList()),
      Colors.purple.withOpacity(0.7),
    );

    // Area 2 (middle)
    _drawArea(
      canvas,
      curve.generate(stacked1.map((p) => Point(xScale(p.x), yScale(p.y))).toList()),
      curve.generate(stacked2.map((p) => Point(xScale(p.x), yScale(p.y))).toList()),
      Colors.green.withOpacity(0.7),
    );

    // Area 1 (bottom)
    _drawArea(
      canvas,
      [Point(xScale(0), yScale(0)), Point(xScale(19), yScale(0))],
      curve.generate(stacked1.map((p) => Point(xScale(p.x), yScale(p.y))).toList()),
      Colors.blue.withOpacity(0.7),
    );

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
    final textPainter = TextPainter(textDirection: TextDirection.ltr);

    for (double y = 0; y <= maxY * 1.1; y += 20) {
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
  }

  void _drawArea(Canvas canvas, List<Point> bottom, List<Point> top, Color color) {
    if (top.isEmpty || bottom.isEmpty) return;

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(top.first.x, top.first.y);

    for (int i = 1; i < top.length; i++) {
      path.lineTo(top[i].x, top[i].y);
    }

    for (int i = bottom.length - 1; i >= 0; i--) {
      path.lineTo(bottom[i].x, bottom[i].y);
    }

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
