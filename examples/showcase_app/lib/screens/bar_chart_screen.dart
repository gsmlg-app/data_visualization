import 'package:flutter/material.dart';
import 'package:data_visualization/data_visualization.dart';

class BarChartScreen extends StatelessWidget {
  const BarChartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = ['Q1', 'Q2', 'Q3', 'Q4'];
    final data1 = [45.0, 62.0, 53.0, 78.0];
    final data2 = [32.0, 48.0, 41.0, 55.0];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bar Chart'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Quarterly Revenue',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: CustomPaint(
                size: Size.infinite,
                painter: BarChartPainter(
                  categories: categories,
                  data1: data1,
                  data2: data2,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _legendItem(Colors.blue, 'Product A'),
                const SizedBox(width: 24),
                _legendItem(Colors.teal, 'Product B'),
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

class BarChartPainter extends CustomPainter {
  final List<String> categories;
  final List<double> data1;
  final List<double> data2;

  BarChartPainter({
    required this.categories,
    required this.data1,
    required this.data2,
  });

  @override
  void paint(Canvas canvas, Size size) {
    const margin = EdgeInsets.only(left: 50, right: 20, top: 20, bottom: 40);
    final chartWidth = size.width - margin.left - margin.right;
    final chartHeight = size.height - margin.top - margin.bottom;

    // Create scales
    final xScale = scaleBand<String>(
      domain: categories,
      range: [margin.left, margin.left + chartWidth],
      paddingInner: 0.2,
      paddingOuter: 0.1,
    );

    final yScale = scaleLinear(
      domain: [0, 100],
      range: [margin.top + chartHeight, margin.top],
    );

    // Draw grid lines
    final gridPaint = Paint()
      ..color = Colors.grey.withOpacity(0.3)
      ..strokeWidth = 1;

    for (double y = 0; y <= 100; y += 20) {
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

    for (double y = 0; y <= 100; y += 20) {
      textPainter.text = TextSpan(
        text: '\$${y.toInt()}K',
        style: const TextStyle(color: Colors.black54, fontSize: 12),
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(margin.left - textPainter.width - 8, yScale(y) - textPainter.height / 2),
      );
    }

    // Draw bars and X axis labels
    final barWidth = xScale.bandwidth / 2 - 2;

    for (int i = 0; i < categories.length; i++) {
      final x = xScale(categories[i]);
      final y1 = yScale(data1[i]);
      final y2 = yScale(data2[i]);
      final bottom = yScale(0);

      // Bar 1
      final bar1Paint = Paint()..color = Colors.blue;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTRB(x, y1, x + barWidth, bottom),
          const Radius.circular(4),
        ),
        bar1Paint,
      );

      // Bar 2
      final bar2Paint = Paint()..color = Colors.teal;
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTRB(x + barWidth + 4, y2, x + barWidth * 2 + 4, bottom),
          const Radius.circular(4),
        ),
        bar2Paint,
      );

      // X axis label
      textPainter.text = TextSpan(
        text: categories[i],
        style: const TextStyle(color: Colors.black54, fontSize: 12),
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(x + xScale.bandwidth / 2 - textPainter.width / 2, margin.top + chartHeight + 8),
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
