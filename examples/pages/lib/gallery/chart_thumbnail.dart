import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:data_visualization/data_visualization.dart';

import 'gallery_item.dart';

/// A thumbnail preview widget for a chart in the gallery grid
class ChartThumbnail extends StatelessWidget {
  final GalleryItem item;
  final bool isHovered;

  const ChartThumbnail({
    super.key,
    required this.item,
    this.isHovered = false,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return CustomPaint(
          size: Size(constraints.maxWidth, constraints.maxHeight),
          painter: _ThumbnailPainter(
            itemId: item.id,
            primaryColor: item.primaryColor,
            isDark: Theme.of(context).brightness == Brightness.dark,
          ),
        );
      },
    );
  }
}

class _ThumbnailPainter extends CustomPainter {
  final String itemId;
  final Color primaryColor;
  final bool isDark;

  _ThumbnailPainter({
    required this.itemId,
    required this.primaryColor,
    required this.isDark,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final bgColor = isDark ? Colors.grey.shade900 : Colors.grey.shade50;
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()..color = bgColor,
    );

    switch (itemId) {
      case 'line-chart':
        _drawLineThumbnail(canvas, size);
        break;
      case 'area-chart':
        _drawAreaThumbnail(canvas, size);
        break;
      case 'curves':
        _drawCurvesThumbnail(canvas, size);
        break;
      case 'bar-chart':
        _drawBarThumbnail(canvas, size);
        break;
      case 'pie-chart':
        _drawPieThumbnail(canvas, size);
        break;
      case 'treemap':
        _drawTreemapThumbnail(canvas, size);
        break;
      case 'scatter-chart':
        _drawScatterThumbnail(canvas, size);
        break;
      case 'heatmap':
        _drawHeatmapThumbnail(canvas, size);
        break;
      case 'voronoi':
        _drawVoronoiThumbnail(canvas, size);
        break;
      case 'geo-map':
        _drawGeoThumbnail(canvas, size);
        break;
      case 'scales':
        _drawScalesThumbnail(canvas, size);
        break;
      case 'interactive':
        _drawInteractiveThumbnail(canvas, size);
        break;
      default:
        _drawDefaultThumbnail(canvas, size);
    }
  }

  void _drawLineThumbnail(Canvas canvas, Size size) {
    final random = math.Random(42);
    final data1 = List.generate(8, (i) => Point(i.toDouble(), 20 + random.nextDouble() * 60));
    final data2 = List.generate(8, (i) => Point(i.toDouble(), 30 + random.nextDouble() * 50));

    final xScale = scaleLinear(domain: [0, 7], range: [20, size.width - 20]);
    final yScale = scaleLinear(domain: [0, 100], range: [size.height - 20, 20]);

    final curve = curveCatmullRom();

    void drawLine(List<Point> data, Color color) {
      final points = data.map((p) => Point(xScale(p.x), yScale(p.y))).toList();
      final curvePoints = curve.generate(points);
      if (curvePoints.isEmpty) return;

      final path = Path()..moveTo(curvePoints.first.x, curvePoints.first.y);
      for (int i = 1; i < curvePoints.length; i++) {
        path.lineTo(curvePoints[i].x, curvePoints[i].y);
      }
      canvas.drawPath(path, Paint()
        ..color = color
        ..strokeWidth = 2.5
        ..style = PaintingStyle.stroke);
    }

    drawLine(data1, primaryColor);
    drawLine(data2, Colors.teal);
  }

  void _drawAreaThumbnail(Canvas canvas, Size size) {
    final random = math.Random(42);
    final data = List.generate(10, (i) => 20 + random.nextDouble() * 40);

    final xScale = scaleLinear(domain: [0, 9], range: [10, size.width - 10]);
    final yScale = scaleLinear(domain: [0, 100], range: [size.height - 10, 10]);

    final path = Path()..moveTo(xScale(0), yScale(0));
    for (int i = 0; i < data.length; i++) {
      path.lineTo(xScale(i.toDouble()), yScale(data[i]));
    }
    path.lineTo(xScale(9), yScale(0));
    path.close();

    canvas.drawPath(path, Paint()..color = primaryColor.withAlpha(150));

    // Top line
    final linePath = Path()..moveTo(xScale(0), yScale(data[0]));
    for (int i = 1; i < data.length; i++) {
      linePath.lineTo(xScale(i.toDouble()), yScale(data[i]));
    }
    canvas.drawPath(linePath, Paint()
      ..color = primaryColor
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke);
  }

  void _drawCurvesThumbnail(Canvas canvas, Size size) {
    final points = [
      Point(20, size.height - 30),
      Point(size.width * 0.3, 30),
      Point(size.width * 0.5, size.height * 0.6),
      Point(size.width * 0.7, 40),
      Point(size.width - 20, size.height - 40),
    ];

    final curve = curveCatmullRom();
    final curvePoints = curve.generate(points);

    if (curvePoints.isNotEmpty) {
      final path = Path()..moveTo(curvePoints.first.x, curvePoints.first.y);
      for (int i = 1; i < curvePoints.length; i++) {
        path.lineTo(curvePoints[i].x, curvePoints[i].y);
      }
      canvas.drawPath(path, Paint()
        ..color = primaryColor
        ..strokeWidth = 3
        ..style = PaintingStyle.stroke);
    }

    for (final p in points) {
      canvas.drawCircle(Offset(p.x, p.y), 4, Paint()..color = primaryColor);
    }
  }

