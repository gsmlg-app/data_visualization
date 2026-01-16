import 'package:flutter/material.dart';
import 'package:data_visualization/data_visualization.dart';

class GeoMapScreen extends StatefulWidget {
  const GeoMapScreen({super.key});

  @override
  State<GeoMapScreen> createState() => _GeoMapScreenState();
}

class _GeoMapScreenState extends State<GeoMapScreen> {
  String _selectedProjection = 'Mercator';
  double _rotation = 0;

  final projections = ['Mercator', 'Equirectangular', 'Orthographic'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Geo Map'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'World Map Projections',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text('Projection: '),
                const SizedBox(width: 8),
                DropdownButton<String>(
                  value: _selectedProjection,
                  items: projections.map((p) => DropdownMenuItem(
                    value: p,
                    child: Text(p),
                  )).toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() => _selectedProjection = value);
                    }
                  },
                ),
                const Spacer(),
                if (_selectedProjection == 'Orthographic') ...[
                  const Text('Rotation: '),
                  Slider(
                    value: _rotation,
                    min: -180,
                    max: 180,
                    onChanged: (value) {
                      setState(() => _rotation = value);
                    },
                  ),
                ],
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.lightBlue.shade50,
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CustomPaint(
                    size: Size.infinite,
                    painter: GeoMapPainter(
                      projection: _selectedProjection,
                      rotation: _rotation,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Simple world outline with graticule grid',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}

class GeoMapPainter extends CustomPainter {
  final String projection;
  final double rotation;

  GeoMapPainter({required this.projection, required this.rotation});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Point(size.width / 2, size.height / 2);
    final scale = size.width / 6;

    // Create projection
    Projection proj;
    switch (projection) {
      case 'Equirectangular':
        proj = geoEquirectangular(
          center: (0, 0),
          scale: scale,
          translate: center,
        );
        break;
      case 'Orthographic':
        proj = geoOrthographic(
          center: (0, 0),
          scale: scale * 1.5,
          translate: center,
          rotate: (rotation, 0, 0),
        );
        break;
      case 'Mercator':
      default:
        proj = geoMercator(
          center: (0, 0),
          scale: scale,
          translate: center,
        );
        break;
    }

    // Draw graticule (lat/lon grid)
    final graticulePaint = Paint()
      ..color = Colors.blue.withOpacity(0.2)
      ..strokeWidth = 0.5
      ..style = PaintingStyle.stroke;

    // Latitude lines
    for (double lat = -80; lat <= 80; lat += 20) {
      final points = <Offset>[];
      for (double lon = -180; lon <= 180; lon += 5) {
        final p = proj.project(lon, lat);
        if (!p.hasNaN) {
          points.add(Offset(p.x, p.y));
        }
      }
      if (points.length > 1) {
        final path = Path();
        path.moveTo(points.first.dx, points.first.dy);
        for (int i = 1; i < points.length; i++) {
          path.lineTo(points[i].dx, points[i].dy);
        }
        canvas.drawPath(path, graticulePaint);
      }
    }

    // Longitude lines
    for (double lon = -180; lon <= 180; lon += 30) {
      final points = <Offset>[];
      for (double lat = -85; lat <= 85; lat += 5) {
        final p = proj.project(lon, lat);
        if (!p.hasNaN) {
          points.add(Offset(p.x, p.y));
        }
      }
      if (points.length > 1) {
        final path = Path();
        path.moveTo(points.first.dx, points.first.dy);
        for (int i = 1; i < points.length; i++) {
          path.lineTo(points[i].dx, points[i].dy);
        }
        canvas.drawPath(path, graticulePaint);
      }
    }

    // Draw world outline (simplified)
    final outlinePaint = Paint()
      ..color = Colors.green.shade700
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    // Simple box outline representing world
    final worldBounds = [
      [-180.0, -85.0],
      [180.0, -85.0],
      [180.0, 85.0],
      [-180.0, 85.0],
      [-180.0, -85.0],
    ];

    final worldPath = Path();
    var first = true;
    for (final coord in worldBounds) {
      final p = proj.project(coord[0], coord[1]);
      if (!p.hasNaN) {
        if (first) {
          worldPath.moveTo(p.x, p.y);
          first = false;
        } else {
          worldPath.lineTo(p.x, p.y);
        }
      }
    }
    canvas.drawPath(worldPath, outlinePaint);

    // Draw equator
    final equatorPaint = Paint()
      ..color = Colors.red.withOpacity(0.5)
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    final equatorPoints = <Offset>[];
    for (double lon = -180; lon <= 180; lon += 5) {
      final p = proj.project(lon, 0);
      if (!p.hasNaN) {
        equatorPoints.add(Offset(p.x, p.y));
      }
    }
    if (equatorPoints.length > 1) {
      final path = Path();
      path.moveTo(equatorPoints.first.dx, equatorPoints.first.dy);
      for (int i = 1; i < equatorPoints.length; i++) {
        path.lineTo(equatorPoints[i].dx, equatorPoints[i].dy);
      }
      canvas.drawPath(path, equatorPaint);
    }

    // Draw some sample cities as points
    final cities = [
      ('New York', -74.0, 40.7),
      ('London', -0.1, 51.5),
      ('Tokyo', 139.7, 35.7),
      ('Sydney', 151.2, -33.9),
      ('São Paulo', -46.6, -23.5),
    ];

    final cityPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;

    final textPainter = TextPainter(textDirection: TextDirection.ltr);

    for (final city in cities) {
      final p = proj.project(city.$2, city.$3);
      if (!p.hasNaN && p.x > 0 && p.x < size.width && p.y > 0 && p.y < size.height) {
        canvas.drawCircle(Offset(p.x, p.y), 4, cityPaint);

        textPainter.text = TextSpan(
          text: city.$1,
          style: const TextStyle(color: Colors.black87, fontSize: 10),
        );
        textPainter.layout();
        textPainter.paint(canvas, Offset(p.x + 6, p.y - 6));
      }
    }
  }

  @override
  bool shouldRepaint(GeoMapPainter oldDelegate) {
    return oldDelegate.projection != projection || oldDelegate.rotation != rotation;
  }
}
