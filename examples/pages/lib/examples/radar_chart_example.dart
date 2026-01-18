import 'dart:math' as math;
import 'package:flutter/material.dart';

class RadarChartExample extends StatelessWidget {
  const RadarChartExample({super.key});

  @override
  Widget build(BuildContext context) {
    final dimensions = ['Speed', 'Power', 'Defense', 'Accuracy', 'Stamina', 'Agility'];
    final player1 = [85.0, 70.0, 65.0, 90.0, 75.0, 80.0];
    final player2 = [70.0, 85.0, 80.0, 60.0, 90.0, 65.0];

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return CustomPaint(
                  size: Size(constraints.maxWidth, constraints.maxHeight),
                  painter: RadarChartPainter(
                    dimensions: dimensions,
                    player1: player1,
                    player2: player2,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _legendItem(Colors.indigo.withAlpha(150), 'Player A'),
              const SizedBox(width: 24),
              _legendItem(Colors.teal.withAlpha(150), 'Player B'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _legendItem(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: 8),
        Text(label),
      ],
    );
  }
}

class RadarChartPainter extends CustomPainter {
  final List<String> dimensions;
  final List<double> player1;
  final List<double> player2;

  RadarChartPainter({
    required this.dimensions,
    required this.player1,
    required this.player2,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width, size.height) / 2 - 60;
    final numDimensions = dimensions.length;
    final angleStep = (2 * math.pi) / numDimensions;

    // Draw concentric circles (grid)
    final gridPaint = Paint()
      ..color = Colors.grey.withAlpha(80)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    for (int level = 1; level <= 5; level++) {
      final r = radius * (level / 5);
      canvas.drawCircle(center, r, gridPaint);
    }

    // Draw axis lines
    final axisPaint = Paint()
      ..color = Colors.grey.withAlpha(100)
      ..strokeWidth = 1;

    for (int i = 0; i < numDimensions; i++) {
      final angle = -math.pi / 2 + i * angleStep;
      final x = center.dx + radius * math.cos(angle);
      final y = center.dy + radius * math.sin(angle);
      canvas.drawLine(center, Offset(x, y), axisPaint);
    }

    // Draw data polygons
    void drawDataPolygon(List<double> data, Color fillColor, Color strokeColor) {
      final points = <Offset>[];
      for (int i = 0; i < numDimensions; i++) {
        final angle = -math.pi / 2 + i * angleStep;
        final value = data[i] / 100; // Normalize to 0-1
        final r = radius * value;
        points.add(Offset(
          center.dx + r * math.cos(angle),
          center.dy + r * math.sin(angle),
        ));
      }

      final path = Path();
      path.moveTo(points.first.dx, points.first.dy);
      for (int i = 1; i < points.length; i++) {
        path.lineTo(points[i].dx, points[i].dy);
      }
      path.close();

      canvas.drawPath(path, Paint()..color = fillColor);
      canvas.drawPath(
        path,
        Paint()
          ..color = strokeColor
          ..strokeWidth = 2
          ..style = PaintingStyle.stroke,
      );

      // Draw points
      for (final point in points) {
        canvas.drawCircle(point, 5, Paint()..color = strokeColor);
        canvas.drawCircle(point, 2, Paint()..color = Colors.white);
      }
    }

    // Draw player2 first (behind)
    drawDataPolygon(player2, Colors.teal.withAlpha(100), Colors.teal);
    // Draw player1 on top
    drawDataPolygon(player1, Colors.indigo.withAlpha(100), Colors.indigo);

    // Draw dimension labels
    final textPainter = TextPainter(textDirection: TextDirection.ltr);
    for (int i = 0; i < numDimensions; i++) {
      final angle = -math.pi / 2 + i * angleStep;
      final labelRadius = radius + 30;
      final x = center.dx + labelRadius * math.cos(angle);
      final y = center.dy + labelRadius * math.sin(angle);

      textPainter.text = TextSpan(
        text: dimensions[i],
        style: const TextStyle(
          color: Colors.black87,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(x - textPainter.width / 2, y - textPainter.height / 2),
      );
    }

    // Draw center value labels
    for (int level = 1; level <= 5; level++) {
      final value = level * 20;
      final r = radius * (level / 5);
      textPainter.text = TextSpan(
        text: '$value',
        style: TextStyle(
          color: Colors.grey.shade600,
          fontSize: 10,
        ),
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(
          center.dx - textPainter.width / 2,
          center.dy - r - textPainter.height - 2,
        ),
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
