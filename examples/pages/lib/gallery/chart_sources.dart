/// Source code strings for all chart examples
class ChartSources {
  static const lineChart = r'''
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:data_visualization/data_visualization.dart';

class LineChartExample extends StatelessWidget {
  const LineChartExample({super.key});

  @override
  Widget build(BuildContext context) {
    // Generate sample data
    final data1 = List.generate(
      12,
      (i) => Point(i.toDouble(), 30 + 40 * math.sin(i * 0.5)),
    );
    final data2 = List.generate(
      12,
      (i) => Point(i.toDouble(), 50 + 30 * math.cos(i * 0.4)),
    );

    return CustomPaint(
      size: Size.infinite,
      painter: LineChartPainter(data1: data1, data2: data2),
    );
  }
}

class LineChartPainter extends CustomPainter {
  final List<Point> data1;
  final List<Point> data2;

  LineChartPainter({required this.data1, required this.data2});

  @override
  void paint(Canvas canvas, Size size) {
    // Create scales
    final xScale = scaleLinear(
      domain: [0, 11],
      range: [50, size.width - 20],
    );
    final yScale = scaleLinear(
      domain: [0, 100],
      range: [size.height - 40, 20],
    );

    // Create curve generator
    final curve = curveCatmullRom();

    void drawLine(List<Point> data, Color color) {
      final points = data.map((p) => Point(xScale(p.x), yScale(p.y))).toList();
      final curvePoints = curve.generate(points);

      final path = Path();
      path.moveTo(curvePoints.first.x, curvePoints.first.y);
      for (final p in curvePoints.skip(1)) {
        path.lineTo(p.x, p.y);
      }

      canvas.drawPath(
        path,
        Paint()
          ..color = color
          ..strokeWidth = 2.5
          ..style = PaintingStyle.stroke,
      );

      // Draw data points
      for (final p in points) {
        canvas.drawCircle(Offset(p.x, p.y), 4, Paint()..color = color);
      }
    }

    drawLine(data1, Colors.indigo);
    drawLine(data2, Colors.teal);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
''';

  static const areaChart = r'''
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:data_visualization/data_visualization.dart';

class AreaChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Generate stacked data
    final series1 = List.generate(12, (i) => Point(i.toDouble(), 20 + 15 * math.sin(i * 0.5)));
    final series2 = List.generate(12, (i) => Point(i.toDouble(), 30 + 20 * math.cos(i * 0.4)));
    final series3 = List.generate(12, (i) => Point(i.toDouble(), 25 + 10 * math.sin(i * 0.3)));

    // Create scales
    final xScale = scaleLinear(domain: [0, 11], range: [50, size.width - 20]);
    final yScale = scaleLinear(domain: [0, 100], range: [size.height - 40, 20]);

    // Create area generator with stacking
    final area = areaGenerator<Point>(
      x: (d) => xScale(d.x),
      y0: (d) => yScale(0),
      y1: (d) => yScale(d.y),
      curve: curveBasis(),
    );

    // Stack the data
    final stacked = stackData([series1, series2, series3]);

    // Draw each stacked area
    final colors = [Colors.indigo.withAlpha(200), Colors.teal.withAlpha(200), Colors.orange.withAlpha(200)];

    for (int i = stacked.length - 1; i >= 0; i--) {
      final path = area.generate(stacked[i]);
      canvas.drawPath(path, Paint()..color = colors[i]);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
''';

  static const barChart = r'''
import 'package:flutter/material.dart';
import 'package:data_visualization/data_visualization.dart';

class BarChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final categories = ['Q1', 'Q2', 'Q3', 'Q4'];
    final data1 = [45.0, 62.0, 53.0, 78.0];
    final data2 = [32.0, 48.0, 41.0, 55.0];

    // Create scales
    final xScale = scaleBand<String>(
      domain: categories,
      range: [60, size.width - 20],
      paddingInner: 0.3,
      paddingOuter: 0.15,
    );

    final yScale = scaleLinear(
      domain: [0, 100],
      range: [size.height - 40, 20],
    );

    // Draw grouped bars
    final barWidth = xScale.bandwidth / 2 - 4;

    for (int i = 0; i < categories.length; i++) {
      final x = xScale(categories[i]);

      // Bar 1
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTRB(x, yScale(data1[i]), x + barWidth, yScale(0)),
          const Radius.circular(4),
        ),
        Paint()..color = Colors.indigo,
      );

      // Bar 2
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTRB(x + barWidth + 4, yScale(data2[i]), x + barWidth * 2 + 4, yScale(0)),
          const Radius.circular(4),
        ),
        Paint()..color = Colors.teal,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
''';

  static const barHorizontal = r'''
import 'package:flutter/material.dart';
import 'package:data_visualization/data_visualization.dart';

class HorizontalBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final categories = ['Marketing', 'Sales', 'Engineering', 'Support'];
    final data = [85.0, 72.0, 95.0, 68.0];

    // Create scales (swapped for horizontal)
    final yScale = scaleBand<String>(
      domain: categories,
      range: [20, size.height - 40],
      paddingInner: 0.3,
    );

    final xScale = scaleLinear(
      domain: [0, 100],
      range: [80, size.width - 20],
    );

    // Draw horizontal bars
    for (int i = 0; i < categories.length; i++) {
      final y = yScale(categories[i]);
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTRB(xScale(0), y, xScale(data[i]), y + yScale.bandwidth),
          const Radius.circular(4),
        ),
        Paint()..color = Colors.blue,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
''';

  static const barStacked = r'''
import 'package:flutter/material.dart';
import 'package:data_visualization/data_visualization.dart';

class StackedBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final categories = ['Jan', 'Feb', 'Mar', 'Apr'];
    final series = [
      [20.0, 25.0, 30.0, 22.0],  // Series 1
      [30.0, 35.0, 28.0, 40.0],  // Series 2
      [15.0, 20.0, 25.0, 18.0],  // Series 3
    ];
    final colors = [Colors.indigo, Colors.teal, Colors.orange];

    final xScale = scaleBand<String>(
      domain: categories,
      range: [60, size.width - 20],
      paddingInner: 0.2,
    );

    final yScale = scaleLinear(
      domain: [0, 100],
      range: [size.height - 40, 20],
    );

    // Draw stacked bars
    for (int i = 0; i < categories.length; i++) {
      double cumulative = 0;
      for (int s = 0; s < series.length; s++) {
        final bottom = yScale(cumulative);
        cumulative += series[s][i];
        final top = yScale(cumulative);

        canvas.drawRRect(
          RRect.fromRectAndRadius(
            Rect.fromLTRB(xScale(categories[i]), top, xScale(categories[i]) + xScale.bandwidth, bottom),
            const Radius.circular(2),
          ),
          Paint()..color = colors[s],
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
''';

