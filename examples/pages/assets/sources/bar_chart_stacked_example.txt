import 'package:flutter/material.dart';
import 'package:data_visualization/data_visualization.dart';

class BarChartStackedExample extends StatelessWidget {
  const BarChartStackedExample({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'];
    final productA = [30.0, 45.0, 35.0, 50.0, 40.0, 55.0];
    final productB = [25.0, 30.0, 40.0, 35.0, 45.0, 30.0];
    final productC = [15.0, 20.0, 18.0, 25.0, 22.0, 28.0];

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Expanded(
            child: CustomPaint(
              size: Size.infinite,
              painter: StackedBarPainter(
                categories: categories,
                productA: productA,
                productB: productB,
                productC: productC,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _legendItem(Colors.indigo, 'Product A'),
              const SizedBox(width: 24),
              _legendItem(Colors.teal, 'Product B'),
              const SizedBox(width: 24),
              _legendItem(Colors.orange, 'Product C'),
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

class StackedBarPainter extends CustomPainter {
  final List<String> categories;
  final List<double> productA;
  final List<double> productB;
  final List<double> productC;

  StackedBarPainter({
    required this.categories,
    required this.productA,
    required this.productB,
    required this.productC,
  });

  @override
  void paint(Canvas canvas, Size size) {
    const margin = EdgeInsets.only(left: 60, right: 20, top: 20, bottom: 40);
    final chartWidth = size.width - margin.left - margin.right;
    final chartHeight = size.height - margin.top - margin.bottom;

    final xScale = scaleBand<String>(
      domain: categories,
      range: [margin.left, margin.left + chartWidth],
      paddingInner: 0.2,
      paddingOuter: 0.1,
    );

    // Calculate max stacked value
    double maxValue = 0;
    for (int i = 0; i < categories.length; i++) {
      final total = productA[i] + productB[i] + productC[i];
      if (total > maxValue) maxValue = total;
    }

    final yScale = scaleLinear(
      domain: [0, maxValue * 1.1],
      range: [margin.top + chartHeight, margin.top],
    );

    // Draw grid
    for (double y = 0; y <= maxValue * 1.1; y += 30) {
      canvas.drawLine(
        Offset(margin.left, yScale(y)),
        Offset(margin.left + chartWidth, yScale(y)),
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

    // Draw stacked bars
    for (int i = 0; i < categories.length; i++) {
      final x = xScale(categories[i]);
      final barWidth = xScale.bandwidth;
      final bottom = yScale(0);

      // Product A (bottom)
      final y1 = yScale(productA[i]);
      canvas.drawRRect(
        RRect.fromRectAndCorners(
          Rect.fromLTRB(x, y1, x + barWidth, bottom),
          bottomLeft: const Radius.circular(4),
          bottomRight: const Radius.circular(4),
        ),
        Paint()..color = Colors.indigo,
      );

      // Product B (middle)
      final y2 = yScale(productA[i] + productB[i]);
      canvas.drawRect(
        Rect.fromLTRB(x, y2, x + barWidth, y1),
        Paint()..color = Colors.teal,
      );

      // Product C (top)
      final y3 = yScale(productA[i] + productB[i] + productC[i]);
      canvas.drawRRect(
        RRect.fromRectAndCorners(
          Rect.fromLTRB(x, y3, x + barWidth, y2),
          topLeft: const Radius.circular(4),
          topRight: const Radius.circular(4),
        ),
        Paint()..color = Colors.orange,
      );
    }

    // Draw labels
    final textPainter = TextPainter(textDirection: TextDirection.ltr);

    // Y axis labels
    for (double y = 0; y <= maxValue * 1.1; y += 30) {
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

    // X axis labels
    for (int i = 0; i < categories.length; i++) {
      textPainter.text = TextSpan(
        text: categories[i],
        style: const TextStyle(color: Colors.black54, fontSize: 12),
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(
          xScale(categories[i]) + xScale.bandwidth / 2 - textPainter.width / 2,
          margin.top + chartHeight + 8,
        ),
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
