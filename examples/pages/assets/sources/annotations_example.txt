import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:data_visualization/data_visualization.dart';

class AnnotationsExample extends StatelessWidget {
  const AnnotationsExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Annotations',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            'Labels, callouts, and reference lines',
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
                  painter: AnnotationsPainter(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class AnnotationsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const margin = EdgeInsets.only(left: 60, right: 40, top: 40, bottom: 50);
    final chartWidth = size.width - margin.left - margin.right;
    final chartHeight = size.height - margin.top - margin.bottom;

    // Generate data
    final random = math.Random(42);
    final data = List.generate(20, (i) {
      final base = 40 + 30 * math.sin(i * 0.3);
      return Point(i.toDouble(), base + random.nextDouble() * 20);
    });

    final xScale = scaleLinear(
      domain: [0, 19],
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

    // Draw reference line (average)
    final avg = data.map((p) => p.y).reduce((a, b) => a + b) / data.length;
    canvas.drawLine(
      Offset(margin.left, yScale(avg)),
      Offset(margin.left + chartWidth, yScale(avg)),
      Paint()
        ..color = Colors.red.withAlpha(150)
        ..strokeWidth = 2
        ..style = PaintingStyle.stroke,
    );

    // Average label
    _drawLabel(
      canvas,
      'Avg: ${avg.toStringAsFixed(1)}',
      Offset(margin.left + chartWidth + 5, yScale(avg)),
      Colors.red,
      alignment: Alignment.centerLeft,
    );

    // Draw threshold zone
    final thresholdRect = Rect.fromLTRB(
      margin.left,
      yScale(70),
      margin.left + chartWidth,
      yScale(50),
    );
    canvas.drawRect(
      thresholdRect,
      Paint()..color = Colors.green.withAlpha(30),
    );
    canvas.drawLine(
      Offset(margin.left, yScale(70)),
      Offset(margin.left + chartWidth, yScale(70)),
      Paint()
        ..color = Colors.green.withAlpha(150)
        ..strokeWidth = 1
        ..style = PaintingStyle.stroke,
    );
    canvas.drawLine(
      Offset(margin.left, yScale(50)),
      Offset(margin.left + chartWidth, yScale(50)),
      Paint()
        ..color = Colors.green.withAlpha(150)
        ..strokeWidth = 1
        ..style = PaintingStyle.stroke,
    );

    // Zone label
    _drawLabel(
      canvas,
      'Target Zone',
      Offset(margin.left + 10, yScale(60)),
      Colors.green.shade700,
      alignment: Alignment.centerLeft,
      fontSize: 11,
    );

    // Draw line chart
    final curve = curveCatmullRom();
    final points = data.map((p) => Point(xScale(p.x), yScale(p.y))).toList();
    final curvePoints = curve.generate(points);

    if (curvePoints.isNotEmpty) {
      final path = Path()..moveTo(curvePoints.first.x, curvePoints.first.y);
      for (int i = 1; i < curvePoints.length; i++) {
        path.lineTo(curvePoints[i].x, curvePoints[i].y);
      }
      canvas.drawPath(
        path,
        Paint()
          ..color = Colors.indigo
          ..strokeWidth = 2.5
          ..style = PaintingStyle.stroke,
      );
    }

    // Draw points
    for (final p in points) {
      canvas.drawCircle(Offset(p.x, p.y), 4, Paint()..color = Colors.indigo);
    }

    // Annotation 1: Callout for peak
    final peakIdx = data.indexWhere((p) => p.y == data.map((d) => d.y).reduce((a, b) => a > b ? a : b));
    final peakPoint = Offset(xScale(data[peakIdx].x), yScale(data[peakIdx].y));
    _drawCallout(
      canvas,
      'Peak: ${data[peakIdx].y.toStringAsFixed(1)}',
      peakPoint,
      Offset(peakPoint.dx + 40, peakPoint.dy - 50),
      Colors.indigo,
    );

    // Annotation 2: Callout for min
    final minIdx = data.indexWhere((p) => p.y == data.map((d) => d.y).reduce((a, b) => a < b ? a : b));
    final minPoint = Offset(xScale(data[minIdx].x), yScale(data[minIdx].y));
    _drawCallout(
      canvas,
      'Low: ${data[minIdx].y.toStringAsFixed(1)}',
      minPoint,
      Offset(minPoint.dx - 50, minPoint.dy + 40),
      Colors.orange,
    );

    // Annotation 3: Vertical marker
    const markerX = 10.0;
    canvas.drawLine(
      Offset(xScale(markerX), margin.top),
      Offset(xScale(markerX), margin.top + chartHeight),
      Paint()
        ..color = Colors.purple.withAlpha(100)
        ..strokeWidth = 2,
    );
    _drawLabel(
      canvas,
      'Milestone',
      Offset(xScale(markerX), margin.top - 5),
      Colors.purple,
      alignment: Alignment.bottomCenter,
    );

    // Draw axis labels
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

    for (int i = 0; i <= 19; i += 5) {
      textPainter.text = TextSpan(
        text: 'Day $i',
        style: const TextStyle(color: Colors.black54, fontSize: 11),
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(xScale(i.toDouble()) - textPainter.width / 2, margin.top + chartHeight + 8),
      );
    }
  }

  void _drawLabel(
    Canvas canvas,
    String text,
    Offset position,
    Color color, {
    Alignment alignment = Alignment.center,
    double fontSize = 12,
  }) {
    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: FontWeight.w500,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();

    double x = position.dx;
    double y = position.dy;

    if (alignment == Alignment.centerLeft) {
      y -= textPainter.height / 2;
    } else if (alignment == Alignment.bottomCenter) {
      x -= textPainter.width / 2;
      y -= textPainter.height;
    } else {
      x -= textPainter.width / 2;
      y -= textPainter.height / 2;
    }

    textPainter.paint(canvas, Offset(x, y));
  }

  void _drawCallout(
    Canvas canvas,
    String text,
    Offset point,
    Offset labelPos,
    Color color,
  ) {
    // Draw connector line
    canvas.drawLine(
      point,
      labelPos,
      Paint()
        ..color = color.withAlpha(150)
        ..strokeWidth = 1,
    );

    // Draw point highlight
    canvas.drawCircle(point, 8, Paint()..color = color.withAlpha(50));
    canvas.drawCircle(
      point,
      8,
      Paint()
        ..color = color
        ..strokeWidth = 2
        ..style = PaintingStyle.stroke,
    );

    // Draw label background
    final textPainter = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 11,
          fontWeight: FontWeight.w500,
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();

    final labelRect = RRect.fromRectAndRadius(
      Rect.fromCenter(
        center: labelPos,
        width: textPainter.width + 16,
        height: textPainter.height + 8,
      ),
      const Radius.circular(4),
    );

    canvas.drawRRect(labelRect, Paint()..color = color);
    textPainter.paint(
      canvas,
      Offset(labelPos.dx - textPainter.width / 2, labelPos.dy - textPainter.height / 2),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