  static const pieChart = r'''
import 'dart:math' as math;
import 'package:flutter/material.dart';

class PieChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final data = [
      ('Mobile', 35.0, Colors.indigo),
      ('Desktop', 28.0, Colors.teal),
      ('Tablet', 18.0, Colors.orange),
      ('Other', 12.0, Colors.purple),
      ('TV', 7.0, Colors.pink),
    ];

    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width, size.height) / 2 - 20;
    final innerRadius = radius * 0.5;  // Donut hole

    final total = data.fold(0.0, (sum, item) => sum + item.$2);
    double startAngle = -math.pi / 2;

    for (final item in data) {
      final sweepAngle = (item.$2 / total) * 2 * math.pi;

      // Draw arc segment
      final path = Path();
      path.moveTo(
        center.dx + innerRadius * math.cos(startAngle),
        center.dy + innerRadius * math.sin(startAngle),
      );
      path.arcTo(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sweepAngle,
        false,
      );
      path.arcTo(
        Rect.fromCircle(center: center, radius: innerRadius),
        startAngle + sweepAngle,
        -sweepAngle,
        false,
      );
      path.close();
      canvas.drawPath(path, Paint()..color = item.$3);

      startAngle += sweepAngle;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
''';

  static const scatterChart = r'''
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:data_visualization/data_visualization.dart';

class ScatterChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Generate random bubble data: (x, y, size)
    final random = math.Random(42);
    final data = List.generate(30, (i) => (
      random.nextDouble() * 100,
      random.nextDouble() * 100,
      random.nextDouble() * 20 + 5,
    ));

    // Create scales
    final xScale = scaleLinear(domain: [0, 100], range: [60, size.width - 20]);
    final yScale = scaleLinear(domain: [0, 100], range: [size.height - 40, 20]);

    // Draw bubbles
    for (final point in data) {
      canvas.drawCircle(
        Offset(xScale(point.$1), yScale(point.$2)),
        point.$3,
        Paint()..color = Colors.pink.withAlpha(150),
      );
      canvas.drawCircle(
        Offset(xScale(point.$1), yScale(point.$2)),
        point.$3,
        Paint()
          ..color = Colors.pink
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
''';

  static const heatmap = r'''
import 'package:flutter/material.dart';
import 'package:data_visualization/data_visualization.dart';

class HeatmapPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final rows = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri'];
    final cols = ['9am', '12pm', '3pm', '6pm', '9pm'];

    // Activity data matrix
    final data = [
      [2, 5, 8, 4, 1],
      [3, 7, 9, 6, 2],
      [1, 4, 6, 8, 3],
      [4, 6, 7, 5, 2],
      [2, 3, 5, 4, 1],
    ];

    // Create color scale
    final colorScale = scaleSequential(
      domain: [0, 10],
      interpolator: interpolateBlues,
    );

    final cellWidth = (size.width - 60) / cols.length;
    final cellHeight = (size.height - 60) / rows.length;

    // Draw cells
    for (int i = 0; i < rows.length; i++) {
      for (int j = 0; j < cols.length; j++) {
        canvas.drawRRect(
          RRect.fromRectAndRadius(
            Rect.fromLTWH(60 + j * cellWidth, 20 + i * cellHeight, cellWidth - 2, cellHeight - 2),
            const Radius.circular(4),
          ),
          Paint()..color = colorScale(data[i][j].toDouble()),
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
''';

  static const radarChart = r'''
import 'dart:math' as math;
import 'package:flutter/material.dart';

class RadarChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final categories = ['Speed', 'Power', 'Defense', 'Agility', 'Stamina', 'Tech'];
    final data1 = [85, 70, 90, 75, 80, 65];  // Player 1
    final data2 = [70, 85, 65, 90, 70, 80];  // Player 2

    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width, size.height) / 2 - 40;
    final angleStep = 2 * math.pi / categories.length;

    // Draw web grid
    for (int level = 1; level <= 5; level++) {
      final r = radius * level / 5;
      final path = Path();
      for (int i = 0; i <= categories.length; i++) {
        final angle = -math.pi / 2 + i * angleStep;
        final point = Offset(center.dx + r * math.cos(angle), center.dy + r * math.sin(angle));
        if (i == 0) path.moveTo(point.dx, point.dy);
        else path.lineTo(point.dx, point.dy);
      }
      canvas.drawPath(path, Paint()..color = Colors.grey.withAlpha(50)..style = PaintingStyle.stroke);
    }

    // Draw data polygon
    void drawDataPolygon(List<int> data, Color color) {
      final path = Path();
      for (int i = 0; i <= data.length; i++) {
        final angle = -math.pi / 2 + (i % data.length) * angleStep;
        final r = radius * data[i % data.length] / 100;
        final point = Offset(center.dx + r * math.cos(angle), center.dy + r * math.sin(angle));
        if (i == 0) path.moveTo(point.dx, point.dy);
        else path.lineTo(point.dx, point.dy);
      }
      canvas.drawPath(path, Paint()..color = color.withAlpha(100));
      canvas.drawPath(path, Paint()..color = color..style = PaintingStyle.stroke..strokeWidth = 2);
    }

    drawDataPolygon(data1, Colors.indigo);
    drawDataPolygon(data2, Colors.orange);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
''';

