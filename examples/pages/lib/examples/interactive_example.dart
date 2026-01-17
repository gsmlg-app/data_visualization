import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:data_visualization/data_visualization.dart';

class InteractiveExample extends StatefulWidget {
  const InteractiveExample({super.key});

  @override
  State<InteractiveExample> createState() => _InteractiveExampleState();
}

class _InteractiveExampleState extends State<InteractiveExample> {
  int? _hoveredIndex;
  Point? _tooltipPosition;

  late final List<Point> data;

  @override
  void initState() {
    super.initState();
    data = List.generate(
      15,
      (i) => Point(i.toDouble(), 20 + 50 * math.sin(i * 0.3) + math.Random(i).nextDouble() * 20),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return MouseRegion(
                  onHover: (event) => _handleHover(event.localPosition, constraints),
                  onExit: (_) => setState(() {
                    _hoveredIndex = null;
                    _tooltipPosition = null;
                  }),
                  child: Stack(
                    children: [
                      CustomPaint(
                        size: Size(constraints.maxWidth, constraints.maxHeight),
                        painter: InteractiveChartPainter(
                          data: data,
                          hoveredIndex: _hoveredIndex,
                        ),
                      ),
                      if (_hoveredIndex != null && _tooltipPosition != null)
                        Positioned(
                          left: _tooltipPosition!.x + 10,
                          top: _tooltipPosition!.y - 50,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.black87,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Point ${_hoveredIndex! + 1}',
                                  style: const TextStyle(color: Colors.white70, fontSize: 11),
                                ),
                                Text(
                                  'Value: ${data[_hoveredIndex!].y.toStringAsFixed(1)}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.indigo.shade50,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Icon(Icons.info_outline, color: Colors.indigo.shade700),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    _hoveredIndex != null
                        ? 'Hovering over point ${_hoveredIndex! + 1} with value ${data[_hoveredIndex!].y.toStringAsFixed(1)}'
                        : 'Hover over the chart to see point details',
                    style: TextStyle(color: Colors.indigo.shade700),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _handleHover(Offset position, BoxConstraints constraints) {
    const margin = EdgeInsets.only(left: 50, right: 20, top: 20, bottom: 40);
    final size = Size(constraints.maxWidth, constraints.maxHeight);

    final chartWidth = size.width - margin.left - margin.right;
    final chartHeight = size.height - margin.top - margin.bottom;

    if (chartWidth <= 0 || chartHeight <= 0) return;

    final xScale = scaleLinear(
      domain: [0, 14],
      range: [margin.left, margin.left + chartWidth],
    );

    final yMax = data.map((p) => p.y).reduce(math.max);
    final yScale = scaleLinear(
      domain: [0, yMax * 1.1],
      range: [margin.top + chartHeight, margin.top],
    );

    int? closest;
    double minDist = 25;

    for (int i = 0; i < data.length; i++) {
      final px = xScale(data[i].x);
      final py = yScale(data[i].y);
      final dist = math.sqrt(math.pow(position.dx - px, 2) + math.pow(position.dy - py, 2));
      if (dist < minDist) {
        minDist = dist;
        closest = i;
      }
    }

    if (closest != _hoveredIndex) {
      setState(() {
        _hoveredIndex = closest;
        if (closest != null) {
          _tooltipPosition = Point(
            xScale(data[closest].x),
            yScale(data[closest].y),
          );
        } else {
          _tooltipPosition = null;
        }
      });
    }
  }
}

class InteractiveChartPainter extends CustomPainter {
  final List<Point> data;
  final int? hoveredIndex;

  InteractiveChartPainter({required this.data, required this.hoveredIndex});

  @override
  void paint(Canvas canvas, Size size) {
    const margin = EdgeInsets.only(left: 50, right: 20, top: 20, bottom: 40);
    final chartWidth = size.width - margin.left - margin.right;
    final chartHeight = size.height - margin.top - margin.bottom;

    final yMax = data.map((p) => p.y).reduce(math.max);

    final xScale = scaleLinear(
      domain: [0, 14],
      range: [margin.left, margin.left + chartWidth],
    );

    final yScale = scaleLinear(
      domain: [0, yMax * 1.1],
      range: [margin.top + chartHeight, margin.top],
    );

    // Draw grid
    for (double y = 0; y <= yMax * 1.1; y += 20) {
      canvas.drawLine(
        Offset(margin.left, yScale(y)),
        Offset(margin.left + chartWidth, yScale(y)),
        Paint()..color = Colors.grey.withAlpha(50),
      );
    }

    // Draw area fill
    final areaPath = Path();
    areaPath.moveTo(xScale(0), yScale(0));
    for (final p in data) {
      areaPath.lineTo(xScale(p.x), yScale(p.y));
    }
    areaPath.lineTo(xScale(data.last.x), yScale(0));
    areaPath.close();

    canvas.drawPath(
      areaPath,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.indigo.withAlpha(80), Colors.indigo.withAlpha(10)],
        ).createShader(Rect.fromLTWH(0, 0, size.width, size.height)),
    );

    // Draw line
    final linePath = Path();
    linePath.moveTo(xScale(data.first.x), yScale(data.first.y));
    for (int i = 1; i < data.length; i++) {
      linePath.lineTo(xScale(data[i].x), yScale(data[i].y));
    }

    canvas.drawPath(
      linePath,
      Paint()
        ..color = Colors.indigo
        ..strokeWidth = 2.5
        ..style = PaintingStyle.stroke,
    );

    // Draw points
    for (int i = 0; i < data.length; i++) {
      final px = xScale(data[i].x);
      final py = yScale(data[i].y);
      final isHovered = i == hoveredIndex;

      if (isHovered) {
        canvas.drawCircle(
          Offset(px, py),
          14,
          Paint()..color = Colors.indigo.withAlpha(50),
        );
      }

      canvas.drawCircle(
        Offset(px, py),
        isHovered ? 7 : 5,
        Paint()..color = isHovered ? Colors.indigo.shade700 : Colors.indigo,
      );
      canvas.drawCircle(
        Offset(px, py),
        isHovered ? 4 : 2,
        Paint()..color = Colors.white,
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

    // Labels
    final textPainter = TextPainter(textDirection: TextDirection.ltr);

    for (double y = 0; y <= yMax * 1.1; y += 20) {
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

  @override
  bool shouldRepaint(InteractiveChartPainter old) => old.hoveredIndex != hoveredIndex;
}
