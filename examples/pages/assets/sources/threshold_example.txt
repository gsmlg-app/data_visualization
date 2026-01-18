import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:data_visualization/data_visualization.dart';

class ThresholdExample extends StatelessWidget {
  const ThresholdExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Threshold / Difference Area',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            'Comparing actual vs expected values',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.grey.shade600,
                ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return CustomPaint(
                  size: Size(constraints.maxWidth, constraints.maxHeight),
                  painter: ThresholdPainter(),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _legendItem(Colors.green.withAlpha(150), 'Above Expected'),
              const SizedBox(width: 24),
              _legendItem(Colors.red.withAlpha(150), 'Below Expected'),
              const SizedBox(width: 24),
              _legendItem(Colors.grey.shade400, 'Expected', isDashed: true),
              const SizedBox(width: 24),
              _legendItem(Colors.indigo, 'Actual'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _legendItem(Color color, String label, {bool isDashed = false}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (isDashed)
          Container(
            width: 16,
            height: 2,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: color,
                  width: 2,
                  style: BorderStyle.solid,
                ),
              ),
            ),
          )
        else
          Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        const SizedBox(width: 8),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}

class ThresholdPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const margin = EdgeInsets.only(left: 60, right: 20, top: 20, bottom: 50);
    final chartWidth = size.width - margin.left - margin.right;
    final chartHeight = size.height - margin.top - margin.bottom;

    // Generate data
    final random = math.Random(42);
    final numPoints = 30;

    // Expected values (smooth baseline)
    final expected = List.generate(numPoints, (i) {
      return 50 + 15 * math.sin(i * 0.2);
    });

    // Actual values (fluctuate around expected)
    final actual = List.generate(numPoints, (i) {
      return expected[i] + (random.nextDouble() - 0.5) * 40;
    });

    final xScale = scaleLinear(
      domain: [0, numPoints - 1],
      range: [margin.left, margin.left + chartWidth],
    );

    final yScale = scaleLinear(
      domain: [0, 100],
      range: [margin.top + chartHeight, margin.top],
    );

    // Draw grid
    for (double y = 0; y <= 100; y += 20) {
      canvas.drawLine(
        Offset(margin.left, yScale(y)),
        Offset(margin.left + chartWidth, yScale(y)),
        Paint()..color = Colors.grey.withAlpha(50),
      );
    }

    // Draw difference areas
    final curve = curveMonotoneX();

    final actualPoints = List.generate(numPoints, (i) => Point(xScale(i.toDouble()), yScale(actual[i])));
    final expectedPoints = List.generate(numPoints, (i) => Point(xScale(i.toDouble()), yScale(expected[i])));

    final smoothActual = curve.generate(actualPoints);
    final smoothExpected = curve.generate(expectedPoints);

    // Draw areas where actual differs from expected
    for (int i = 0; i < smoothActual.length - 1; i++) {
      final x0 = smoothActual[i].x;
      final x1 = smoothActual[i + 1].x;

      // Find corresponding expected values
      final t = i / (smoothActual.length - 1);
      final expIdx = (t * (smoothExpected.length - 1)).floor().clamp(0, smoothExpected.length - 2);

      final actualY0 = smoothActual[i].y;
      final actualY1 = smoothActual[i + 1].y;
      final expectedY0 = smoothExpected[expIdx].y;
      final expectedY1 = smoothExpected[math.min(expIdx + 1, smoothExpected.length - 1)].y;

      final path = Path();
      path.moveTo(x0, actualY0);
      path.lineTo(x1, actualY1);
      path.lineTo(x1, expectedY1);
      path.lineTo(x0, expectedY0);
      path.close();

      // Determine color based on whether actual is above or below expected
      final isAbove = (actualY0 + actualY1) / 2 < (expectedY0 + expectedY1) / 2;
      final color = isAbove
          ? Colors.green.withAlpha(100)
          : Colors.red.withAlpha(100);

      canvas.drawPath(path, Paint()..color = color);
    }

    // Draw expected line (dashed)
    if (smoothExpected.isNotEmpty) {
      final dashPath = Path();
      const dashLength = 8.0;
      const gapLength = 4.0;

      for (int i = 0; i < smoothExpected.length - 1; i++) {
        final start = Offset(smoothExpected[i].x, smoothExpected[i].y);
        final end = Offset(smoothExpected[i + 1].x, smoothExpected[i + 1].y);
        final distance = (end - start).distance;

        if (distance < dashLength) {
          dashPath.moveTo(start.dx, start.dy);
          dashPath.lineTo(end.dx, end.dy);
        } else {
          final direction = (end - start) / distance;
          var current = 0.0;
          var drawing = true;

          while (current < distance) {
            final segmentLength = drawing ? dashLength : gapLength;
            final segmentEnd = math.min(current + segmentLength, distance);

            if (drawing) {
              final p1 = start + direction * current;
              final p2 = start + direction * segmentEnd;
              dashPath.moveTo(p1.dx, p1.dy);
              dashPath.lineTo(p2.dx, p2.dy);
            }

            current = segmentEnd;
            drawing = !drawing;
          }
        }
      }

      canvas.drawPath(
        dashPath,
        Paint()
          ..color = Colors.grey.shade500
          ..strokeWidth = 2
          ..style = PaintingStyle.stroke,
      );
    }

    // Draw actual line
    if (smoothActual.isNotEmpty) {
      final actualPath = Path();
      actualPath.moveTo(smoothActual.first.x, smoothActual.first.y);
      for (int i = 1; i < smoothActual.length; i++) {
        actualPath.lineTo(smoothActual[i].x, smoothActual[i].y);
      }

      canvas.drawPath(
        actualPath,
        Paint()
          ..color = Colors.indigo
          ..strokeWidth = 2.5
          ..style = PaintingStyle.stroke,
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

    // Draw labels
    final textPainter = TextPainter(textDirection: TextDirection.ltr);

    for (double y = 0; y <= 100; y += 20) {
      textPainter.text = TextSpan(
        text: y.toInt().toString(),
        style: const TextStyle(color: Colors.black54, fontSize: 11),
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(margin.left - textPainter.width - 8, yScale(y) - textPainter.height / 2),
      );
    }

    final months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'];
    for (int i = 0; i < months.length; i++) {
      final x = xScale(i * (numPoints - 1) / (months.length - 1));
      textPainter.text = TextSpan(
        text: months[i],
        style: const TextStyle(color: Colors.black54, fontSize: 11),
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(x - textPainter.width / 2, margin.top + chartHeight + 8),
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
