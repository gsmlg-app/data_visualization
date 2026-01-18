import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:data_visualization/data_visualization.dart';

class ZoomExample extends StatefulWidget {
  const ZoomExample({super.key});

  @override
  State<ZoomExample> createState() => _ZoomExampleState();
}

class _ZoomExampleState extends State<ZoomExample> {
  double _scale = 1.0;
  Offset _offset = Offset.zero;
  Offset? _lastFocalPoint;

  late final List<Point> _data;

  @override
  void initState() {
    super.initState();
    final random = math.Random(42);
    _data = List.generate(200, (i) {
      return Point(
        random.nextDouble() * 100,
        random.nextDouble() * 100,
      );
    });
  }

  void _handleScaleStart(ScaleStartDetails details) {
    _lastFocalPoint = details.localFocalPoint;
  }

  void _handleScaleUpdate(ScaleUpdateDetails details) {
    setState(() {
      // Handle zoom
      final newScale = (_scale * details.scale).clamp(0.5, 5.0);
      final scaleChange = newScale / _scale;
      _scale = newScale;

      // Handle pan
      if (_lastFocalPoint != null) {
        final delta = details.localFocalPoint - _lastFocalPoint!;
        _offset += delta;
        _lastFocalPoint = details.localFocalPoint;
      }

      // Adjust offset for scale change (zoom towards focal point)
      final focalPoint = details.localFocalPoint;
      _offset = focalPoint - (focalPoint - _offset) * scaleChange;
    });
  }

  void _resetZoom() {
    setState(() {
      _scale = 1.0;
      _offset = Offset.zero;
    });
  }

  void _zoomIn() {
    setState(() {
      _scale = (_scale * 1.2).clamp(0.5, 5.0);
    });
  }

