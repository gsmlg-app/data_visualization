import 'package:flutter/material.dart';
import 'package:data_visualization/data_visualization.dart';

class BarChartHorizontalExample extends StatefulWidget {
  const BarChartHorizontalExample({super.key});

  @override
  State<BarChartHorizontalExample> createState() =>
      _BarChartHorizontalExampleState();
}

class _BarChartHorizontalExampleState extends State<BarChartHorizontalExample> {
  String _mode = 'Grouped';
  final modes = ['Grouped', 'Stacked'];

  @override
  Widget build(BuildContext context) {
    final categories = ['Engineering', 'Marketing', 'Sales', 'Support', 'HR'];
    final data2023 = [85.0, 62.0, 78.0, 45.0, 32.0];
    final data2024 = [92.0, 58.0, 88.0, 52.0, 38.0];

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 8,
            children: modes.map((m) {
              return ChoiceChip(
                label: Text(m),
                selected: _mode == m,
                onSelected: (_) => setState(() => _mode = m),
              );
            }).toList(),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: CustomPaint(
              size: Size.infinite,
              painter: HorizontalBarPainter(
                categories: categories,
                data2023: data2023,
                data2024: data2024,
                isStacked: _mode == 'Stacked',
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _legendItem(Colors.indigo, '2023'),
              const SizedBox(width: 24),
              _legendItem(Colors.teal, '2024'),
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

class HorizontalBarPainter extends CustomPainter {
  final List<String> categories;
  final List<double> data2023;
  final List<double> data2024;
  final bool isStacked;

  HorizontalBarPainter({
    required this.categories,
    required this.data2023,
    required this.data2024,
    required this.isStacked,
  });

  @override
  void paint(Canvas canvas, Size size) {
    const margin = EdgeInsets.only(left: 100, right: 40, top: 20, bottom: 40);
    final chartWidth = size.width - margin.left - margin.right;
    final chartHeight = size.height - margin.top - margin.bottom;

    final yScale = scaleBand<String>(
      domain: categories,
      range: [margin.top, margin.top + chartHeight],
      paddingInner: 0.3,
      paddingOuter: 0.15,
    );

    final maxValue = isStacked
        ? (data2023.asMap().entries.map((e) => e.value + data2024[e.key]).reduce((a, b) => a > b ? a : b))
        : ([...data2023, ...data2024].reduce((a, b) => a > b ? a : b));

    final xScale = scaleLinear(
      domain: [0, maxValue * 1.1],
      range: [margin.left, margin.left + chartWidth],
    );

    // Draw grid
    for (double x = 0; x <= maxValue * 1.1; x += 20) {
      canvas.drawLine(
        Offset(xScale(x), margin.top),
        Offset(xScale(x), margin.top + chartHeight),
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

    // Draw bars
    final barHeight = isStacked ? yScale.bandwidth : yScale.bandwidth / 2 - 2;

    for (int i = 0; i < categories.length; i++) {
      final y = yScale(categories[i]);
      final x0 = xScale(0);

      if (isStacked) {
        // Stacked bars
        final x1 = xScale(data2023[i]);
        final x2 = xScale(data2023[i] + data2024[i]);

        canvas.drawRRect(
          RRect.fromRectAndCorners(
            Rect.fromLTRB(x0, y, x1, y + barHeight),
            topLeft: const Radius.circular(4),
            bottomLeft: const Radius.circular(4),
          ),
          Paint()..color = Colors.indigo,
        );

        canvas.drawRRect(
          RRect.fromRectAndCorners(
            Rect.fromLTRB(x1, y, x2, y + barHeight),
            topRight: const Radius.circular(4),
            bottomRight: const Radius.circular(4),
          ),
          Paint()..color = Colors.teal,
        );
      } else {
        // Grouped bars
        final x1_2023 = xScale(data2023[i]);
        final x1_2024 = xScale(data2024[i]);

        canvas.drawRRect(
          RRect.fromRectAndRadius(
            Rect.fromLTRB(x0, y, x1_2023, y + barHeight),
            const Radius.circular(4),
          ),
          Paint()..color = Colors.indigo,
        );

        canvas.drawRRect(
          RRect.fromRectAndRadius(
            Rect.fromLTRB(x0, y + barHeight + 4, x1_2024, y + barHeight * 2 + 4),
            const Radius.circular(4),
          ),
          Paint()..color = Colors.teal,
        );
      }
    }

    // Draw labels
    final textPainter = TextPainter(textDirection: TextDirection.ltr);

    // Y axis labels (categories)
    for (int i = 0; i < categories.length; i++) {
      textPainter.text = TextSpan(
        text: categories[i],
        style: const TextStyle(color: Colors.black54, fontSize: 12),
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(
          margin.left - textPainter.width - 8,
          yScale(categories[i]) + yScale.bandwidth / 2 - textPainter.height / 2,
        ),
      );
    }

    // X axis labels
    for (double x = 0; x <= maxValue * 1.1; x += 40) {
      textPainter.text = TextSpan(
        text: x.toInt().toString(),
        style: const TextStyle(color: Colors.black54, fontSize: 12),
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(xScale(x) - textPainter.width / 2, margin.top + chartHeight + 8),
      );
    }
  }

  @override
  bool shouldRepaint(covariant HorizontalBarPainter oldDelegate) =>
      oldDelegate.isStacked != isStacked;
}
