import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:data_visualization/data_visualization.dart';

class GradientsExample extends StatefulWidget {
  const GradientsExample({super.key});

  @override
  State<GradientsExample> createState() => _GradientsExampleState();
}

class _GradientsExampleState extends State<GradientsExample> {
  String _gradientType = 'Linear Vertical';
  final _types = ['Linear Vertical', 'Linear Horizontal', 'Radial'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Gradients',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const Spacer(),
              Wrap(
                spacing: 8,
                children: _types.map((t) {
                  return ChoiceChip(
                    label: Text(t),
                    selected: _gradientType == t,
                    onSelected: (_) => setState(() => _gradientType = t),
                  );
                }).toList(),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return CustomPaint(
                  size: Size(constraints.maxWidth, constraints.maxHeight),
                  painter: GradientsPainter(gradientType: _gradientType),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          _buildGradientPalette(),
        ],
      ),
    );
  }

  Widget _buildGradientPalette() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Gradient Palettes',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _gradientSwatch('Ocean', [Colors.cyan.shade900, Colors.cyan.shade100]),
              const SizedBox(width: 16),
              _gradientSwatch('Sunset', [Colors.orange.shade800, Colors.pink.shade300]),
              const SizedBox(width: 16),
              _gradientSwatch('Forest', [Colors.green.shade800, Colors.lime.shade300]),
              const SizedBox(width: 16),
              _gradientSwatch('Purple', [Colors.purple.shade800, Colors.pink.shade200]),
            ],
          ),
        ],
      ),
    );
  }

  Widget _gradientSwatch(String name, List<Color> colors) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 20,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: colors),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(height: 4),
        Text(name, style: const TextStyle(fontSize: 10)),
      ],
    );
  }
}

class GradientsPainter extends CustomPainter {
  final String gradientType;

  GradientsPainter({required this.gradientType});

  @override
  void paint(Canvas canvas, Size size) {
    const margin = EdgeInsets.only(left: 60, right: 40, top: 40, bottom: 50);
    final chartWidth = size.width - margin.left - margin.right;
    final chartHeight = size.height - margin.top - margin.bottom;

    // Generate data
    final random = math.Random(42);
    final data = List.generate(25, (i) {
      return Point(i.toDouble(), 30 + 50 * math.sin(i * 0.25) + random.nextDouble() * 20);
    });

    final xScale = scaleLinear(
      domain: [0, 24],
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

    // Create gradient
    Shader shader;
    switch (gradientType) {
      case 'Linear Horizontal':
        shader = LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Colors.indigo,
            Colors.purple,
            Colors.pink,
          ],
        ).createShader(Rect.fromLTWH(margin.left, 0, chartWidth, chartHeight));
        break;
      case 'Radial':
        shader = RadialGradient(
          center: Alignment.center,
          radius: 1.0,
          colors: [
            Colors.orange,
            Colors.pink,
            Colors.purple,
          ],
        ).createShader(Rect.fromLTWH(
          margin.left,
          margin.top,
          chartWidth,
          chartHeight,
        ));
        break;
      default: // Linear Vertical
        shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.cyan.shade700,
            Colors.cyan.shade100,
          ],
        ).createShader(Rect.fromLTWH(0, margin.top, size.width, chartHeight));
    }

    // Draw area with gradient
    final curve = curveBasis();
    final points = data.map((p) => Point(xScale(p.x), yScale(p.y))).toList();
    final curvePoints = curve.generate(points);

    if (curvePoints.isNotEmpty) {
      // Area fill
      final areaPath = Path();
      areaPath.moveTo(xScale(0), yScale(0));
      for (final p in curvePoints) {
        areaPath.lineTo(p.x, p.y);
      }
      areaPath.lineTo(xScale(24), yScale(0));
      areaPath.close();

      canvas.drawPath(
        areaPath,
        Paint()
          ..shader = shader
          ..style = PaintingStyle.fill,
      );

      // Line stroke
      final linePath = Path();
      linePath.moveTo(curvePoints.first.x, curvePoints.first.y);
      for (int i = 1; i < curvePoints.length; i++) {
        linePath.lineTo(curvePoints[i].x, curvePoints[i].y);
      }

      canvas.drawPath(
        linePath,
        Paint()
          ..shader = shader
          ..strokeWidth = 3
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

    // Draw points with gradient-colored fill
    for (int i = 0; i < points.length; i++) {
      final t = i / (points.length - 1);
      Color pointColor;
      switch (gradientType) {
        case 'Linear Horizontal':
          pointColor = Color.lerp(Colors.indigo, Colors.pink, t)!;
          break;
        case 'Radial':
          pointColor = Color.lerp(Colors.orange, Colors.purple, t)!;
          break;
        default:
          final yRatio = 1 - (data[i].y / 100);
          pointColor = Color.lerp(Colors.cyan.shade700, Colors.cyan.shade100, yRatio)!;
      }

      canvas.drawCircle(
        Offset(points[i].x, points[i].y),
        5,
        Paint()..color = pointColor,
      );
      canvas.drawCircle(
        Offset(points[i].x, points[i].y),
        5,
        Paint()
          ..color = Colors.white
          ..strokeWidth = 2
          ..style = PaintingStyle.stroke,
      );
    }

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

    for (int i = 0; i <= 24; i += 6) {
      textPainter.text = TextSpan(
        text: '${i}h',
        style: const TextStyle(color: Colors.black54, fontSize: 11),
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(xScale(i.toDouble()) - textPainter.width / 2, margin.top + chartHeight + 8),
      );
    }
  }

  @override
  bool shouldRepaint(covariant GradientsPainter oldDelegate) =>
      oldDelegate.gradientType != gradientType;
}
