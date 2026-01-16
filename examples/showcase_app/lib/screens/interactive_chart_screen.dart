import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:data_visualization/data_visualization.dart';

class InteractiveChartScreen extends StatefulWidget {
  const InteractiveChartScreen({super.key});

  @override
  State<InteractiveChartScreen> createState() => _InteractiveChartScreenState();
}

class _InteractiveChartScreenState extends State<InteractiveChartScreen> {
  int? _hoveredIndex;
  Point? _tooltipPosition;

  late final List<Point> data;

  @override
  void initState() {
    super.initState();
    data = List.generate(
      20,
      (i) => Point(i.toDouble(), 20 + 50 * math.sin(i * 0.3) + math.Random(i).nextDouble() * 20),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interactive Chart'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Hover for Details',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Move your mouse over the data points to see values',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: MouseRegion(
                onHover: (event) => _handleHover(event.localPosition),
                onExit: (_) => setState(() {
                  _hoveredIndex = null;
                  _tooltipPosition = null;
                }),
                child: Stack(
                  children: [
                    CustomPaint(
                      size: Size.infinite,
                      painter: InteractiveChartPainter(
                        data: data,
                        hoveredIndex: _hoveredIndex,
                      ),
                    ),
                    if (_hoveredIndex != null && _tooltipPosition != null)
                      Positioned(
                        left: _tooltipPosition!.x + 10,
                        top: _tooltipPosition!.y - 40,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.black87,
                            borderRadius: BorderRadius.circular(4),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Point ${_hoveredIndex! + 1}',
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 11,
                                ),
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
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const Icon(Icons.info_outline, color: Colors.blue),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      _hoveredIndex != null
                          ? 'Hovering over point ${_hoveredIndex! + 1} with value ${data[_hoveredIndex!].y.toStringAsFixed(1)}'
                          : 'Hover over the chart to see point details',
                      style: TextStyle(color: Colors.blue.shade700),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleHover(Offset position) {
    // Find nearest point
    const margin = EdgeInsets.only(left: 50, right: 20, top: 20, bottom: 40);

    // Get size from context
    final renderBox = context.findRenderObject() as RenderBox?;
    if (renderBox == null) return;

    final size = Size(
      renderBox.size.width - 48, // Account for padding
      renderBox.size.height - 200, // Account for other widgets
    );

    final chartWidth = size.width - margin.left - margin.right;
    final chartHeight = size.height - margin.top - margin.bottom;

    if (chartWidth <= 0 || chartHeight <= 0) return;

    final xScale = scaleLinear(
      domain: [0, 19],
      range: [margin.left, margin.left + chartWidth],
    );

    final yMax = data.map((p) => p.y).reduce(math.max);
    final yScale = scaleLinear(
      domain: [0, yMax * 1.1],
      range: [margin.top + chartHeight, margin.top],
    );

    // Find closest point
    int? closest;
    double minDist = 20; // Threshold

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

  InteractiveChartPainter({
    required this.data,
    required this.hoveredIndex,
  });

  @override
  void paint(Canvas canvas, Size size) {
    const margin = EdgeInsets.only(left: 50, right: 20, top: 20, bottom: 40);
    final chartWidth = size.width - margin.left - margin.right;
    final chartHeight = size.height - margin.top - margin.bottom;

    final yMax = data.map((p) => p.y).reduce(math.max);

    final xScale = scaleLinear(
      domain: [0, 19],
      range: [margin.left, margin.left + chartWidth],
    );

    final yScale = scaleLinear(
      domain: [0, yMax * 1.1],
      range: [margin.top + chartHeight, margin.top],
    );

    // Draw grid
    final gridPaint = Paint()
      ..color = Colors.grey.withOpacity(0.2)
      ..strokeWidth = 1;

    for (double y = 0; y <= yMax * 1.1; y += 20) {
      final py = yScale(y);
      canvas.drawLine(
        Offset(margin.left, py),
        Offset(margin.left + chartWidth, py),
        gridPaint,
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

    final areaPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.blue.withOpacity(0.3),
          Colors.blue.withOpacity(0.05),
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawPath(areaPath, areaPaint);

    // Draw line
    final linePath = Path();
    linePath.moveTo(xScale(data.first.x), yScale(data.first.y));
    for (int i = 1; i < data.length; i++) {
      linePath.lineTo(xScale(data[i].x), yScale(data[i].y));
    }

    final linePaint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    canvas.drawPath(linePath, linePaint);

    // Draw points
    for (int i = 0; i < data.length; i++) {
      final px = xScale(data[i].x);
      final py = yScale(data[i].y);
      final isHovered = i == hoveredIndex;

      if (isHovered) {
        // Draw highlight circle
        canvas.drawCircle(
          Offset(px, py),
          12,
          Paint()..color = Colors.blue.withOpacity(0.2),
        );
      }

      canvas.drawCircle(
        Offset(px, py),
        isHovered ? 6 : 4,
        Paint()..color = isHovered ? Colors.blue.shade700 : Colors.blue,
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

    // Draw axis labels
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

    for (int i = 0; i < data.length; i += 5) {
      textPainter.text = TextSpan(
        text: (i + 1).toString(),
        style: const TextStyle(color: Colors.black54, fontSize: 10),
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(xScale(i.toDouble()) - textPainter.width / 2, margin.top + chartHeight + 8),
      );
    }
  }

  @override
  bool shouldRepaint(InteractiveChartPainter oldDelegate) {
    return oldDelegate.hoveredIndex != hoveredIndex;
  }
}
