import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:data_visualization/data_visualization.dart';

class AreaChartExample extends StatelessWidget {
  const AreaChartExample({super.key});

  @override
  Widget build(BuildContext context) {
    final data1 = List.generate(15, (i) => Point(i.toDouble(), 10 + 15 * math.sin(i * 0.3).abs()));
    final data2 = List.generate(15, (i) => Point(i.toDouble(), 15 + 20 * math.cos(i * 0.2).abs()));
    final data3 = List.generate(15, (i) => Point(i.toDouble(), 8 + 12 * math.sin(i * 0.4 + 1).abs()));

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Expanded(
            child: CustomPaint(
              size: Size.infinite,
              painter: AreaChartPainter(data1: data1, data2: data2, data3: data3),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _legendItem(Colors.indigo.withAlpha(180), 'Direct'),
              const SizedBox(width: 24),
              _legendItem(Colors.teal.withAlpha(180), 'Organic'),
              const SizedBox(width: 24),
              _legendItem(Colors.orange.withAlpha(180), 'Referral'),
            ],
          ),
        ],
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

    // Stack data
    final stacked1 = data1;
    final stacked2 = List.generate(data2.length, (i) => Point(data2[i].x, data1[i].y + data2[i].y));
    final stacked3 = List.generate(data3.length, (i) => Point(data3[i].x, stacked2[i].y + data3[i].y));

    final maxY = stacked3.map((p) => p.y).reduce(math.max);

    final xScale = scaleLinear(
      domain: [0, 14],
      range: [margin.left, margin.left + chartWidth],
    );

    final yScale = scaleLinear(
      domain: [0, maxY * 1.1],
      range: [margin.top + chartHeight, margin.top],
    );

    // Draw grid
    for (double y = 0; y <= maxY * 1.1; y += 20) {
      canvas.drawLine(
        Offset(margin.left, yScale(y)),
        Offset(margin.left + chartWidth, yScale(y)),
        Paint()..color = Colors.grey.withAlpha(50),
      );
    }

    // Draw stacked areas
    final curve = curveBasis();

    void drawArea(List<Point> bottom, List<Point> top, Color color) {
      final topPoints = curve.generate(top.map((p) => Point(xScale(p.x), yScale(p.y))).toList());
      final bottomPoints = curve.generate(bottom.map((p) => Point(xScale(p.x), yScale(p.y))).toList());

      if (topPoints.isEmpty || bottomPoints.isEmpty) return;

      final path = Path();
      path.moveTo(topPoints.first.x, topPoints.first.y);
      for (int i = 1; i < topPoints.length; i++) {
        path.lineTo(topPoints[i].x, topPoints[i].y);
      }
      for (int i = bottomPoints.length - 1; i >= 0; i--) {
        path.lineTo(bottomPoints[i].x, bottomPoints[i].y);
      }
      path.close();

      canvas.drawPath(path, Paint()..color = color);
    }

    // Draw from top to bottom
    drawArea(stacked2, stacked3, Colors.orange.withAlpha(180));
    drawArea(stacked1, stacked2, Colors.teal.withAlpha(180));
    drawArea(
      List.generate(data1.length, (i) => Point(i.toDouble(), 0)),
      stacked1,
      Colors.indigo.withAlpha(180),
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

    // Labels
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

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
