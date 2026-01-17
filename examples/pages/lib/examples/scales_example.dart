import 'package:flutter/material.dart';
import 'package:data_visualization/data_visualization.dart';

class ScalesExample extends StatefulWidget {
  const ScalesExample({super.key});

  @override
  State<ScalesExample> createState() => _ScalesExampleState();
}

class _ScalesExampleState extends State<ScalesExample> {
  String _selectedScale = 'Linear';

  final scales = ['Linear', 'Log', 'Power', 'Band', 'Ordinal'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 8,
            children: scales.map((s) {
              return ChoiceChip(
                label: Text(s),
                selected: _selectedScale == s,
                onSelected: (_) => setState(() => _selectedScale = s),
              );
            }).toList(),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: CustomPaint(
              size: Size.infinite,
              painter: ScalePainter(scaleType: _selectedScale),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            _getDescription(),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }

  String _getDescription() {
    switch (_selectedScale) {
      case 'Linear':
        return 'Linear scale maps a continuous domain to a continuous range proportionally.';
      case 'Log':
        return 'Logarithmic scale is useful for data spanning several orders of magnitude.';
      case 'Power':
        return 'Power scale applies an exponential transform to the domain.';
      case 'Band':
        return 'Band scale divides the range into uniform bands for categorical data.';
      case 'Ordinal':
        return 'Ordinal scale maps discrete domain values to discrete range values.';
      default:
        return '';
    }
  }
}

class ScalePainter extends CustomPainter {
  final String scaleType;

  ScalePainter({required this.scaleType});

  @override
  void paint(Canvas canvas, Size size) {
    const margin = EdgeInsets.only(left: 60, right: 40, top: 40, bottom: 60);
    final chartWidth = size.width - margin.left - margin.right;
    final chartHeight = size.height - margin.top - margin.bottom;

    final axisPaint = Paint()
      ..color = Colors.black54
      ..strokeWidth = 1;

    // Draw axes
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

    final textPainter = TextPainter(textDirection: TextDirection.ltr);

    if (scaleType == 'Band' || scaleType == 'Ordinal') {
      _drawCategoricalScale(canvas, size, margin, chartWidth, chartHeight, textPainter);
    } else {
      _drawContinuousScale(canvas, size, margin, chartWidth, chartHeight, textPainter);
    }
  }

  void _drawContinuousScale(
    Canvas canvas,
    Size size,
    EdgeInsets margin,
    double chartWidth,
    double chartHeight,
    TextPainter textPainter,
  ) {
    final xScale = scaleLinear(
      domain: [0, 100],
      range: [margin.left, margin.left + chartWidth],
    );

    late final double Function(double) yScale;
    late final List<double> domainValues;

    switch (scaleType) {
      case 'Log':
        final logScale = scaleLog(
          domain: [1, 1000],
          range: [margin.top + chartHeight, margin.top],
        );
        yScale = logScale;
        domainValues = [1, 10, 100, 1000];
        break;
      case 'Power':
        final powScale = scalePow(
          domain: [0, 100],
          range: [margin.top + chartHeight, margin.top],
          exponent: 2,
        );
        yScale = powScale;
        domainValues = [0, 25, 50, 75, 100];
        break;
      default:
        final linScale = scaleLinear(
          domain: [0, 100],
          range: [margin.top + chartHeight, margin.top],
        );
        yScale = linScale;
        domainValues = [0, 25, 50, 75, 100];
    }

    // Draw grid and labels
    for (final v in domainValues) {
      final py = yScale(v);
      canvas.drawLine(
        Offset(margin.left, py),
        Offset(margin.left + chartWidth, py),
        Paint()..color = Colors.grey.withAlpha(50),
      );

      textPainter.text = TextSpan(
        text: v.toStringAsFixed(0),
        style: const TextStyle(color: Colors.black54, fontSize: 12),
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(margin.left - textPainter.width - 8, py - textPainter.height / 2),
      );
    }

    // Draw sample curve
    final path = Path();
    var first = true;

    for (double x = 0; x <= 100; x += 1) {
      double y;
      switch (scaleType) {
        case 'Log':
          y = 1 + x * 10;
          break;
        case 'Power':
          y = x;
          break;
        default:
          y = x;
      }

      final px = xScale(x);
      final py = yScale(y.clamp(scaleType == 'Log' ? 1 : 0, scaleType == 'Log' ? 1000 : 100));

      if (first) {
        path.moveTo(px, py);
        first = false;
      } else {
        path.lineTo(px, py);
      }
    }

    canvas.drawPath(
      path,
      Paint()
        ..color = Colors.indigo
        ..strokeWidth = 2
        ..style = PaintingStyle.stroke,
    );

    // X axis labels
    for (double x = 0; x <= 100; x += 25) {
      textPainter.text = TextSpan(
        text: x.toStringAsFixed(0),
        style: const TextStyle(color: Colors.black54, fontSize: 12),
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(xScale(x) - textPainter.width / 2, margin.top + chartHeight + 8),
      );
    }
  }

  void _drawCategoricalScale(
    Canvas canvas,
    Size size,
    EdgeInsets margin,
    double chartWidth,
    double chartHeight,
    TextPainter textPainter,
  ) {
    final categories = ['A', 'B', 'C', 'D', 'E'];
    final values = [30.0, 65.0, 45.0, 80.0, 55.0];

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

    // Draw bars
    for (int i = 0; i < categories.length; i++) {
      final x = xScale(categories[i]);
      final y = yScale(values[i]);
      final bottom = yScale(0);

      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTRB(x, y, x + xScale.bandwidth, bottom),
          const Radius.circular(4),
        ),
        Paint()..color = Colors.indigo,
      );

      // X label
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

    // Y axis labels
    for (double y = 0; y <= 100; y += 25) {
      textPainter.text = TextSpan(
        text: y.toStringAsFixed(0),
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
  bool shouldRepaint(ScalePainter oldDelegate) => oldDelegate.scaleType != scaleType;
}
