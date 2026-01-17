import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:data_visualization/data_visualization.dart';

class DelaunayVoronoiExample extends StatefulWidget {
  const DelaunayVoronoiExample({super.key});

  @override
  State<DelaunayVoronoiExample> createState() => _DelaunayVoronoiExampleState();
}

class _DelaunayVoronoiExampleState extends State<DelaunayVoronoiExample> {
  String _mode = 'Voronoi';
  final modes = ['Voronoi', 'Delaunay', 'Both'];

  late List<Point> points;

  @override
  void initState() {
    super.initState();
    _generatePoints();
  }

  void _generatePoints() {
    final random = math.Random();
    points = List.generate(25, (i) {
      return Point(
        50 + random.nextDouble() * 400,
        50 + random.nextDouble() * 300,
      );
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
              Wrap(
                spacing: 8,
                children: modes.map((m) {
                  return ChoiceChip(
                    label: Text(m),
                    selected: _mode == m,
                    onSelected: (_) => setState(() => _mode = m),
                  );
                }).toList(),
              ),
              const SizedBox(width: 16),
              ElevatedButton.icon(
                onPressed: () => setState(_generatePoints),
                icon: const Icon(Icons.refresh),
                label: const Text('Regenerate'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return CustomPaint(
                      size: Size(constraints.maxWidth, constraints.maxHeight),
                      painter: DelaunayVoronoiPainter(
                        points: points,
                        mode: _mode,
                        bounds: Rect.fromLTWH(0, 0, constraints.maxWidth, constraints.maxHeight),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DelaunayVoronoiPainter extends CustomPainter {
  final List<Point> points;
  final String mode;
  final Rect bounds;

  DelaunayVoronoiPainter({
    required this.points,
    required this.mode,
    required this.bounds,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (points.length < 3) return;

    // Create Delaunay triangulation
    final delaunay = Delaunay.fromPoints(points);

    // Draw Voronoi diagram
    if (mode == 'Voronoi' || mode == 'Both') {
      final voronoi = Voronoi(delaunay, bounds: [
        bounds.left,
        bounds.top,
        bounds.right,
        bounds.bottom,
      ]);

      final colors = [
        Colors.red.withAlpha(40),
        Colors.blue.withAlpha(40),
        Colors.green.withAlpha(40),
        Colors.orange.withAlpha(40),
        Colors.purple.withAlpha(40),
        Colors.teal.withAlpha(40),
        Colors.pink.withAlpha(40),
        Colors.indigo.withAlpha(40),
      ];

      // Draw cells
      for (int i = 0; i < points.length; i++) {
        final polygon = voronoi.cellPolygon(i);
        if (polygon != null && polygon.length >= 3) {
          final path = Path();
          path.moveTo(polygon.first.x, polygon.first.y);
          for (int j = 1; j < polygon.length; j++) {
            path.lineTo(polygon[j].x, polygon[j].y);
          }
          path.close();

          canvas.drawPath(path, Paint()..color = colors[i % colors.length]);
          canvas.drawPath(
            path,
            Paint()
              ..color = Colors.indigo.withAlpha(100)
              ..strokeWidth = 1
              ..style = PaintingStyle.stroke,
          );
        }
      }
    }

    // Draw Delaunay triangulation
    if (mode == 'Delaunay' || mode == 'Both') {
      final triangleIndices = delaunay.triangleIndices;

      final trianglePaint = Paint()
        ..color = mode == 'Both' ? Colors.orange.withAlpha(150) : Colors.indigo.withAlpha(100)
        ..strokeWidth = 1
        ..style = PaintingStyle.stroke;

      for (int i = 0; i < triangleIndices.length; i += 3) {
        final p0 = points[triangleIndices[i]];
        final p1 = points[triangleIndices[i + 1]];
        final p2 = points[triangleIndices[i + 2]];

        canvas.drawLine(Offset(p0.x, p0.y), Offset(p1.x, p1.y), trianglePaint);
        canvas.drawLine(Offset(p1.x, p1.y), Offset(p2.x, p2.y), trianglePaint);
        canvas.drawLine(Offset(p2.x, p2.y), Offset(p0.x, p0.y), trianglePaint);
      }
    }

    // Draw points
    for (final p in points) {
      canvas.drawCircle(
        Offset(p.x, p.y),
        5,
        Paint()..color = Colors.indigo,
      );
      canvas.drawCircle(
        Offset(p.x, p.y),
        2,
        Paint()..color = Colors.white,
      );
    }
  }

  @override
  bool shouldRepaint(DelaunayVoronoiPainter old) =>
      old.mode != mode || old.points != points;
}