  static const treemap = r'''
import 'package:flutter/material.dart';
import 'package:data_visualization/data_visualization.dart';

class TreemapPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Hierarchical data
    final root = HierarchyNode(
      value: 100,
      children: [
        HierarchyNode(value: 40, label: 'Category A'),
        HierarchyNode(value: 30, label: 'Category B'),
        HierarchyNode(value: 20, label: 'Category C'),
        HierarchyNode(value: 10, label: 'Category D'),
      ],
    );

    // Create treemap layout
    final treemap = treemapSquarify<HierarchyNode>(
      root: root,
      size: Size(size.width - 20, size.height - 20),
      padding: 2,
      value: (node) => node.value,
    );

    // Draw rectangles
    final colors = [Colors.indigo, Colors.teal, Colors.orange, Colors.purple];
    int colorIndex = 0;

    for (final node in treemap.leaves()) {
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(node.x0 + 10, node.y0 + 10, node.x1 - node.x0, node.y1 - node.y0),
          const Radius.circular(4),
        ),
        Paint()..color = colors[colorIndex++ % colors.length],
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
''';

  static const curves = r'''
import 'package:flutter/material.dart';
import 'package:data_visualization/data_visualization.dart';

class CurvesDemoPainter extends CustomPainter {
  final CurveType curveType;

  CurvesDemoPainter({required this.curveType});

  @override
  void paint(Canvas canvas, Size size) {
    // Sample control points
    final points = [
      Point(50, size.height - 50),
      Point(size.width * 0.25, 50),
      Point(size.width * 0.5, size.height - 100),
      Point(size.width * 0.75, 100),
      Point(size.width - 50, size.height - 50),
    ];

    // Select curve type
    final curve = switch (curveType) {
      CurveType.linear => curveLinear(),
      CurveType.basis => curveBasis(),
      CurveType.cardinal => curveCardinal(tension: 0.5),
      CurveType.catmullRom => curveCatmullRom(),
      CurveType.step => curveStep(),
      CurveType.natural => curveNatural(),
    };

    // Generate curve points
    final curvePoints = curve.generate(points);

    // Draw curve
    final path = Path();
    path.moveTo(curvePoints.first.x, curvePoints.first.y);
    for (final p in curvePoints.skip(1)) {
      path.lineTo(p.x, p.y);
    }
    canvas.drawPath(
      path,
      Paint()
        ..color = Colors.purple
        ..strokeWidth = 3
        ..style = PaintingStyle.stroke,
    );

    // Draw control points
    for (final p in points) {
      canvas.drawCircle(Offset(p.x, p.y), 6, Paint()..color = Colors.purple);
    }
  }

  @override
  bool shouldRepaint(covariant CurvesDemoPainter oldDelegate) =>
      oldDelegate.curveType != curveType;
}

enum CurveType { linear, basis, cardinal, catmullRom, step, natural }
''';

  static const streamgraph = r'''
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:data_visualization/data_visualization.dart';

class StreamgraphPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Generate stream data
    final layers = 5;
    final points = 20;
    final data = List.generate(layers, (layer) =>
      List.generate(points, (i) =>
        10 + 20 * math.sin(i * 0.3 + layer) + math.Random(layer * 100 + i).nextDouble() * 10
      )
    );

    // Apply streamgraph offset (wiggle)
    final stacked = stackOffsetWiggle(data);

    // Create scales
    final xScale = scaleLinear(domain: [0, points - 1], range: [20, size.width - 20]);
    final yScale = scaleLinear(domain: [-50, 50], range: [size.height - 20, 20]);

    // Draw streams
    final colors = [Colors.indigo, Colors.blue, Colors.teal, Colors.green, Colors.lime];

    for (int layer = 0; layer < layers; layer++) {
      final area = areaGenerator<int>(
        x: (i) => xScale(i.toDouble()),
        y0: (i) => yScale(stacked[layer][i].y0),
        y1: (i) => yScale(stacked[layer][i].y1),
        curve: curveBasis(),
      );

      final path = area.generate(List.generate(points, (i) => i));
      canvas.drawPath(path, Paint()..color = colors[layer].withAlpha(200));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
''';

  static const boxPlot = r'''
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:data_visualization/data_visualization.dart';

class BoxPlotPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Sample statistics for each group
    final groups = ['Group A', 'Group B', 'Group C', 'Group D'];
    final stats = [
      BoxStats(min: 10, q1: 25, median: 40, q3: 55, max: 70),
      BoxStats(min: 20, q1: 35, median: 50, q3: 65, max: 80),
      BoxStats(min: 5, q1: 20, median: 35, q3: 50, max: 65),
      BoxStats(min: 30, q1: 45, median: 60, q3: 75, max: 90),
    ];

    final xScale = scaleBand<String>(
      domain: groups,
      range: [60, size.width - 20],
      paddingInner: 0.4,
    );
    final yScale = scaleLinear(domain: [0, 100], range: [size.height - 40, 20]);

    for (int i = 0; i < groups.length; i++) {
      final x = xScale(groups[i]);
      final w = xScale.bandwidth;
      final s = stats[i];

      // Draw whiskers
      canvas.drawLine(
        Offset(x + w / 2, yScale(s.min)),
        Offset(x + w / 2, yScale(s.max)),
        Paint()..color = Colors.purple..strokeWidth = 1,
      );

      // Draw box (Q1 to Q3)
      canvas.drawRect(
        Rect.fromLTRB(x, yScale(s.q3), x + w, yScale(s.q1)),
        Paint()..color = Colors.purple.withAlpha(100),
      );
      canvas.drawRect(
        Rect.fromLTRB(x, yScale(s.q3), x + w, yScale(s.q1)),
        Paint()..color = Colors.purple..style = PaintingStyle.stroke..strokeWidth = 2,
      );

      // Draw median line
      canvas.drawLine(
        Offset(x, yScale(s.median)),
        Offset(x + w, yScale(s.median)),
        Paint()..color = Colors.purple..strokeWidth = 3,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class BoxStats {
  final double min, q1, median, q3, max;
  BoxStats({required this.min, required this.q1, required this.median, required this.q3, required this.max});
}
''';

