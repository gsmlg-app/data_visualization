import 'dart:math' as math;
import 'package:flutter/material.dart';

class RadialBarExample extends StatelessWidget {
  const RadialBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      ('Mon', 65.0, Colors.indigo),
      ('Tue', 85.0, Colors.teal),
      ('Wed', 45.0, Colors.orange),
      ('Thu', 75.0, Colors.purple),
      ('Fri', 90.0, Colors.pink),
      ('Sat', 55.0, Colors.cyan),
      ('Sun', 40.0, Colors.amber),
    ];

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Weekly Activity',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            'Hours of productivity per day',
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
                  painter: RadialBarPainter(data: data),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class RadialBarPainter extends CustomPainter {
  final List<(String, double, Color)> data;

  RadialBarPainter({required this.data});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final maxRadius = math.min(size.width, size.height) / 2 - 40;
    final minRadius = maxRadius * 0.3;
    final barWidth = (maxRadius - minRadius) / data.length - 4;

    final maxValue = data.map((d) => d.$2).reduce((a, b) => a > b ? a : b);

    // Draw background circles
    for (int i = 0; i < data.length; i++) {
      final radius = minRadius + i * (barWidth + 4) + barWidth / 2;
      canvas.drawCircle(
        center,
        radius,
        Paint()
          ..color = Colors.grey.withAlpha(30)
          ..strokeWidth = barWidth
          ..style = PaintingStyle.stroke,
      );
    }

    // Draw radial bars
    for (int i = 0; i < data.length; i++) {
      final item = data[i];
      final radius = minRadius + i * (barWidth + 4) + barWidth / 2;
      final sweepAngle = (item.$2 / maxValue) * 1.75 * math.pi;

      // Bar
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        -math.pi / 2,
        sweepAngle,
        false,
        Paint()
          ..color = item.$3
          ..strokeWidth = barWidth
          ..strokeCap = StrokeCap.round
          ..style = PaintingStyle.stroke,
      );

      // End cap with gradient effect
      final endAngle = -math.pi / 2 + sweepAngle;
      final endX = center.dx + radius * math.cos(endAngle);
      final endY = center.dy + radius * math.sin(endAngle);

      canvas.drawCircle(
        Offset(endX, endY),
        barWidth / 2 - 1,
        Paint()..color = item.$3.withAlpha(200),
      );

      // Value label at end
      final textPainter = TextPainter(
        text: TextSpan(
          text: '${item.$2.toInt()}%',
          style: TextStyle(
            color: item.$3,
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
        ),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();

      final labelRadius = radius + barWidth / 2 + 12;
      final labelX = center.dx + labelRadius * math.cos(endAngle);
      final labelY = center.dy + labelRadius * math.sin(endAngle);

      if (sweepAngle > 0.3) {
        textPainter.paint(
          canvas,
          Offset(labelX - textPainter.width / 2, labelY - textPainter.height / 2),
        );
      }

      // Day label on left
      final dayPainter = TextPainter(
        text: TextSpan(
          text: item.$1,
          style: const TextStyle(
            color: Colors.black54,
            fontSize: 12,
          ),
        ),
        textDirection: TextDirection.ltr,
      );
      dayPainter.layout();

      final dayX = center.dx - maxRadius - 25;
      final dayY = center.dy - maxRadius + i * (barWidth + 4) + barWidth / 2;
      dayPainter.paint(
        canvas,
        Offset(dayX, dayY - dayPainter.height / 2),
      );
    }

    // Center text
    final centerPainter = TextPainter(
      text: TextSpan(
        children: [
          TextSpan(
            text: '${(data.map((d) => d.$2).reduce((a, b) => a + b) / data.length).toInt()}%\n',
            style: const TextStyle(
              color: Colors.black87,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const TextSpan(
            text: 'avg',
            style: TextStyle(
              color: Colors.black45,
              fontSize: 14,
            ),
          ),
        ],
      ),
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    );
    centerPainter.layout();
    centerPainter.paint(
      canvas,
      Offset(center.dx - centerPainter.width / 2, center.dy - centerPainter.height / 2),
    );

    // Draw scale marks
    final scalePaint = Paint()
      ..color = Colors.grey.withAlpha(100)
      ..strokeWidth = 1;

    for (int percent = 25; percent <= 100; percent += 25) {
      final angle = -math.pi / 2 + (percent / 100) * 1.75 * math.pi;
      final x1 = center.dx + (minRadius - 10) * math.cos(angle);
      final y1 = center.dy + (minRadius - 10) * math.sin(angle);
      final x2 = center.dx + (maxRadius + 5) * math.cos(angle);
      final y2 = center.dy + (maxRadius + 5) * math.sin(angle);

      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), scalePaint);

      if (percent < 100) {
        final labelPainter = TextPainter(
          text: TextSpan(
            text: '$percent',
            style: TextStyle(
              color: Colors.grey.shade500,
              fontSize: 9,
            ),
          ),
          textDirection: TextDirection.ltr,
        );
        labelPainter.layout();

        final labelX = center.dx + (maxRadius + 15) * math.cos(angle);
        final labelY = center.dy + (maxRadius + 15) * math.sin(angle);
        labelPainter.paint(
          canvas,
          Offset(labelX - labelPainter.width / 2, labelY - labelPainter.height / 2),
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
