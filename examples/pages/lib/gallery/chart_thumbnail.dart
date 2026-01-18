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
      case 'bar-horizontal':
        _drawHorizontalBarThumbnail(canvas, size);
        break;
      case 'bar-stacked':
        _drawStackedBarThumbnail(canvas, size);
        break;
      case 'streamgraph':
        _drawStreamgraphThumbnail(canvas, size);
        break;
      case 'threshold':
        _drawThresholdThumbnail(canvas, size);
        break;
      case 'radar-chart':
        _drawRadarThumbnail(canvas, size);
        break;
      case 'radial-bar':
        _drawRadialBarThumbnail(canvas, size);
        break;
      case 'tree':
        _drawTreeThumbnail(canvas, size);
        break;
      case 'pack':
        _drawPackThumbnail(canvas, size);
        break;
      case 'box-plot':
        _drawBoxPlotThumbnail(canvas, size);
        break;
      case 'network-graph':
        _drawNetworkThumbnail(canvas, size);
        break;
      case 'chord-diagram':
        _drawChordThumbnail(canvas, size);
        break;
      case 'sankey':
        _drawSankeyThumbnail(canvas, size);
        break;
      case 'brush':
        _drawBrushThumbnail(canvas, size);
        break;
      case 'zoom':
        _drawZoomThumbnail(canvas, size);
        break;
      case 'annotations':
        _drawAnnotationsThumbnail(canvas, size);
        break;
      case 'legends':
        _drawLegendsThumbnail(canvas, size);
        break;
      case 'gradients':
        _drawGradientsThumbnail(canvas, size);
        break;
      case 'wordcloud':
        _drawWordcloudThumbnail(canvas, size);
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

  void _drawHorizontalBarThumbnail(Canvas canvas, Size size) {
    final values = [80, 65, 90, 50, 75];
    final barHeight = (size.height - 30) / values.length - 6;
    final maxVal = 100.0;

    for (int i = 0; i < values.length; i++) {
      final y = 15 + i * (barHeight + 6);
      final w = (values[i] / maxVal) * (size.width - 40);
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(20, y, w, barHeight),
          const Radius.circular(3),
        ),
        Paint()..color = primaryColor,
      );
    }
  }

  void _drawStackedBarThumbnail(Canvas canvas, Size size) {
    final data = [
      [30, 25, 20],
      [35, 20, 25],
      [25, 30, 20],
      [40, 15, 25],
    ];
    final colors = [primaryColor, Colors.teal, Colors.orange];
    final barWidth = (size.width - 30) / data.length - 8;
    final maxTotal = 80.0;

    for (int i = 0; i < data.length; i++) {
      final x = 15 + i * (barWidth + 8);
      double currentY = size.height - 15;

      for (int j = 0; j < data[i].length; j++) {
        final h = (data[i][j] / maxTotal) * (size.height - 30);
        currentY -= h;
        canvas.drawRRect(
          RRect.fromRectAndRadius(
            Rect.fromLTWH(x, currentY, barWidth, h),
            const Radius.circular(2),
          ),
          Paint()..color = colors[j],
        );
      }
    }
  }

  void _drawStreamgraphThumbnail(Canvas canvas, Size size) {
    final colors = [
      Colors.purple.shade300,
      Colors.blue.shade300,
      Colors.teal.shade300,
      Colors.green.shade300,
    ];

    for (int layer = 0; layer < colors.length; layer++) {
      final path = Path();
      final baseY = size.height / 2 + (layer - 1.5) * 15;
      final amplitude = 20 - layer * 3;

      path.moveTo(0, baseY);
      for (double x = 0; x <= size.width; x += 5) {
        final y = baseY + amplitude * math.sin(x * 0.03 + layer);
        path.lineTo(x, y);
      }
      for (double x = size.width; x >= 0; x -= 5) {
        final y = baseY + 20 - amplitude * math.sin(x * 0.03 + layer + 1);
        path.lineTo(x, y);
      }
      path.close();
      canvas.drawPath(path, Paint()..color = colors[layer]);
    }
  }

  void _drawThresholdThumbnail(Canvas canvas, Size size) {
    final random = math.Random(42);
    final xScale = scaleLinear(domain: [0, 10], range: [15, size.width - 15]);
    final yScale = scaleLinear(domain: [0, 100], range: [size.height - 15, 15]);

    // Expected line
    final expectedPath = Path()..moveTo(xScale(0), yScale(50));
    for (int i = 1; i <= 10; i++) {
      expectedPath.lineTo(xScale(i.toDouble()), yScale(50 + 10 * math.sin(i * 0.5)));
    }
    canvas.drawPath(
      expectedPath,
      Paint()
        ..color = Colors.grey
        ..strokeWidth = 1.5
        ..style = PaintingStyle.stroke,
    );

    // Actual with areas
    for (int i = 0; i < 10; i++) {
      final y1 = 50 + 10 * math.sin(i * 0.5);
      final y2 = 50 + 10 * math.sin((i + 1) * 0.5);
      final a1 = y1 + (random.nextDouble() - 0.5) * 30;
      final a2 = y2 + (random.nextDouble() - 0.5) * 30;

      final areaPath = Path()
        ..moveTo(xScale(i.toDouble()), yScale(y1))
        ..lineTo(xScale(i + 1.0), yScale(y2))
        ..lineTo(xScale(i + 1.0), yScale(a2))
        ..lineTo(xScale(i.toDouble()), yScale(a1))
        ..close();

      final isAbove = (a1 + a2) / 2 > (y1 + y2) / 2;
      canvas.drawPath(
        areaPath,
        Paint()..color = (isAbove ? Colors.green : Colors.red).withAlpha(100),
      );
    }
  }

  void _drawRadarThumbnail(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width, size.height) / 2 - 15;
    const sides = 6;
    final values = [0.8, 0.6, 0.9, 0.5, 0.7, 0.85];

    // Grid
    for (int ring = 1; ring <= 3; ring++) {
      final r = radius * ring / 3;
      final gridPath = Path();
      for (int i = 0; i <= sides; i++) {
        final angle = -math.pi / 2 + (i * 2 * math.pi / sides);
        final p = Offset(center.dx + r * math.cos(angle), center.dy + r * math.sin(angle));
        if (i == 0) {
          gridPath.moveTo(p.dx, p.dy);
        } else {
          gridPath.lineTo(p.dx, p.dy);
        }
      }
      canvas.drawPath(
        gridPath,
        Paint()
          ..color = Colors.grey.withAlpha(80)
          ..style = PaintingStyle.stroke,
      );
    }

    // Data
    final dataPath = Path();
    for (int i = 0; i <= sides; i++) {
      final idx = i % sides;
      final angle = -math.pi / 2 + (i * 2 * math.pi / sides);
      final r = radius * values[idx];
      final p = Offset(center.dx + r * math.cos(angle), center.dy + r * math.sin(angle));
      if (i == 0) {
        dataPath.moveTo(p.dx, p.dy);
      } else {
        dataPath.lineTo(p.dx, p.dy);
      }
    }
    canvas.drawPath(dataPath, Paint()..color = primaryColor.withAlpha(100));
    canvas.drawPath(
      dataPath,
      Paint()
        ..color = primaryColor
        ..strokeWidth = 2
        ..style = PaintingStyle.stroke,
    );
  }

  void _drawRadialBarThumbnail(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final maxRadius = math.min(size.width, size.height) / 2 - 10;
    final values = [0.7, 0.85, 0.55, 0.9, 0.6];
    final colors = [Colors.red, Colors.orange, Colors.yellow, Colors.green, Colors.blue];

    for (int i = 0; i < values.length; i++) {
      final radius = maxRadius - i * 10;
      final sweep = values[i] * 2 * math.pi * 0.8;
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        -math.pi / 2,
        sweep,
        false,
        Paint()
          ..color = colors[i]
          ..strokeWidth = 6
          ..strokeCap = StrokeCap.round
          ..style = PaintingStyle.stroke,
      );
    }
  }

  void _drawTreeThumbnail(Canvas canvas, Size size) {
    final linePaint = Paint()
      ..color = primaryColor.withAlpha(150)
      ..strokeWidth = 1.5;

    // Root
    final root = Offset(size.width / 2, 15);
    canvas.drawCircle(root, 5, Paint()..color = primaryColor);

    // Level 1
    final l1 = [Offset(size.width * 0.3, 45), Offset(size.width * 0.7, 45)];
    for (final p in l1) {
      canvas.drawLine(root, p, linePaint);
      canvas.drawCircle(p, 4, Paint()..color = primaryColor);
    }

    // Level 2
    final l2 = [
      [Offset(size.width * 0.15, 75), Offset(size.width * 0.35, 75)],
      [Offset(size.width * 0.55, 75), Offset(size.width * 0.75, 75), Offset(size.width * 0.9, 75)],
    ];
    for (int i = 0; i < l1.length; i++) {
      for (final p in l2[i]) {
        canvas.drawLine(l1[i], p, linePaint);
        canvas.drawCircle(p, 3, Paint()..color = primaryColor.withAlpha(180));
      }
    }
  }

  void _drawPackThumbnail(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final mainRadius = math.min(size.width, size.height) / 2 - 10;

    // Outer circle
    canvas.drawCircle(center, mainRadius, Paint()..color = primaryColor.withAlpha(30));

    // Inner circles
    final circles = [
      (Offset(center.dx - 20, center.dy - 10), 25.0, primaryColor.withAlpha(60)),
      (Offset(center.dx + 15, center.dy + 5), 20.0, Colors.teal.withAlpha(60)),
      (Offset(center.dx - 5, center.dy + 20), 15.0, Colors.orange.withAlpha(60)),
      (Offset(center.dx - 25, center.dy - 5), 10.0, primaryColor.withAlpha(100)),
      (Offset(center.dx - 10, center.dy - 20), 8.0, primaryColor.withAlpha(100)),
      (Offset(center.dx + 20, center.dy - 10), 12.0, Colors.teal.withAlpha(100)),
    ];

    for (final (pos, r, color) in circles) {
      canvas.drawCircle(pos, r, Paint()..color = color);
    }
  }

  void _drawBoxPlotThumbnail(Canvas canvas, Size size) {
    final boxWidth = 25.0;
    final positions = [size.width * 0.25, size.width * 0.5, size.width * 0.75];
    final data = [
      (20.0, 35.0, 50.0, 65.0, 80.0),
      (30.0, 45.0, 55.0, 70.0, 85.0),
      (15.0, 30.0, 45.0, 60.0, 75.0),
    ];
    final yScale = scaleLinear(domain: [0, 100], range: [size.height - 15, 15]);

    for (int i = 0; i < positions.length; i++) {
      final (min, q1, median, q3, max) = data[i];
      final x = positions[i];

      // Whiskers
      canvas.drawLine(
        Offset(x, yScale(min)),
        Offset(x, yScale(max)),
        Paint()..color = primaryColor,
      );
      canvas.drawLine(Offset(x - 8, yScale(min)), Offset(x + 8, yScale(min)), Paint()..color = primaryColor);
      canvas.drawLine(Offset(x - 8, yScale(max)), Offset(x + 8, yScale(max)), Paint()..color = primaryColor);

      // Box
      canvas.drawRect(
        Rect.fromLTRB(x - boxWidth / 2, yScale(q3), x + boxWidth / 2, yScale(q1)),
        Paint()..color = primaryColor.withAlpha(150),
      );

      // Median
      canvas.drawLine(
        Offset(x - boxWidth / 2, yScale(median)),
        Offset(x + boxWidth / 2, yScale(median)),
        Paint()
          ..color = Colors.white
          ..strokeWidth = 2,
      );
    }
  }

  void _drawNetworkThumbnail(Canvas canvas, Size size) {
    final random = math.Random(42);
    final nodes = List.generate(8, (i) => Offset(
      20 + random.nextDouble() * (size.width - 40),
      20 + random.nextDouble() * (size.height - 40),
    ));

    // Edges
    final edges = [(0, 1), (0, 2), (1, 3), (2, 3), (2, 4), (3, 5), (4, 6), (5, 7), (6, 7)];
    for (final (from, to) in edges) {
      canvas.drawLine(
        nodes[from],
        nodes[to],
        Paint()
          ..color = primaryColor.withAlpha(100)
          ..strokeWidth = 1.5,
      );
    }

    // Nodes
    for (int i = 0; i < nodes.length; i++) {
      canvas.drawCircle(nodes[i], 6, Paint()..color = primaryColor);
      canvas.drawCircle(nodes[i], 3, Paint()..color = Colors.white);
    }
  }

  void _drawChordThumbnail(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width, size.height) / 2 - 12;
    final colors = [Colors.red, Colors.blue, Colors.green, Colors.orange, Colors.purple];

    // Arcs
    const segments = 5;
    for (int i = 0; i < segments; i++) {
      final startAngle = i * 2 * math.pi / segments - math.pi / 2;
      final sweepAngle = 2 * math.pi / segments * 0.8;
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sweepAngle,
        false,
        Paint()
          ..color = colors[i]
          ..strokeWidth = 8
          ..style = PaintingStyle.stroke,
      );
    }

    // Chords
    final chords = [(0, 2), (1, 3), (2, 4), (0, 3)];
    for (final (from, to) in chords) {
      final fromAngle = from * 2 * math.pi / segments - math.pi / 2 + math.pi / segments * 0.4;
      final toAngle = to * 2 * math.pi / segments - math.pi / 2 + math.pi / segments * 0.4;
      final fromPoint = Offset(
        center.dx + radius * 0.8 * math.cos(fromAngle),
        center.dy + radius * 0.8 * math.sin(fromAngle),
      );
      final toPoint = Offset(
        center.dx + radius * 0.8 * math.cos(toAngle),
        center.dy + radius * 0.8 * math.sin(toAngle),
      );

      final path = Path()
        ..moveTo(fromPoint.dx, fromPoint.dy)
        ..quadraticBezierTo(center.dx, center.dy, toPoint.dx, toPoint.dy);
      canvas.drawPath(
        path,
        Paint()
          ..color = colors[from].withAlpha(80)
          ..strokeWidth = 3
          ..style = PaintingStyle.stroke,
      );
    }
  }

  void _drawSankeyThumbnail(Canvas canvas, Size size) {
    final leftX = 15.0;
    final midX = size.width / 2;
    final rightX = size.width - 15;

    // Source nodes
    final sources = [
      (leftX, 10.0, 30.0, Colors.blue),
      (leftX, 45.0, 25.0, Colors.green),
      (leftX, 75.0, 20.0, Colors.orange),
    ];

    // Target nodes
    final targets = [
      (rightX - 15, 15.0, 35.0, Colors.purple),
      (rightX - 15, 55.0, 40.0, Colors.teal),
    ];

    // Draw source nodes
    for (final (x, y, h, color) in sources) {
      canvas.drawRRect(
        RRect.fromRectAndRadius(Rect.fromLTWH(x, y, 12, h), const Radius.circular(2)),
        Paint()..color = color,
      );
    }

    // Draw target nodes
    for (final (x, y, h, color) in targets) {
      canvas.drawRRect(
        RRect.fromRectAndRadius(Rect.fromLTWH(x, y, 12, h), const Radius.circular(2)),
        Paint()..color = color,
      );
    }

    // Flows
    final flows = [
      (sources[0], targets[0], 0.6),
      (sources[0], targets[1], 0.4),
      (sources[1], targets[0], 0.3),
      (sources[1], targets[1], 0.7),
      (sources[2], targets[1], 1.0),
    ];

    for (final (source, target, _) in flows) {
      final (sx, sy, sh, scolor) = source;
      final (tx, ty, th, _) = target;
      final path = Path()
        ..moveTo(sx + 12, sy + sh / 2)
        ..cubicTo(midX, sy + sh / 2, midX, ty + th / 2, tx, ty + th / 2);
      canvas.drawPath(
        path,
        Paint()
          ..color = scolor.withAlpha(60)
          ..strokeWidth = 8
          ..style = PaintingStyle.stroke,
      );
    }
  }

  void _drawBrushThumbnail(Canvas canvas, Size size) {
    final random = math.Random(42);
    final points = List.generate(25, (i) => Offset(
      15 + random.nextDouble() * (size.width - 30),
      15 + random.nextDouble() * (size.height - 30),
    ));

    // Points
    for (final p in points) {
      canvas.drawCircle(p, 4, Paint()..color = primaryColor.withAlpha(150));
    }

    // Brush selection rectangle
    final brushRect = Rect.fromLTWH(size.width * 0.3, size.height * 0.25, size.width * 0.4, size.height * 0.5);
    canvas.drawRect(brushRect, Paint()..color = Colors.blue.withAlpha(30));
    canvas.drawRect(
      brushRect,
      Paint()
        ..color = Colors.blue
        ..strokeWidth = 2
        ..style = PaintingStyle.stroke,
    );

    // Highlight selected points
    for (final p in points) {
      if (brushRect.contains(p)) {
        canvas.drawCircle(p, 5, Paint()..color = Colors.blue);
      }
    }
  }

  void _drawZoomThumbnail(Canvas canvas, Size size) {
    final random = math.Random(42);

    // Scatter points
    for (int i = 0; i < 30; i++) {
      canvas.drawCircle(
        Offset(15 + random.nextDouble() * (size.width - 30), 15 + random.nextDouble() * (size.height - 30)),
        3,
        Paint()..color = primaryColor.withAlpha(150),
      );
    }

    // Zoom lens indicator
    final lensCenter = Offset(size.width * 0.6, size.height * 0.4);
    canvas.drawCircle(lensCenter, 25, Paint()..color = Colors.white.withAlpha(150));
    canvas.drawCircle(
      lensCenter,
      25,
      Paint()
        ..color = primaryColor
        ..strokeWidth = 2
        ..style = PaintingStyle.stroke,
    );

    // Magnifier handle
    canvas.drawLine(
      Offset(lensCenter.dx + 18, lensCenter.dy + 18),
      Offset(lensCenter.dx + 30, lensCenter.dy + 30),
      Paint()
        ..color = primaryColor
        ..strokeWidth = 4
        ..strokeCap = StrokeCap.round,
    );

    // Mini zoomed dots inside lens
    for (int i = 0; i < 5; i++) {
      canvas.drawCircle(
        Offset(lensCenter.dx - 10 + i * 5, lensCenter.dy - 5 + (i % 2) * 10),
        4,
        Paint()..color = primaryColor,
      );
    }
  }

  void _drawAnnotationsThumbnail(Canvas canvas, Size size) {
    final random = math.Random(42);
    final xScale = scaleLinear(domain: [0, 8], range: [20, size.width - 20]);
    final yScale = scaleLinear(domain: [0, 100], range: [size.height - 15, 15]);

    // Line
    final path = Path()..moveTo(xScale(0), yScale(30 + random.nextDouble() * 20));
    for (int i = 1; i <= 8; i++) {
      path.lineTo(xScale(i.toDouble()), yScale(30 + random.nextDouble() * 50));
    }
    canvas.drawPath(
      path,
      Paint()
        ..color = primaryColor
        ..strokeWidth = 2
        ..style = PaintingStyle.stroke,
    );

    // Reference line
    canvas.drawLine(
      Offset(20, yScale(60)),
      Offset(size.width - 20, yScale(60)),
      Paint()
        ..color = Colors.red.withAlpha(150)
        ..strokeWidth = 1.5,
    );

    // Callout
    final calloutPoint = Offset(xScale(5), yScale(70));
    canvas.drawCircle(calloutPoint, 6, Paint()..color = Colors.orange);
    canvas.drawLine(
      calloutPoint,
      Offset(calloutPoint.dx + 15, calloutPoint.dy - 20),
      Paint()..color = Colors.orange,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(
        Rect.fromCenter(center: Offset(calloutPoint.dx + 25, calloutPoint.dy - 25), width: 25, height: 12),
        const Radius.circular(3),
      ),
      Paint()..color = Colors.orange,
    );
  }

  void _drawLegendsThumbnail(Canvas canvas, Size size) {
    final xScale = scaleLinear(domain: [0, 5], range: [15, size.width - 15]);
    final yScale = scaleLinear(domain: [0, 100], range: [size.height - 25, 15]);

    // Multiple lines
    final series = [
      ([30, 45, 40, 60, 55, 70], Colors.indigo),
      ([50, 55, 65, 50, 70, 65], Colors.teal),
      ([20, 30, 35, 40, 45, 50], Colors.orange),
    ];

    for (final (data, color) in series) {
      final path = Path()..moveTo(xScale(0), yScale(data[0].toDouble()));
      for (int i = 1; i < data.length; i++) {
        path.lineTo(xScale(i.toDouble()), yScale(data[i].toDouble()));
      }
      canvas.drawPath(
        path,
        Paint()
          ..color = color
          ..strokeWidth = 2
          ..style = PaintingStyle.stroke,
      );
    }

    // Legend box
    final legendRect = Rect.fromLTWH(size.width - 45, 5, 40, 35);
    canvas.drawRRect(
      RRect.fromRectAndRadius(legendRect, const Radius.circular(3)),
      Paint()..color = Colors.white.withAlpha(220),
    );

    for (int i = 0; i < series.length; i++) {
      canvas.drawRect(
        Rect.fromLTWH(legendRect.left + 4, legendRect.top + 4 + i * 10, 8, 6),
        Paint()..color = series[i].$2,
      );
    }
  }

  void _drawGradientsThumbnail(Canvas canvas, Size size) {
    final xScale = scaleLinear(domain: [0, 8], range: [15, size.width - 15]);
    final yScale = scaleLinear(domain: [0, 100], range: [size.height - 15, 15]);

    // Area with gradient
    final path = Path()..moveTo(xScale(0), yScale(0));
    final heights = [40, 55, 45, 70, 60, 80, 65, 75, 50];
    for (int i = 0; i < heights.length; i++) {
      path.lineTo(xScale(i.toDouble()), yScale(heights[i].toDouble()));
    }
    path.lineTo(xScale(8), yScale(0));
    path.close();

    final gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Colors.cyan.shade600, Colors.cyan.shade100],
    ).createShader(Rect.fromLTWH(0, 15, size.width, size.height - 30));

    canvas.drawPath(path, Paint()..shader = gradient);
  }

  void _drawWordcloudThumbnail(Canvas canvas, Size size) {
    final words = [
      ('Flutter', 16.0, Offset(size.width * 0.5, size.height * 0.35)),
      ('Dart', 14.0, Offset(size.width * 0.25, size.height * 0.5)),
      ('Widget', 12.0, Offset(size.width * 0.7, size.height * 0.55)),
      ('State', 10.0, Offset(size.width * 0.35, size.height * 0.7)),
      ('Build', 9.0, Offset(size.width * 0.65, size.height * 0.3)),
      ('UI', 11.0, Offset(size.width * 0.8, size.height * 0.7)),
    ];

    final colors = [primaryColor, Colors.teal, Colors.orange, Colors.purple, Colors.pink, Colors.green];

    for (int i = 0; i < words.length; i++) {
      final (text, fontSize, pos) = words[i];
      final textPainter = TextPainter(
        text: TextSpan(
          text: text,
          style: TextStyle(
            color: colors[i % colors.length],
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(canvas, Offset(pos.dx - textPainter.width / 2, pos.dy - textPainter.height / 2));
    }
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