  static const radialBar = r'''
import 'dart:math' as math;
import 'package:flutter/material.dart';

class RadialBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final data = [
      ('Mon', 0.8, Colors.indigo),
      ('Tue', 0.6, Colors.blue),
      ('Wed', 0.9, Colors.teal),
      ('Thu', 0.7, Colors.green),
      ('Fri', 0.5, Colors.orange),
      ('Sat', 0.4, Colors.red),
      ('Sun', 0.3, Colors.purple),
    ];

    final center = Offset(size.width / 2, size.height / 2);
    final maxRadius = math.min(size.width, size.height) / 2 - 30;
    final barWidth = maxRadius / data.length - 5;

    for (int i = 0; i < data.length; i++) {
      final item = data[i];
      final radius = maxRadius - i * (barWidth + 5);
      final sweepAngle = item.$2 * 2 * math.pi;

      // Background track
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        -math.pi / 2,
        2 * math.pi,
        false,
        Paint()
          ..color = Colors.grey.withAlpha(50)
          ..strokeWidth = barWidth
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round,
      );

      // Progress arc
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        -math.pi / 2,
        sweepAngle,
        false,
        Paint()
          ..color = item.$3
          ..strokeWidth = barWidth
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
''';

  static const networkGraph = r'''
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:data_visualization/data_visualization.dart';

class NetworkGraphPainter extends CustomPainter {
  final List<GraphNode> nodes;
  final List<GraphEdge> edges;

  NetworkGraphPainter({required this.nodes, required this.edges});

  @override
  void paint(Canvas canvas, Size size) {
    // Draw edges
    for (final edge in edges) {
      canvas.drawLine(
        Offset(edge.source.x, edge.source.y),
        Offset(edge.target.x, edge.target.y),
        Paint()
          ..color = Colors.grey.withAlpha(100)
          ..strokeWidth = edge.weight,
      );
    }

    // Draw nodes
    for (final node in nodes) {
      canvas.drawCircle(
        Offset(node.x, node.y),
        node.radius,
        Paint()..color = node.color,
      );
      canvas.drawCircle(
        Offset(node.x, node.y),
        node.radius,
        Paint()
          ..color = Colors.white
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

// Use forceSimulation to layout nodes
final simulation = forceSimulation<GraphNode>(nodes)
  ..addForce('charge', forceManyBody(strength: -100))
  ..addForce('link', forceLink(edges, distance: 50))
  ..addForce('center', forceCenter(size.width / 2, size.height / 2));
''';

  static const chordDiagram = r'''
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:data_visualization/data_visualization.dart';

class ChordDiagramPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Flow matrix between groups
    final matrix = [
      [0, 20, 10, 5],
      [15, 0, 25, 10],
      [5, 20, 0, 15],
      [10, 5, 10, 0],
    ];
    final labels = ['A', 'B', 'C', 'D'];
    final colors = [Colors.indigo, Colors.teal, Colors.orange, Colors.purple];

    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width, size.height) / 2 - 40;

    // Generate chord layout
    final chords = chordLayout(matrix: matrix, padAngle: 0.05);

    // Draw outer arcs
    for (int i = 0; i < chords.groups.length; i++) {
      final group = chords.groups[i];
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        group.startAngle,
        group.endAngle - group.startAngle,
        false,
        Paint()
          ..color = colors[i]
          ..strokeWidth = 20
          ..style = PaintingStyle.stroke,
      );
    }

    // Draw chord ribbons
    for (final chord in chords.chords) {
      final path = ribbonPath(
        chord: chord,
        center: center,
        radius: radius - 25,
      );
      canvas.drawPath(
        path,
        Paint()..color = colors[chord.source.index].withAlpha(150),
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
''';

  static const sankeyDiagram = r'''
import 'package:flutter/material.dart';
import 'package:data_visualization/data_visualization.dart';

class SankeyDiagramPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Define nodes and links
    final nodes = [
      SankeyNode(label: 'Source A'),
      SankeyNode(label: 'Source B'),
      SankeyNode(label: 'Process'),
      SankeyNode(label: 'Output X'),
      SankeyNode(label: 'Output Y'),
    ];

    final links = [
      SankeyLink(source: 0, target: 2, value: 30),
      SankeyLink(source: 1, target: 2, value: 20),
      SankeyLink(source: 2, target: 3, value: 25),
      SankeyLink(source: 2, target: 4, value: 25),
    ];

    // Compute layout
    final sankey = sankeyLayout(
      nodes: nodes,
      links: links,
      size: Size(size.width - 40, size.height - 40),
      nodePadding: 10,
      nodeWidth: 20,
    );

    // Draw links
    for (final link in sankey.links) {
      final path = sankeyLinkPath(link);
      canvas.drawPath(
        path.shift(const Offset(20, 20)),
        Paint()..color = Colors.teal.withAlpha(100),
      );
    }

    // Draw nodes
    for (final node in sankey.nodes) {
      canvas.drawRect(
        Rect.fromLTWH(node.x0 + 20, node.y0 + 20, node.x1 - node.x0, node.y1 - node.y0),
        Paint()..color = Colors.indigo,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
''';

  static const tree = r'''
import 'package:flutter/material.dart';
import 'package:data_visualization/data_visualization.dart';

class TreeLayoutPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Define tree structure
    final root = TreeNode(
      label: 'Root',
      children: [
        TreeNode(label: 'A', children: [
          TreeNode(label: 'A1'),
          TreeNode(label: 'A2'),
        ]),
        TreeNode(label: 'B', children: [
          TreeNode(label: 'B1'),
          TreeNode(label: 'B2'),
          TreeNode(label: 'B3'),
        ]),
        TreeNode(label: 'C'),
      ],
    );

    // Compute tree layout
    final tree = treeLayout<TreeNode>(
      root: root,
      size: Size(size.width - 40, size.height - 40),
      nodeSize: const Size(60, 40),
    );

    // Draw links
    for (final link in tree.links()) {
      canvas.drawLine(
        Offset(link.source.x + 20, link.source.y + 20),
        Offset(link.target.x + 20, link.target.y + 20),
        Paint()..color = Colors.grey..strokeWidth = 2,
      );
    }

    // Draw nodes
    for (final node in tree.descendants()) {
      canvas.drawCircle(
        Offset(node.x + 20, node.y + 20),
        15,
        Paint()..color = Colors.teal,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
''';

