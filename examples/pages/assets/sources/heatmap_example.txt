import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:data_visualization/data_visualization.dart';

class HeatmapExample extends StatelessWidget {
  const HeatmapExample({super.key});

  @override
  Widget build(BuildContext context) {
    final random = math.Random(42);
    const rows = 7;
    const cols = 12;
    final data = List.generate(
      rows,
      (r) => List.generate(cols, (c) => random.nextDouble() * 100),
    );

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Activity Heatmap',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: CustomPaint(
              size: Size.infinite,
              painter: HeatmapPainter(data: data),
            ),
          ),
          const SizedBox(height: 16),
          _buildColorScale(),
        ],
      ),
    );
  }

  Widget _buildColorScale() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Low', style: TextStyle(fontSize: 12)),
        const SizedBox(width: 8),
        Container(
          width: 200,
          height: 16,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.green.shade100,
                Colors.green.shade300,
                Colors.green.shade500,
                Colors.green.shade700,
                Colors.green.shade900,
              ],
            ),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: 8),
        const Text('High', style: TextStyle(fontSize: 12)),
      ],
    );
  }
}

class HeatmapPainter extends CustomPainter {
  final List<List<double>> data;

  HeatmapPainter({required this.data});

  @override
  void paint(Canvas canvas, Size size) {
    final rows = data.length;
    final cols = data.first.length;

    const leftMargin = 50.0;
    const bottomMargin = 30.0;

    final cellWidth = (size.width - leftMargin) / cols;
    final cellHeight = (size.height - bottomMargin) / rows;

    final colorScale = scaleSequential(
      domain: [0, 100],
      interpolator: (t) {
        final colors = [
          Colors.green.shade100,
          Colors.green.shade300,
          Colors.green.shade500,
          Colors.green.shade700,
          Colors.green.shade900,
        ];
        final index = (t * (colors.length - 1)).floor().clamp(0, colors.length - 2);
        final localT = (t * (colors.length - 1)) - index;
        return Color.lerp(colors[index], colors[index + 1], localT)!;
      },
    );

    // Draw cells
    for (int r = 0; r < rows; r++) {
      for (int c = 0; c < cols; c++) {
        final value = data[r][c];
        final color = colorScale(value);

        final rect = RRect.fromRectAndRadius(
          Rect.fromLTWH(
            leftMargin + c * cellWidth + 1,
            r * cellHeight + 1,
            cellWidth - 2,
            cellHeight - 2,
          ),
          const Radius.circular(4),
        );

        canvas.drawRRect(rect, Paint()..color = color);
      }
    }

    // Draw labels
    final textPainter = TextPainter(textDirection: TextDirection.ltr);
    final days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    final months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];

    // Row labels (days)
    for (int r = 0; r < rows; r++) {
      textPainter.text = TextSpan(
        text: days[r],
        style: const TextStyle(color: Colors.black54, fontSize: 11),
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(leftMargin - textPainter.width - 8, r * cellHeight + cellHeight / 2 - textPainter.height / 2),
      );
    }

    // Column labels (months)
    for (int c = 0; c < cols; c++) {
      textPainter.text = TextSpan(
        text: months[c],
        style: const TextStyle(color: Colors.black54, fontSize: 10),
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(leftMargin + c * cellWidth + cellWidth / 2 - textPainter.width / 2, size.height - bottomMargin + 8),
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
