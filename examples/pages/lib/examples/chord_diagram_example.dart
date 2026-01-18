import 'dart:math' as math;
import 'package:flutter/material.dart';

class ChordDiagramExample extends StatelessWidget {
  const ChordDiagramExample({super.key});

  @override
  Widget build(BuildContext context) {
    // Flow matrix: rows = source, columns = target
    final matrix = [
      [0.0, 25.0, 15.0, 10.0, 5.0],   // From A
      [20.0, 0.0, 18.0, 8.0, 12.0],   // From B
      [12.0, 22.0, 0.0, 14.0, 6.0],   // From C
      [8.0, 10.0, 16.0, 0.0, 10.0],   // From D
      [15.0, 8.0, 12.0, 18.0, 0.0],   // From E
    ];
    final labels = ['Product A', 'Product B', 'Product C', 'Product D', 'Product E'];
    final colors = [Colors.indigo, Colors.teal, Colors.orange, Colors.purple, Colors.pink];

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Cross-Selling Relationships',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            'Product purchase correlations',
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
                  painter: ChordDiagramPainter(
                    matrix: matrix,
                    labels: labels,
                    colors: colors,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ChordDiagramPainter extends CustomPainter {
  final List<List<double>> matrix;
  final List<String> labels;
  final List<Color> colors;

  ChordDiagramPainter({
    required this.matrix,
    required this.labels,
    required this.colors,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final outerRadius = math.min(size.width, size.height) / 2 - 50;
    final innerRadius = outerRadius - 25;

    final n = matrix.length;
    final groupTotals = <double>[];
    for (int i = 0; i < n; i++) {
      double total = 0;
      for (int j = 0; j < n; j++) {
        total += matrix[i][j] + matrix[j][i];
      }
      groupTotals.add(total);
    }

    final totalSum = groupTotals.reduce((a, b) => a + b);
    const padAngle = 0.04;
    final availableAngle = 2 * math.pi - n * padAngle;

    // Calculate arc positions
    final arcs = <_Arc>[];
    double currentAngle = -math.pi / 2;

    for (int i = 0; i < n; i++) {
      final sweepAngle = (groupTotals[i] / totalSum) * availableAngle;
      arcs.add(_Arc(
        startAngle: currentAngle,
        endAngle: currentAngle + sweepAngle,
        color: colors[i],
      ));
      currentAngle += sweepAngle + padAngle;
    }

    // Draw outer arcs (groups)
    for (int i = 0; i < n; i++) {
      final arc = arcs[i];
      final arcPath = Path();
      arcPath.addArc(
        Rect.fromCircle(center: center, radius: outerRadius),
        arc.startAngle,
        arc.endAngle - arc.startAngle,
      );
      arcPath.arcTo(
        Rect.fromCircle(center: center, radius: innerRadius),
        arc.endAngle,
        -(arc.endAngle - arc.startAngle),
        false,
      );
      arcPath.close();

      canvas.drawPath(arcPath, Paint()..color = arc.color);
      canvas.drawPath(
        arcPath,
        Paint()
          ..color = arc.color.withAlpha(200)
          ..strokeWidth = 1
          ..style = PaintingStyle.stroke,
      );

      // Draw label
      final midAngle = (arc.startAngle + arc.endAngle) / 2;
      final labelRadius = outerRadius + 25;
      final labelX = center.dx + labelRadius * math.cos(midAngle);
      final labelY = center.dy + labelRadius * math.sin(midAngle);

      final textPainter = TextPainter(
        text: TextSpan(
          text: labels[i],
          style: TextStyle(
            color: arc.color,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();

      canvas.save();
      canvas.translate(labelX, labelY);
      if (midAngle > math.pi / 2 && midAngle < 3 * math.pi / 2) {
        canvas.rotate(midAngle + math.pi);
        canvas.translate(-textPainter.width, -textPainter.height / 2);
      } else {
        canvas.rotate(midAngle);
        canvas.translate(0, -textPainter.height / 2);
      }
      textPainter.paint(canvas, Offset.zero);
      canvas.restore();
    }

    // Draw chords
    for (int i = 0; i < n; i++) {
      for (int j = i + 1; j < n; j++) {
        final value = matrix[i][j] + matrix[j][i];
        if (value <= 0) continue;

        // Calculate chord positions within each arc
        final arcI = arcs[i];
        final arcJ = arcs[j];
        final arcIRange = arcI.endAngle - arcI.startAngle;
        final arcJRange = arcJ.endAngle - arcJ.startAngle;

        // Position within arc based on value proportion
        final chordWidthI = (value / groupTotals[i]) * arcIRange;
        final chordWidthJ = (value / groupTotals[j]) * arcJRange;

        final startAngleI = arcI.startAngle + (j / n) * (arcIRange - chordWidthI);
        final endAngleI = startAngleI + chordWidthI;
        final startAngleJ = arcJ.startAngle + (i / n) * (arcJRange - chordWidthJ);
        final endAngleJ = startAngleJ + chordWidthJ;

        // Draw chord
        final chordPath = Path();

        // Start arc
        chordPath.moveTo(
          center.dx + innerRadius * math.cos(startAngleI),
          center.dy + innerRadius * math.sin(startAngleI),
        );
        chordPath.arcTo(
          Rect.fromCircle(center: center, radius: innerRadius),
          startAngleI,
          endAngleI - startAngleI,
          false,
        );

        // Bezier to target
        chordPath.quadraticBezierTo(
          center.dx,
          center.dy,
          center.dx + innerRadius * math.cos(endAngleJ),
          center.dy + innerRadius * math.sin(endAngleJ),
        );

        // Target arc
        chordPath.arcTo(
          Rect.fromCircle(center: center, radius: innerRadius),
          endAngleJ,
          startAngleJ - endAngleJ,
          false,
        );

        // Bezier back
        chordPath.quadraticBezierTo(
          center.dx,
          center.dy,
          center.dx + innerRadius * math.cos(startAngleI),
          center.dy + innerRadius * math.sin(startAngleI),
        );

        chordPath.close();

        // Blend colors for chord
        final chordColor = Color.lerp(colors[i], colors[j], 0.5)!.withAlpha(100);
        canvas.drawPath(chordPath, Paint()..color = chordColor);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _Arc {
  final double startAngle;
  final double endAngle;
  final Color color;

  _Arc({required this.startAngle, required this.endAngle, required this.color});
}