  static const pack = r'''
import 'package:flutter/material.dart';
import 'package:data_visualization/data_visualization.dart';

class CirclePackPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Hierarchical data with values
    final root = PackNode(
      value: 100,
      children: [
        PackNode(value: 40, children: [
          PackNode(value: 15),
          PackNode(value: 10),
          PackNode(value: 15),
        ]),
        PackNode(value: 30),
        PackNode(value: 20, children: [
          PackNode(value: 12),
          PackNode(value: 8),
        ]),
        PackNode(value: 10),
      ],
    );

    // Compute circle packing layout
    final pack = packLayout<PackNode>(
      root: root,
      size: Size(size.width - 40, size.height - 40),
      padding: 3,
      value: (node) => node.value,
    );

    // Draw circles
    final colors = [Colors.indigo.withAlpha(100), Colors.teal.withAlpha(150), Colors.orange.withAlpha(200)];

    for (final node in pack.descendants()) {
      final depth = node.depth.clamp(0, colors.length - 1);
      canvas.drawCircle(
        Offset(node.x + 20, node.y + 20),
        node.r,
        Paint()..color = colors[depth],
      );
      canvas.drawCircle(
        Offset(node.x + 20, node.y + 20),
        node.r,
        Paint()..color = Colors.white.withAlpha(100)..style = PaintingStyle.stroke..strokeWidth = 2,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
''';

  static const voronoi = r'''
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:data_visualization/data_visualization.dart';

class VoronoiDiagramPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Generate random points
    final random = math.Random(42);
    final points = List.generate(20, (i) => Point(
      random.nextDouble() * (size.width - 40) + 20,
      random.nextDouble() * (size.height - 40) + 20,
    ));

    // Create Delaunay triangulation
    final delaunay = Delaunay(points);

    // Create Voronoi diagram
    final voronoi = delaunay.voronoi(
      bounds: Rect.fromLTWH(0, 0, size.width, size.height),
    );

    // Draw Voronoi cells
    final colors = [Colors.indigo, Colors.teal, Colors.orange, Colors.purple, Colors.pink];

    for (int i = 0; i < voronoi.cells.length; i++) {
      final cell = voronoi.cells[i];
      final path = Path();
      path.moveTo(cell.first.x, cell.first.y);
      for (final p in cell.skip(1)) {
        path.lineTo(p.x, p.y);
      }
      path.close();

      canvas.drawPath(path, Paint()..color = colors[i % colors.length].withAlpha(100));
      canvas.drawPath(path, Paint()..color = Colors.white..style = PaintingStyle.stroke);
    }

    // Draw points
    for (final p in points) {
      canvas.drawCircle(Offset(p.x, p.y), 4, Paint()..color = Colors.black);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
''';

  static const geoMap = r'''
import 'package:flutter/material.dart';
import 'package:data_visualization/data_visualization.dart';

class GeoMapPainter extends CustomPainter {
  final GeoJson geoJson;
  final GeoProjection projection;

  GeoMapPainter({required this.geoJson, required this.projection});

  @override
  void paint(Canvas canvas, Size size) {
    // Create path generator with projection
    final pathGenerator = geoPath(projection: projection);

    // Draw each feature (country)
    for (final feature in geoJson.features) {
      final path = pathGenerator.path(feature.geometry);

      // Fill
      canvas.drawPath(
        path,
        Paint()..color = Colors.lightGreen.withAlpha(100),
      );

      // Stroke
      canvas.drawPath(
        path,
        Paint()
          ..color = Colors.green.shade700
          ..style = PaintingStyle.stroke
          ..strokeWidth = 0.5,
      );
    }

    // Draw graticule (grid lines)
    final graticule = geoGraticule();
    canvas.drawPath(
      pathGenerator.path(graticule),
      Paint()
        ..color = Colors.grey.withAlpha(50)
        ..style = PaintingStyle.stroke,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Usage:
// final projection = geoMercator()
//   ..fitSize(Size(width, height), geoJson)
//   ..center = [0, 20];
''';

  static const geoPrebuilt = r'''
import 'package:flutter/material.dart';
import 'package:data_visualization/data_visualization.dart';
import 'package:dv_map/maps/world/110m.dart';

class PrebuiltMapExample extends StatelessWidget {
  const PrebuiltMapExample({super.key});

  @override
  Widget build(BuildContext context) {
    // Use the generated widget directly - no async loading needed!
    return World110mWidget(
      projection: MercatorProjection(),
      fillColor: Colors.green.shade300,
      strokeColor: Colors.green.shade700,
      strokeWidth: 0.6,
    );
  }
}
''';

  static const geoChoropleth = r'''
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:data_visualization/data_visualization.dart';

class ChoroplethPainter extends CustomPainter {
  final GeoJsonFeatureCollection worldData;
  final Map<String, double> densityData;

  ChoroplethPainter({required this.worldData, required this.densityData});

  Color getColorForDensity(double? density) {
    if (density == null) return Colors.grey.shade300;
    // Log scale for better distribution
    final logDensity = density > 0 ? math.log(density + 1) : 0;
    final maxLog = math.log(1300);
    final t = (logDensity / maxLog).clamp(0.0, 1.0);
    return Color.lerp(const Color(0xFFE3F2FD), const Color(0xFF0D47A1), t)!;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final center = Point(size.width / 2, size.height / 2);
    final scale = size.width / 6.5;

    final proj = geoMercator(center: (0, 20), scale: scale, translate: center);
    final geoPathGenerator = GeoPath(proj);

    for (final feature in worldData.features) {
      final name = feature.properties?['name'] as String?;
      final density = densityData[name];
      final color = getColorForDensity(density);

      final paths = geoPathGenerator.generate(feature);

      for (final pathPoints in paths) {
        if (pathPoints.length < 3) continue;
        final path = Path();
        path.moveTo(pathPoints.first.x, pathPoints.first.y);
        for (int i = 1; i < pathPoints.length; i++) {
          path.lineTo(pathPoints[i].x, pathPoints[i].y);
        }
        path.close();
        canvas.drawPath(path, Paint()..color = color);
        canvas.drawPath(path, Paint()
          ..color = Colors.grey.shade600
          ..strokeWidth = 0.5
          ..style = PaintingStyle.stroke);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
''';