  void _zoomOut() {
    setState(() {
      _scale = (_scale / 1.2).clamp(0.5, 5.0);
    });
  }

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
                'Zoom & Pan',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const Spacer(),
              IconButton(
                onPressed: _zoomOut,
                icon: const Icon(Icons.zoom_out),
                tooltip: 'Zoom out',
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  '${(_scale * 100).toInt()}%',
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              IconButton(
                onPressed: _zoomIn,
                icon: const Icon(Icons.zoom_in),
                tooltip: 'Zoom in',
              ),
              IconButton(
                onPressed: _resetZoom,
                icon: const Icon(Icons.fit_screen),
                tooltip: 'Reset view',
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Pinch to zoom, drag to pan',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.grey.shade600,
                ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return GestureDetector(
                      onScaleStart: _handleScaleStart,
                      onScaleUpdate: _handleScaleUpdate,
                      child: CustomPaint(
                        size: Size(constraints.maxWidth, constraints.maxHeight),
                        painter: ZoomChartPainter(
                          data: _data,
                          scale: _scale,
                          offset: _offset,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Icon(Icons.mouse, color: Colors.grey.shade600, size: 18),
                const SizedBox(width: 8),
                Text(
                  'Mouse: scroll to zoom, drag to pan',
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                ),
                const SizedBox(width: 16),
                Icon(Icons.touch_app, color: Colors.grey.shade600, size: 18),
                const SizedBox(width: 8),
                Text(
                  'Touch: pinch to zoom, drag to pan',
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ZoomChartPainter extends CustomPainter {
  final List<Point> data;
  final double scale;
  final Offset offset;

  ZoomChartPainter({
    required this.data,
    required this.scale,
    required this.offset,
  });

  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    canvas.translate(offset.dx, offset.dy);
    canvas.scale(scale);

    const margin = EdgeInsets.only(left: 50, right: 20, top: 20, bottom: 40);
    final chartWidth = size.width - margin.left - margin.right;
    final chartHeight = size.height - margin.top - margin.bottom;

    final xScale = scaleLinear(
      domain: [0, 100],
      range: [margin.left, margin.left + chartWidth],
    );

    final yScale = scaleLinear(
      domain: [0, 100],
      range: [margin.top + chartHeight, margin.top],
    );

    // Draw grid
    final gridPaint = Paint()
      ..color = Colors.grey.withAlpha(50)
      ..strokeWidth = 1 / scale;

    for (double v = 0; v <= 100; v += 10) {
      canvas.drawLine(
        Offset(margin.left, yScale(v)),
        Offset(margin.left + chartWidth, yScale(v)),
        gridPaint,
      );
      canvas.drawLine(
        Offset(xScale(v), margin.top),
        Offset(xScale(v), margin.top + chartHeight),
        gridPaint,
      );
    }

    // Draw axes
    final axisPaint = Paint()
      ..color = Colors.black54
      ..strokeWidth = 1 / scale;

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

    // Draw points
    final colors = [
      Colors.indigo,
      Colors.teal,
      Colors.orange,
      Colors.purple,
      Colors.pink,
    ];

    for (int i = 0; i < data.length; i++) {
      final point = data[i];
      final px = xScale(point.x);
      final py = yScale(point.y);
      final color = colors[i % colors.length];

      canvas.drawCircle(
        Offset(px, py),
        5 / scale,
        Paint()..color = color.withAlpha(180),
      );
    }

    // Draw axis labels
    final textPainter = TextPainter(textDirection: TextDirection.ltr);
    final labelInterval = scale > 2 ? 5 : (scale > 1 ? 10 : 20);

    for (double v = 0; v <= 100; v += labelInterval) {
      textPainter.text = TextSpan(
        text: v.toInt().toString(),
        style: TextStyle(color: Colors.black54, fontSize: 11 / scale),
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(margin.left - textPainter.width - 8 / scale, yScale(v) - textPainter.height / 2),
      );
      textPainter.paint(
        canvas,
        Offset(xScale(v) - textPainter.width / 2, margin.top + chartHeight + 8 / scale),
      );
    }

    canvas.restore();

    // Draw minimap
    _drawMinimap(canvas, size);
  }

  void _drawMinimap(Canvas canvas, Size size) {
    const minimapSize = 80.0;
    const minimapMargin = 10.0;
    final minimapRect = Rect.fromLTWH(
      size.width - minimapSize - minimapMargin,
      minimapMargin,
      minimapSize,
      minimapSize,
    );

    // Minimap background
    canvas.drawRRect(
      RRect.fromRectAndRadius(minimapRect, const Radius.circular(4)),
      Paint()..color = Colors.white.withAlpha(220),
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(minimapRect, const Radius.circular(4)),
      Paint()
        ..color = Colors.grey.shade400
        ..strokeWidth = 1
        ..style = PaintingStyle.stroke,
    );

    // Minimap points
    for (final point in data) {
      final px = minimapRect.left + (point.x / 100) * minimapSize;
      final py = minimapRect.top + (1 - point.y / 100) * minimapSize;
      canvas.drawCircle(
        Offset(px, py),
        1,
        Paint()..color = Colors.indigo.withAlpha(100),
      );
    }

    // Viewport rectangle
    final viewportWidth = minimapSize / scale;
    final viewportHeight = minimapSize / scale;
    final viewportX = minimapRect.left + minimapSize / 2 - offset.dx / scale / size.width * minimapSize - viewportWidth / 2;
    final viewportY = minimapRect.top + minimapSize / 2 - offset.dy / scale / size.height * minimapSize - viewportHeight / 2;

    canvas.drawRect(
      Rect.fromLTWH(viewportX, viewportY, viewportWidth, viewportHeight),
      Paint()
        ..color = Colors.indigo.withAlpha(50),
    );
    canvas.drawRect(
      Rect.fromLTWH(viewportX, viewportY, viewportWidth, viewportHeight),
      Paint()
        ..color = Colors.indigo
        ..strokeWidth = 1
        ..style = PaintingStyle.stroke,
    );
  }

  @override
  bool shouldRepaint(covariant ZoomChartPainter oldDelegate) =>
      oldDelegate.scale != scale || oldDelegate.offset != offset;
}
