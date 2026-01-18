import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:data_visualization/data_visualization.dart';

class BrushExample extends StatefulWidget {
  const BrushExample({super.key});

  @override
  State<BrushExample> createState() => _BrushExampleState();
}

class _BrushExampleState extends State<BrushExample> {
  Rect? _brushRect;
  bool _isDragging = false;
  Offset? _dragStart;

  late final List<Point> _data;

  @override
  void initState() {
    super.initState();
    final random = math.Random(42);
    _data = List.generate(100, (i) {
      return Point(
        random.nextDouble() * 100,
        random.nextDouble() * 100,
      );
    });
  }

  void _handlePanStart(DragStartDetails details, BoxConstraints constraints) {
    setState(() {
      _isDragging = true;
      _dragStart = details.localPosition;
      _brushRect = Rect.fromPoints(_dragStart!, _dragStart!);
    });
  }

  void _handlePanUpdate(DragUpdateDetails details, BoxConstraints constraints) {
    if (!_isDragging || _dragStart == null) return;

    setState(() {
      _brushRect = Rect.fromPoints(
        _dragStart!,
        details.localPosition,
      ).intersect(Rect.fromLTWH(0, 0, constraints.maxWidth, constraints.maxHeight));
    });
  }

  void _handlePanEnd(DragEndDetails details) {
    setState(() {
      _isDragging = false;
    });
  }

  void _clearBrush() {
    setState(() {
      _brushRect = null;
      _dragStart = null;
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
                'Brush Selection',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const Spacer(),
              if (_brushRect != null)
                TextButton.icon(
                  onPressed: _clearBrush,
                  icon: const Icon(Icons.clear, size: 18),
                  label: const Text('Clear'),
                ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Click and drag to select points',
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
                      onPanStart: (d) => _handlePanStart(d, constraints),
                      onPanUpdate: (d) => _handlePanUpdate(d, constraints),
                      onPanEnd: _handlePanEnd,
                      child: CustomPaint(
                        size: Size(constraints.maxWidth, constraints.maxHeight),
                        painter: BrushChartPainter(
                          data: _data,
                          brushRect: _brushRect,
                          size: Size(constraints.maxWidth, constraints.maxHeight),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          _buildSelectionInfo(),
        ],
      ),
    );
  }

  Widget _buildSelectionInfo() {
    if (_brushRect == null) {
      return Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(Icons.info_outline, color: Colors.grey.shade600, size: 18),
            const SizedBox(width: 8),
            Text(
              'Drag to select an area',
              style: TextStyle(color: Colors.grey.shade600),
            ),
          ],
        ),
      );
    }

    // Calculate selected points
    const margin = EdgeInsets.only(left: 50, right: 20, top: 20, bottom: 40);
    final chartWidth = _brushRect!.right - margin.left;
    final chartHeight = _brushRect!.bottom - margin.top;

    final xScale = scaleLinear(domain: [0, 100], range: [margin.left, margin.left + chartWidth]);
    final yScale = scaleLinear(domain: [0, 100], range: [margin.top + chartHeight, margin.top]);

    int selectedCount = 0;
    for (final point in _data) {
      final px = xScale(point.x);
      final py = yScale(point.y);
      if (_brushRect!.contains(Offset(px, py))) {
        selectedCount++;
      }
    }

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.indigo.shade50,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(Icons.check_circle, color: Colors.indigo.shade700, size: 18),
          const SizedBox(width: 8),
          Text(
            '$selectedCount points selected',
            style: TextStyle(
              color: Colors.indigo.shade700,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          Text(
            'Area: ${_brushRect!.width.toInt()} × ${_brushRect!.height.toInt()}',
            style: TextStyle(
              color: Colors.indigo.shade400,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

class BrushChartPainter extends CustomPainter {
  final List<Point> data;
  final Rect? brushRect;
  final Size size;

  BrushChartPainter({
    required this.data,
    required this.brushRect,
    required this.size,
  });

  @override
  void paint(Canvas canvas, Size size) {
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
    final gridPaint = Paint()..color = Colors.grey.withAlpha(50);
    for (double v = 0; v <= 100; v += 20) {
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

    // Draw points
    for (final point in data) {
      final px = xScale(point.x);
      final py = yScale(point.y);

      final isSelected = brushRect != null && brushRect!.contains(Offset(px, py));

      canvas.drawCircle(
        Offset(px, py),
        isSelected ? 8 : 5,
        Paint()..color = isSelected ? Colors.indigo : Colors.grey.withAlpha(150),
      );

      if (isSelected) {
        canvas.drawCircle(
          Offset(px, py),
          8,
          Paint()
            ..color = Colors.indigo
            ..strokeWidth = 2
            ..style = PaintingStyle.stroke,
        );
      }
    }

    // Draw brush rectangle
    if (brushRect != null) {
      canvas.drawRect(
        brushRect!,
        Paint()..color = Colors.indigo.withAlpha(30),
      );
      canvas.drawRect(
        brushRect!,
        Paint()
          ..color = Colors.indigo
          ..strokeWidth = 2
          ..style = PaintingStyle.stroke,
      );
    }

    // Draw labels
    final textPainter = TextPainter(textDirection: TextDirection.ltr);
    for (double v = 0; v <= 100; v += 20) {
      textPainter.text = TextSpan(
        text: v.toInt().toString(),
        style: const TextStyle(color: Colors.black54, fontSize: 11),
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(margin.left - textPainter.width - 8, yScale(v) - textPainter.height / 2),
      );
      textPainter.paint(
        canvas,
        Offset(xScale(v) - textPainter.width / 2, margin.top + chartHeight + 8),
      );
    }
  }

  @override
  bool shouldRepaint(covariant BrushChartPainter oldDelegate) =>
      oldDelegate.brushRect != brushRect;
}