  static const geoUsa = r'''
import 'package:flutter/material.dart';
import 'package:data_visualization/data_visualization.dart';

class UsaMapPainter extends CustomPainter {
  final GeoJsonFeatureCollection usaData;

  UsaMapPainter({required this.usaData});

  Color getColorForDensity(double density) {
    if (density < 20) return const Color(0xFFE8F5E9);
    if (density < 50) return const Color(0xFFC8E6C9);
    if (density < 100) return const Color(0xFFA5D6A7);
    if (density < 200) return const Color(0xFF81C784);
    if (density < 500) return const Color(0xFF66BB6A);
    return const Color(0xFF4CAF50);
  }

  @override
  void paint(Canvas canvas, Size size) {
    final center = Point(size.width / 2, size.height / 2);
    final scale = size.width / 1.3;

    // Create Albers projection optimized for USA
    final proj = geoAlbers(
      center: (-96, 38),
      scale: scale,
      translate: center,
      parallels0: 29.5,
      parallels1: 45.5,
    );

    final geoPathGenerator = GeoPath(proj);

    for (final feature in usaData.features) {
      final density = (feature.properties?['density'] as num?)?.toDouble() ?? 0;
      final color = getColorForDensity(density);
      final paths = geoPathGenerator.generate(feature);

      for (final pathPoints in paths) {
        if (pathPoints.length < 3) continue;
        final path = Path();
        path.moveTo(pathPoints.first.x, pathPoints.first.y);
        for (int i = 1; i < pathPoints.length; i++) {
          path.lineTo(pathPoints[i].x, pathPoints[i].y);
        }
        path.close();
        canvas.drawPath(path, Paint()..color = color);
        canvas.drawPath(path, Paint()
          ..color = Colors.grey.shade600
          ..strokeWidth = 0.5
          ..style = PaintingStyle.stroke);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
''';

  static const geoGlobe = r'''
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:data_visualization/data_visualization.dart';

class GlobePainter extends CustomPainter {
  final GeoJsonFeatureCollection worldData;
  final double rotationX;  // longitude rotation
  final double rotationY;  // latitude rotation

  GlobePainter({
    required this.worldData,
    required this.rotationX,
    required this.rotationY,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Point(size.width / 2, size.height / 2);
    final radius = math.min(size.width, size.height) * 0.4;

    // Draw globe background with ocean gradient
    final globeGradient = RadialGradient(
      colors: [
        const Color(0xFF4FC3F7),
        const Color(0xFF0288D1),
        const Color(0xFF01579B),
      ],
      center: const Alignment(-0.3, -0.3),
    );
    canvas.drawCircle(
      Offset(center.x, center.y),
      radius,
      Paint()..shader = globeGradient.createShader(
        Rect.fromCircle(center: Offset(center.x, center.y), radius: radius),
      ),
    );

    // Create orthographic projection with rotation
    final proj = geoOrthographic(
      center: (0, 0),
      scale: radius,
      translate: center,
      rotate: (-rotationX, -rotationY, 0),
    );

    final geoPathGenerator = GeoPath(proj);

    // Draw land masses (back hemisphere points return NaN)
    for (final feature in worldData.features) {
      final paths = geoPathGenerator.generate(feature);
      for (final pathPoints in paths) {
        if (pathPoints.any((p) => p.hasNaN)) continue;
        if (pathPoints.length < 3) continue;

        final path = Path();
        path.moveTo(pathPoints.first.x, pathPoints.first.y);
        for (int i = 1; i < pathPoints.length; i++) {
          path.lineTo(pathPoints[i].x, pathPoints[i].y);
        }
        path.close();
        canvas.drawPath(path, Paint()..color = const Color(0xFF81C784));
        canvas.drawPath(path, Paint()
          ..color = const Color(0xFF388E3C)
          ..strokeWidth = 0.5
          ..style = PaintingStyle.stroke);
      }
    }

    // Draw globe border
    canvas.drawCircle(
      Offset(center.x, center.y),
      radius,
      Paint()
        ..color = const Color(0xFF90CAF9)
        ..strokeWidth = 2
        ..style = PaintingStyle.stroke,
    );
  }

  @override
  bool shouldRepaint(GlobePainter old) =>
      old.rotationX != rotationX || old.rotationY != rotationY;
}
''';

  static const scales = r'''
import 'package:flutter/material.dart';
import 'package:data_visualization/data_visualization.dart';

void demonstrateScales() {
  // Linear scale - maps continuous domain to continuous range
  final linear = scaleLinear(
    domain: [0, 100],
    range: [0, 500],
  );
  print(linear(50));  // 250

  // Band scale - maps discrete domain to continuous range
  final band = scaleBand<String>(
    domain: ['A', 'B', 'C', 'D'],
    range: [0, 400],
    paddingInner: 0.2,
    paddingOuter: 0.1,
  );
  print(band('B'));  // 100
  print(band.bandwidth);  // ~80

  // Log scale - logarithmic mapping
  final log = scaleLog(
    domain: [1, 1000],
    range: [0, 300],
    base: 10,
  );
  print(log(10));   // 100
  print(log(100));  // 200

  // Power scale - polynomial mapping
  final pow = scalePow(
    domain: [0, 100],
    range: [0, 500],
    exponent: 2,
  );
  print(pow(50));  // 125 (quadratic)

  // Color scale - sequential colors
  final colorScale = scaleSequential(
    domain: [0, 100],
    interpolator: interpolateViridis,
  );
  print(colorScale(50));  // Color at midpoint
}
''';

  static const interactive = r'''
import 'package:flutter/material.dart';
import 'package:data_visualization/data_visualization.dart';

class InteractiveChartExample extends StatefulWidget {
  @override
  State<InteractiveChartExample> createState() => _InteractiveChartExampleState();
}

class _InteractiveChartExampleState extends State<InteractiveChartExample> {
  Point? hoveredPoint;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) {
        // Find nearest point to cursor
        final nearest = findNearestPoint(event.localPosition);
        setState(() => hoveredPoint = nearest);
      },
      onExit: (_) => setState(() => hoveredPoint = null),
      child: Stack(
        children: [
          CustomPaint(
            size: Size.infinite,
            painter: ChartPainter(hoveredPoint: hoveredPoint),
          ),
          if (hoveredPoint != null)
            Positioned(
              left: hoveredPoint!.x + 10,
              top: hoveredPoint!.y - 30,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  'Value: ${hoveredPoint!.y.toStringAsFixed(1)}',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Point? findNearestPoint(Offset position) {
    // Find the data point nearest to the cursor
    // using Voronoi diagram for efficient lookup
    return voronoiFind(position);
  }
}
''';

