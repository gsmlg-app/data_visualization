import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:data_visualization/data_visualization.dart';

class BoxPlotExample extends StatelessWidget {
  const BoxPlotExample({super.key});

  @override
  Widget build(BuildContext context) {
    // Generate sample data for different groups
    final random = math.Random(42);

    List<double> generateData(double mean, double spread, int count) {
      return List.generate(count, (i) {
        return mean + (random.nextDouble() - 0.5) * spread * 2;
      })..sort();
    }

    final groups = ['Group A', 'Group B', 'Group C', 'Group D', 'Group E'];
    final data = [
      generateData(50, 20, 50),
      generateData(65, 15, 50),
      generateData(45, 25, 50),
      generateData(70, 10, 50),
      generateData(55, 18, 50),
    ];

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Distribution Comparison',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            'Box plots showing median, quartiles, and outliers',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.grey.shade600,
                ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: CustomPaint(
              size: Size.infinite,
              painter: BoxPlotPainter(groups: groups, data: data),
            ),
          ),
          const SizedBox(height: 16),
          _buildLegend(),
        ],
      ),
    );
  }

  Widget _buildLegend() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _legendItem(Colors.indigo.withAlpha(100), Colors.indigo, 'IQR (Q1-Q3)'),
        const SizedBox(width: 16),
        Container(
          width: 20,
          height: 2,
          color: Colors.indigo,
        ),
        const SizedBox(width: 4),
        const Text('Median', style: TextStyle(fontSize: 12)),
        const SizedBox(width: 16),
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.indigo, width: 1.5),
          ),
        ),
        const SizedBox(width: 4),
        const Text('Outliers', style: TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _legendItem(Color fill, Color stroke, String label) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: fill,
            border: Border.all(color: stroke, width: 1.5),
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(width: 4),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}

class BoxPlotPainter extends CustomPainter {
  final List<String> groups;
  final List<List<double>> data;

  BoxPlotPainter({required this.groups, required this.data});

  @override
  void paint(Canvas canvas, Size size) {
    const margin = EdgeInsets.only(left: 60, right: 20, top: 20, bottom: 50);
    final chartWidth = size.width - margin.left - margin.right;
    final chartHeight = size.height - margin.top - margin.bottom;

    final xScale = scaleBand<String>(
      domain: groups,
      range: [margin.left, margin.left + chartWidth],
      paddingInner: 0.4,
      paddingOuter: 0.2,
    );

    // Find global min/max for y scale
    double minVal = double.infinity, maxVal = double.negativeInfinity;
    for (final d in data) {
      for (final v in d) {
        if (v < minVal) minVal = v;
        if (v > maxVal) maxVal = v;
      }
    }

    final yScale = scaleLinear(
      domain: [minVal - 5, maxVal + 5],
      range: [margin.top + chartHeight, margin.top],
    );

    // Draw grid
    for (double y = 0; y <= 100; y += 20) {
      if (y >= minVal - 5 && y <= maxVal + 5) {
        canvas.drawLine(
          Offset(margin.left, yScale(y)),
          Offset(margin.left + chartWidth, yScale(y)),
          Paint()..color = Colors.grey.withAlpha(50),
        );
      }
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

    // Draw box plots
    for (int i = 0; i < groups.length; i++) {
      final x = xScale(groups[i]);
      final boxWidth = xScale.bandwidth;
      final sortedData = List<double>.from(data[i])..sort();

      // Calculate statistics
      final q1 = _percentile(sortedData, 0.25);
      final median = _percentile(sortedData, 0.5);
      final q3 = _percentile(sortedData, 0.75);
      final iqr = q3 - q1;
      final lowerWhisker = sortedData.firstWhere((v) => v >= q1 - 1.5 * iqr, orElse: () => sortedData.first);
      final upperWhisker = sortedData.lastWhere((v) => v <= q3 + 1.5 * iqr, orElse: () => sortedData.last);

      // Find outliers
      final outliers = sortedData.where((v) => v < lowerWhisker || v > upperWhisker).toList();

      final centerX = x + boxWidth / 2;

      // Draw whiskers
      final whiskerPaint = Paint()
        ..color = Colors.indigo
        ..strokeWidth = 1.5;

      // Lower whisker
      canvas.drawLine(
        Offset(centerX, yScale(q1)),
        Offset(centerX, yScale(lowerWhisker)),
        whiskerPaint,
      );
      canvas.drawLine(
        Offset(centerX - boxWidth * 0.2, yScale(lowerWhisker)),
        Offset(centerX + boxWidth * 0.2, yScale(lowerWhisker)),
        whiskerPaint,
      );

      // Upper whisker
      canvas.drawLine(
        Offset(centerX, yScale(q3)),
        Offset(centerX, yScale(upperWhisker)),
        whiskerPaint,
      );
      canvas.drawLine(
        Offset(centerX - boxWidth * 0.2, yScale(upperWhisker)),
        Offset(centerX + boxWidth * 0.2, yScale(upperWhisker)),
        whiskerPaint,
      );

      // Draw box (IQR)
      final boxRect = Rect.fromLTRB(x, yScale(q3), x + boxWidth, yScale(q1));
      canvas.drawRRect(
        RRect.fromRectAndRadius(boxRect, const Radius.circular(4)),
        Paint()..color = Colors.indigo.withAlpha(100),
      );
      canvas.drawRRect(
        RRect.fromRectAndRadius(boxRect, const Radius.circular(4)),
        Paint()
          ..color = Colors.indigo
          ..strokeWidth = 1.5
          ..style = PaintingStyle.stroke,
      );

      // Draw median line
      canvas.drawLine(
        Offset(x, yScale(median)),
        Offset(x + boxWidth, yScale(median)),
        Paint()
          ..color = Colors.indigo.shade900
          ..strokeWidth = 2,
      );

      // Draw outliers
      for (final outlier in outliers) {
        canvas.drawCircle(
          Offset(centerX, yScale(outlier)),
          4,
          Paint()
            ..color = Colors.white
            ..style = PaintingStyle.fill,
        );
        canvas.drawCircle(
          Offset(centerX, yScale(outlier)),
          4,
          Paint()
            ..color = Colors.indigo
            ..strokeWidth = 1.5
            ..style = PaintingStyle.stroke,
        );
      }
    }

    // Draw labels
    final textPainter = TextPainter(textDirection: TextDirection.ltr);

    // Y axis labels
    for (double y = 0; y <= 100; y += 20) {
      if (y >= minVal - 5 && y <= maxVal + 5) {
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

    // X axis labels
    for (int i = 0; i < groups.length; i++) {
      textPainter.text = TextSpan(
        text: groups[i],
        style: const TextStyle(color: Colors.black54, fontSize: 12),
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(
          xScale(groups[i]) + xScale.bandwidth / 2 - textPainter.width / 2,
          margin.top + chartHeight + 8,
        ),
      );
    }
  }

  double _percentile(List<double> sortedData, double p) {
    final index = p * (sortedData.length - 1);
    final lower = index.floor();
    final upper = index.ceil();
    if (lower == upper) return sortedData[lower];
    return sortedData[lower] * (upper - index) + sortedData[upper] * (index - lower);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