  void _drawBarThumbnail(Canvas canvas, Size size) {
    final values = [65, 45, 80, 55, 70];
    final barWidth = (size.width - 40) / values.length - 8;
    final maxVal = 100.0;

    for (int i = 0; i < values.length; i++) {
      final x = 20 + i * (barWidth + 8);
      final h = (values[i] / maxVal) * (size.height - 40);
      final y = size.height - 20 - h;

      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(x, y, barWidth, h),
          const Radius.circular(4),
        ),
        Paint()..color = primaryColor,
      );
    }
  }

  void _drawPieThumbnail(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width, size.height) / 2 - 15;
    final innerRadius = radius * 0.5;

    final values = [35, 25, 20, 12, 8];
    final colors = [primaryColor, Colors.teal, Colors.orange, Colors.purple, Colors.pink];
    final total = values.fold(0, (sum, v) => sum + v);

    double startAngle = -math.pi / 2;
    for (int i = 0; i < values.length; i++) {
      final sweepAngle = (values[i] / total) * 2 * math.pi;
      final path = Path()
        ..moveTo(
          center.dx + innerRadius * math.cos(startAngle),
          center.dy + innerRadius * math.sin(startAngle),
        )
        ..arcTo(
          Rect.fromCircle(center: center, radius: radius),
          startAngle,
          sweepAngle,
          false,
        )
        ..arcTo(
          Rect.fromCircle(center: center, radius: innerRadius),
          startAngle + sweepAngle,
          -sweepAngle,
          false,
        )
        ..close();
      canvas.drawPath(path, Paint()..color = colors[i]);
      startAngle += sweepAngle;
    }
  }

  void _drawTreemapThumbnail(Canvas canvas, Size size) {
    final rects = [
      (Rect.fromLTWH(5, 5, size.width * 0.5 - 7, size.height * 0.6 - 7), primaryColor),
      (Rect.fromLTWH(size.width * 0.5 + 2, 5, size.width * 0.5 - 7, size.height * 0.4 - 7), Colors.teal),
      (Rect.fromLTWH(5, size.height * 0.6 + 2, size.width * 0.35 - 7, size.height * 0.4 - 7), Colors.orange),
      (Rect.fromLTWH(size.width * 0.35 + 2, size.height * 0.6 + 2, size.width * 0.65 - 7, size.height * 0.4 - 7), Colors.purple.shade300),
      (Rect.fromLTWH(size.width * 0.5 + 2, size.height * 0.4 + 2, size.width * 0.5 - 7, size.height * 0.2 - 4), Colors.pink.shade200),
    ];

    for (final (rect, color) in rects) {
      canvas.drawRRect(
        RRect.fromRectAndRadius(rect, const Radius.circular(4)),
        Paint()..color = color,
      );
    }
  }

  void _drawScatterThumbnail(Canvas canvas, Size size) {
    final random = math.Random(42);
    final points = List.generate(20, (i) => (
      20 + random.nextDouble() * (size.width - 40),
      20 + random.nextDouble() * (size.height - 40),
      4 + random.nextDouble() * 8,
    ));

    for (final (x, y, r) in points) {
      canvas.drawCircle(
        Offset(x, y),
        r,
        Paint()..color = primaryColor.withAlpha(150),
      );
    }
  }

  void _drawHeatmapThumbnail(Canvas canvas, Size size) {
    final random = math.Random(42);
    const rows = 5;
    const cols = 8;
    final cellW = (size.width - 10) / cols;
    final cellH = (size.height - 10) / rows;

    final colors = [
      Colors.green.shade100,
      Colors.green.shade300,
      Colors.green.shade500,
      Colors.green.shade700,
      Colors.green.shade900,
    ];

    for (int r = 0; r < rows; r++) {
      for (int c = 0; c < cols; c++) {
        final val = random.nextDouble();
        final colorIdx = (val * (colors.length - 1)).floor();
        canvas.drawRRect(
          RRect.fromRectAndRadius(
            Rect.fromLTWH(5 + c * cellW + 1, 5 + r * cellH + 1, cellW - 2, cellH - 2),
            const Radius.circular(2),
          ),
          Paint()..color = colors[colorIdx],
        );
      }
    }
  }

  void _drawVoronoiThumbnail(Canvas canvas, Size size) {
    final random = math.Random(42);
    final points = List.generate(12, (i) => Point(
      10 + random.nextDouble() * (size.width - 20),
      10 + random.nextDouble() * (size.height - 20),
    ));

    final colors = [
      Colors.red.withAlpha(60),
      Colors.blue.withAlpha(60),
      Colors.green.withAlpha(60),
      Colors.orange.withAlpha(60),
      Colors.purple.withAlpha(60),
      Colors.teal.withAlpha(60),
    ];

    // Simple voronoi approximation - draw colored regions around points
    for (int i = 0; i < points.length; i++) {
      canvas.drawCircle(
        Offset(points[i].x, points[i].y),
        30,
        Paint()..color = colors[i % colors.length],
      );
    }

    for (final p in points) {
      canvas.drawCircle(Offset(p.x, p.y), 3, Paint()..color = primaryColor);
    }
  }

  void _drawGeoThumbnail(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width, size.height) / 2 - 10;

    // Globe
    canvas.drawCircle(center, radius, Paint()..color = Colors.lightBlue.shade200);

    // Simple continent shapes
    final landPaint = Paint()..color = Colors.green.shade400;

    // North America approximation
    final na = Path()
      ..moveTo(center.dx - radius * 0.7, center.dy - radius * 0.2)
      ..lineTo(center.dx - radius * 0.3, center.dy - radius * 0.6)
      ..lineTo(center.dx - radius * 0.1, center.dy - radius * 0.3)
      ..lineTo(center.dx - radius * 0.4, center.dy + radius * 0.1)
      ..close();
    canvas.drawPath(na, landPaint);

    // Europe/Africa approximation
    final eu = Path()
      ..moveTo(center.dx + radius * 0.1, center.dy - radius * 0.4)
      ..lineTo(center.dx + radius * 0.4, center.dy - radius * 0.3)
      ..lineTo(center.dx + radius * 0.3, center.dy + radius * 0.5)
      ..lineTo(center.dx, center.dy + radius * 0.2)
      ..close();
    canvas.drawPath(eu, landPaint);
  }

  void _drawScalesThumbnail(Canvas canvas, Size size) {
    // Axis lines
    final axisPaint = Paint()
      ..color = isDark ? Colors.grey.shade600 : Colors.grey.shade400
      ..strokeWidth = 1;

    canvas.drawLine(
      Offset(30, size.height - 25),
      Offset(size.width - 15, size.height - 25),
      axisPaint,
    );
    canvas.drawLine(
      Offset(30, 15),
      Offset(30, size.height - 25),
      axisPaint,
    );

    // Curve
    final path = Path()..moveTo(30, size.height - 25);
    for (double x = 0; x <= 1; x += 0.02) {
      final px = 30 + x * (size.width - 45);
      final py = size.height - 25 - math.pow(x, 2) * (size.height - 40);
      path.lineTo(px, py);
    }
    canvas.drawPath(path, Paint()
      ..color = primaryColor
      ..strokeWidth = 2.5
      ..style = PaintingStyle.stroke);

    // Tick marks
    for (int i = 0; i <= 4; i++) {
      final x = 30 + i * (size.width - 45) / 4;
      canvas.drawLine(
        Offset(x, size.height - 25),
        Offset(x, size.height - 20),
        axisPaint,
      );
    }
  }

  void _drawInteractiveThumbnail(Canvas canvas, Size size) {
    final random = math.Random(42);
    final data = List.generate(8, (i) => 20 + random.nextDouble() * 60);

    final xScale = scaleLinear(domain: [0, 7], range: [25, size.width - 15]);
    final yScale = scaleLinear(domain: [0, 100], range: [size.height - 20, 15]);

    // Area
    final areaPath = Path()..moveTo(xScale(0), yScale(0));
    for (int i = 0; i < data.length; i++) {
      areaPath.lineTo(xScale(i.toDouble()), yScale(data[i]));
    }
    areaPath.lineTo(xScale(7), yScale(0));
    areaPath.close();
    canvas.drawPath(areaPath, Paint()..color = primaryColor.withAlpha(50));

    // Line
    final linePath = Path()..moveTo(xScale(0), yScale(data[0]));
    for (int i = 1; i < data.length; i++) {
      linePath.lineTo(xScale(i.toDouble()), yScale(data[i]));
    }
    canvas.drawPath(linePath, Paint()
      ..color = primaryColor
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke);

    // Highlight point
    final highlightIdx = 4;
    final px = xScale(highlightIdx.toDouble());
    final py = yScale(data[highlightIdx]);
    canvas.drawCircle(Offset(px, py), 10, Paint()..color = primaryColor.withAlpha(50));
    canvas.drawCircle(Offset(px, py), 5, Paint()..color = primaryColor);
    canvas.drawCircle(Offset(px, py), 2, Paint()..color = Colors.white);

    // Tooltip indicator
    final tooltipRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(px + 8, py - 25, 40, 20),
      const Radius.circular(4),
    );
    canvas.drawRRect(tooltipRect, Paint()..color = Colors.black87);
  }

  void _drawDefaultThumbnail(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(center, 30, Paint()..color = primaryColor.withAlpha(100));
    canvas.drawCircle(center, 15, Paint()..color = primaryColor);
  }

  @override
  bool shouldRepaint(covariant _ThumbnailPainter oldDelegate) {
    return oldDelegate.itemId != itemId || oldDelegate.isDark != isDark;
  }
}