  static const brush = r'''
import 'package:flutter/material.dart';
import 'package:data_visualization/data_visualization.dart';

class BrushExample extends StatefulWidget {
  @override
  State<BrushExample> createState() => _BrushExampleState();
}

class _BrushExampleState extends State<BrushExample> {
  Rect? selection;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: (details) {
        setState(() => selection = Rect.fromPoints(
          details.localPosition,
          details.localPosition,
        ));
      },
      onPanUpdate: (details) {
        setState(() => selection = Rect.fromPoints(
          selection!.topLeft,
          details.localPosition,
        ));
      },
      onPanEnd: (_) {
        // Filter data within selection
        final selected = data.where((p) =>
          selection!.contains(Offset(xScale(p.x), yScale(p.y)))
        ).toList();
        print('Selected ${selected.length} points');
      },
      child: CustomPaint(
        size: Size.infinite,
        painter: BrushPainter(selection: selection),
      ),
    );
  }
}

class BrushPainter extends CustomPainter {
  final Rect? selection;
  BrushPainter({this.selection});

  @override
  void paint(Canvas canvas, Size size) {
    // Draw data points...

    // Draw selection rectangle
    if (selection != null) {
      canvas.drawRect(
        selection!,
        Paint()
          ..color = Colors.blue.withAlpha(50)
          ..style = PaintingStyle.fill,
      );
      canvas.drawRect(
        selection!,
        Paint()
          ..color = Colors.blue
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2,
      );
    }
  }

  @override
  bool shouldRepaint(covariant BrushPainter oldDelegate) =>
      oldDelegate.selection != selection;
}
''';

  static const zoom = r'''
import 'package:flutter/material.dart';
import 'package:data_visualization/data_visualization.dart';

class ZoomExample extends StatefulWidget {
  @override
  State<ZoomExample> createState() => _ZoomExampleState();
}

class _ZoomExampleState extends State<ZoomExample> {
  double scale = 1.0;
  Offset translate = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onScaleStart: (details) {
        // Store initial state
      },
      onScaleUpdate: (details) {
        setState(() {
          scale = (scale * details.scale).clamp(0.5, 4.0);
          translate += details.focalPointDelta;
        });
      },
      child: CustomPaint(
        size: Size.infinite,
        painter: ZoomablePainter(
          scale: scale,
          translate: translate,
        ),
      ),
    );
  }
}

class ZoomablePainter extends CustomPainter {
  final double scale;
  final Offset translate;

  ZoomablePainter({required this.scale, required this.translate});

  @override
  void paint(Canvas canvas, Size size) {
    // Apply transform
    canvas.save();
    canvas.translate(translate.dx, translate.dy);
    canvas.scale(scale);

    // Draw content with transformed coordinates
    final xScale = scaleLinear(
      domain: [0, 100],
      range: [50 / scale, (size.width - 20) / scale],
    );
    final yScale = scaleLinear(
      domain: [0, 100],
      range: [(size.height - 40) / scale, 20 / scale],
    );

    // Draw data points...

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant ZoomablePainter oldDelegate) =>
      oldDelegate.scale != scale || oldDelegate.translate != translate;
}
''';

  static const annotations = r'''
import 'package:flutter/material.dart';
import 'package:data_visualization/data_visualization.dart';

class AnnotatedChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Draw chart...

    // Add reference line
    final thresholdY = yScale(75);
    canvas.drawLine(
      Offset(margin.left, thresholdY),
      Offset(size.width - 20, thresholdY),
      Paint()
        ..color = Colors.red
        ..strokeWidth = 2
        ..style = PaintingStyle.stroke,
    );

    // Add threshold label
    final textPainter = TextPainter(
      text: const TextSpan(
        text: 'Target: 75',
        style: TextStyle(color: Colors.red, fontSize: 12),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    textPainter.paint(canvas, Offset(size.width - 80, thresholdY - 20));

    // Add callout annotation
    final annotationPoint = Offset(xScale(peak.x), yScale(peak.y));

    // Draw callout line
    canvas.drawLine(
      annotationPoint,
      annotationPoint + const Offset(30, -30),
      Paint()..color = Colors.black54..strokeWidth = 1,
    );

    // Draw callout box
    final calloutRect = Rect.fromCenter(
      center: annotationPoint + const Offset(60, -45),
      width: 60,
      height: 24,
    );
    canvas.drawRRect(
      RRect.fromRectAndRadius(calloutRect, const Radius.circular(4)),
      Paint()..color = Colors.black87,
    );

    // Draw callout text
    final calloutText = TextPainter(
      text: TextSpan(
        text: 'Peak: ${peak.y.toInt()}',
        style: const TextStyle(color: Colors.white, fontSize: 11),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    calloutText.paint(
      canvas,
      calloutRect.topLeft + Offset(8, (calloutRect.height - calloutText.height) / 2),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
''';

  static const legends = r'''
import 'package:flutter/material.dart';

class InteractiveLegend extends StatefulWidget {
  final List<LegendItem> items;
  final Function(int, bool) onToggle;

  const InteractiveLegend({required this.items, required this.onToggle});

  @override
  State<InteractiveLegend> createState() => _InteractiveLegendState();
}

class _InteractiveLegendState extends State<InteractiveLegend> {
  final Set<int> hiddenSeries = {};

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      runSpacing: 8,
      children: widget.items.asMap().entries.map((entry) {
        final index = entry.key;
        final item = entry.value;
        final isHidden = hiddenSeries.contains(index);

        return GestureDetector(
          onTap: () {
            setState(() {
              if (isHidden) {
                hiddenSeries.remove(index);
              } else {
                hiddenSeries.add(index);
              }
            });
            widget.onToggle(index, !isHidden);
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  color: isHidden ? Colors.grey : item.color,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: isHidden
                    ? const Icon(Icons.visibility_off, size: 12, color: Colors.white)
                    : null,
              ),
              const SizedBox(width: 8),
              Text(
                item.label,
                style: TextStyle(
                  color: isHidden ? Colors.grey : Colors.black87,
                  decoration: isHidden ? TextDecoration.lineThrough : null,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

class LegendItem {
  final String label;
  final Color color;
  LegendItem({required this.label, required this.color});
}
''';

  static const gradients = r'''
import 'package:flutter/material.dart';
import 'package:data_visualization/data_visualization.dart';

class GradientChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Linear gradient fill for area chart
    final linearGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Colors.indigo.withAlpha(200),
        Colors.indigo.withAlpha(20),
      ],
    );

    final areaPath = generateAreaPath();
    canvas.drawPath(
      areaPath,
      Paint()
        ..shader = linearGradient.createShader(
          Rect.fromLTWH(0, 0, size.width, size.height),
        ),
    );

    // Radial gradient for bubble
    final radialGradient = RadialGradient(
      colors: [
        Colors.teal.withAlpha(200),
        Colors.teal.withAlpha(50),
      ],
    );

    for (final bubble in bubbles) {
      canvas.drawCircle(
        Offset(bubble.x, bubble.y),
        bubble.radius,
        Paint()
          ..shader = radialGradient.createShader(
            Rect.fromCircle(
              center: Offset(bubble.x, bubble.y),
              radius: bubble.radius,
            ),
          ),
      );
    }

    // Sweep gradient for pie chart
    final sweepGradient = SweepGradient(
      colors: [Colors.red, Colors.orange, Colors.yellow, Colors.green, Colors.blue, Colors.red],
      startAngle: 0,
      endAngle: 2 * 3.14159,
    );

    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      100,
      Paint()
        ..shader = sweepGradient.createShader(
          Rect.fromCircle(center: Offset(size.width / 2, size.height / 2), radius: 100),
        ),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
''';

  static const wordcloud = r'''
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:data_visualization/data_visualization.dart';

class WordCloudPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final words = [
      ('Flutter', 50),
      ('Dart', 45),
      ('Widget', 40),
      ('Data', 35),
      ('Chart', 30),
      ('Visualization', 28),
      ('Canvas', 25),
      ('Paint', 22),
      ('Color', 20),
      ('Scale', 18),
    ];

    // Generate word cloud layout
    final layout = wordCloudLayout(
      words: words,
      size: size,
      fontSizeRange: (12, 48),
      spiral: archimedeanSpiral,
      rotate: (word) => math.Random().nextBool() ? 0 : -math.pi / 2,
    );

    final colors = [Colors.indigo, Colors.teal, Colors.orange, Colors.purple, Colors.pink];

    for (int i = 0; i < layout.length; i++) {
      final word = layout[i];

      canvas.save();
      canvas.translate(word.x + size.width / 2, word.y + size.height / 2);
      canvas.rotate(word.rotation);

      final textPainter = TextPainter(
        text: TextSpan(
          text: word.text,
          style: TextStyle(
            fontSize: word.fontSize,
            fontWeight: FontWeight.bold,
            color: colors[i % colors.length],
          ),
        ),
        textDirection: TextDirection.ltr,
      )..layout();

      textPainter.paint(canvas, Offset(-textPainter.width / 2, -textPainter.height / 2));
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
''';

  static const threshold = r'''
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:data_visualization/data_visualization.dart';

class ThresholdChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Generate actual vs expected data
    final actual = List.generate(20, (i) => Point(i.toDouble(), 50 + 30 * math.sin(i * 0.3)));
    final expected = List.generate(20, (i) => Point(i.toDouble(), 50.0));

    final xScale = scaleLinear(domain: [0, 19], range: [50, size.width - 20]);
    final yScale = scaleLinear(domain: [0, 100], range: [size.height - 40, 20]);

    // Create threshold area generator
    final thresholdArea = thresholdGenerator<Point>(
      x: (d) => xScale(d.x),
      y0: (d) => yScale(50),  // threshold line
      y1: (d) => yScale(d.y),
      curve: curveBasis(),
    );

    // Generate clipped areas
    final aboveThreshold = thresholdArea.clipAbove(actual);
    final belowThreshold = thresholdArea.clipBelow(actual);

    // Draw area above threshold (positive difference)
    canvas.drawPath(
      aboveThreshold,
      Paint()..color = Colors.green.withAlpha(150),
    );

    // Draw area below threshold (negative difference)
    canvas.drawPath(
      belowThreshold,
      Paint()..color = Colors.red.withAlpha(150),
    );

    // Draw threshold line
    canvas.drawLine(
      Offset(xScale(0), yScale(50)),
      Offset(xScale(19), yScale(50)),
      Paint()
        ..color = Colors.grey
        ..strokeWidth = 2
        ..style = PaintingStyle.stroke,
    );

    // Draw actual line
    final linePath = Path();
    linePath.moveTo(xScale(actual.first.x), yScale(actual.first.y));
    for (final p in actual.skip(1)) {
      linePath.lineTo(xScale(p.x), yScale(p.y));
    }
    canvas.drawPath(
      linePath,
      Paint()
        ..color = Colors.black
        ..strokeWidth = 2
        ..style = PaintingStyle.stroke,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
''';

  static const mockData = r'''
import 'package:flutter/material.dart';
import 'package:dv_mock_data/dv_mock_data.dart';

class MockDataDemo extends StatefulWidget {
  const MockDataDemo({super.key});

  @override
  State<MockDataDemo> createState() => _MockDataDemoState();
}

class _MockDataDemoState extends State<MockDataDemo> {
  final mock = MockData(42); // Seeded for reproducibility

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Scatter plot with correlated data
        Expanded(
          child: CustomPaint(
            painter: ScatterPainter(
              mock.scatterData(count: 100, correlation: 0.7),
            ),
          ),
        ),
        // Time series stock prices
        Expanded(
          child: CustomPaint(
            painter: TimeSeriesPainter(
              mock.timeSeries.stockPrice(
                start: DateTime.now().subtract(Duration(days: 90)),
                end: DateTime.now(),
                interval: Duration(days: 1),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// Available generators:
// mock.scatterData() - Scatter plot points
// mock.lineData() - Line chart data
// mock.barData() - Bar chart categories
// mock.pieData() - Pie slices with percentages
// mock.treemapData() - Hierarchical tree data
// mock.networkData() - Nodes and links
// mock.heatmapData() - Matrix data
// mock.boxPlotData() - Statistical quartiles
// mock.timeSeries.stockPrice() - GBM stock prices
// mock.timeSeries.ohlc() - Candlestick data
// mock.random.normal() - Normal distribution
// mock.random.randomWalk() - Random walk sequence
''';
}
