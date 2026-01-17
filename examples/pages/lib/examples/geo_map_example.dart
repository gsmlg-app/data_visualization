import 'package:flutter/material.dart';
import 'package:data_visualization/data_visualization.dart';

import 'world_data.dart';

class GeoMapExample extends StatefulWidget {
  const GeoMapExample({super.key});

  @override
  State<GeoMapExample> createState() => _GeoMapExampleState();
}

class _GeoMapExampleState extends State<GeoMapExample> {
  String _projection = 'Mercator';
  double _rotation = 0;

  final projections = ['Mercator', 'Equirectangular', 'Orthographic'];

  // Parse GeoJSON once
  late final GeoJsonFeatureCollection _worldData;

  @override
  void initState() {
    super.initState();
    _worldData = GeoJsonFeatureCollection.fromJson(worldLandGeoJson);
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
              const Text('Projection: '),
              const SizedBox(width: 8),
              DropdownButton<String>(
                value: _projection,
                items: projections.map((p) {
                  return DropdownMenuItem(value: p, child: Text(p));
                }).toList(),
                onChanged: (v) => setState(() => _projection = v!),
              ),
              if (_projection == 'Orthographic') ...[
                const SizedBox(width: 24),
                const Text('Rotation: '),
                Expanded(
                  child: Slider(
                    value: _rotation,
                    min: -180,
                    max: 180,
                    onChanged: (v) => setState(() => _rotation = v),
                  ),
                ),
              ],
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.lightBlue.shade100,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return CustomPaint(
                      size: Size(constraints.maxWidth, constraints.maxHeight),
                      painter: GeoMapPainter(
                        projection: _projection,
                        rotation: _rotation,
                        worldData: _worldData,
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

class GeoMapPainter extends CustomPainter {
  final String projection;
  final double rotation;
  final GeoJsonFeatureCollection worldData;

  GeoMapPainter({
    required this.projection,
    required this.rotation,
    required this.worldData,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Point(size.width / 2, size.height / 2);
    final scale = size.width / 6;

    Projection proj;
    switch (projection) {
      case 'Equirectangular':
        proj = geoEquirectangular(center: (0, 0), scale: scale, translate: center);
        break;
      case 'Orthographic':
        proj = geoOrthographic(
          center: (0, 0),
          scale: scale * 1.5,
          translate: center,
          rotate: (rotation, 0, 0),
        );
        break;
      default:
        proj = geoMercator(center: (0, 0), scale: scale, translate: center);
    }

    // Draw ocean background for orthographic
    if (projection == 'Orthographic') {
      canvas.drawCircle(
        Offset(center.x, center.y),
        scale * 1.5,
        Paint()..color = Colors.lightBlue.shade200,
      );
    }

    // Draw land masses
    final geoPathGenerator = GeoPath(proj);
    final landPaths = geoPathGenerator.generate(worldData);

    final landPaint = Paint()
      ..color = Colors.green.shade300
      ..style = PaintingStyle.fill;

    final landBorderPaint = Paint()
      ..color = Colors.green.shade700
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    for (final pathPoints in landPaths) {
      if (pathPoints.length < 3) continue;

      final path = Path();
      path.moveTo(pathPoints.first.x, pathPoints.first.y);
      for (int i = 1; i < pathPoints.length; i++) {
        path.lineTo(pathPoints[i].x, pathPoints[i].y);
      }
      path.close();

      canvas.drawPath(path, landPaint);
      canvas.drawPath(path, landBorderPaint);
    }

    // Draw graticule
    final graticulePaint = Paint()
      ..color = Colors.blue.shade300.withAlpha(100)
      ..strokeWidth = 0.5
      ..style = PaintingStyle.stroke;

    // Latitude lines
    for (double lat = -80; lat <= 80; lat += 20) {
      final points = <Offset>[];
      for (double lon = -180; lon <= 180; lon += 5) {
        final p = proj.project(lon, lat);
        if (!p.hasNaN) points.add(Offset(p.x, p.y));
      }
      if (points.length > 1) {
        final path = Path()..moveTo(points.first.dx, points.first.dy);
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
        if (!p.hasNaN) points.add(Offset(p.x, p.y));
      }
      if (points.length > 1) {
        final path = Path()..moveTo(points.first.dx, points.first.dy);
        for (int i = 1; i < points.length; i++) {
          path.lineTo(points[i].dx, points[i].dy);
        }
        canvas.drawPath(path, graticulePaint);
      }
    }

    // Draw equator
    final equatorPaint = Paint()
      ..color = Colors.red.withAlpha(150)
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    final equatorPoints = <Offset>[];
    for (double lon = -180; lon <= 180; lon += 5) {
      final p = proj.project(lon, 0);
      if (!p.hasNaN) equatorPoints.add(Offset(p.x, p.y));
    }
    if (equatorPoints.length > 1) {
      final path = Path()..moveTo(equatorPoints.first.dx, equatorPoints.first.dy);
      for (int i = 1; i < equatorPoints.length; i++) {
        path.lineTo(equatorPoints[i].dx, equatorPoints[i].dy);
      }
      canvas.drawPath(path, equatorPaint);
    }

    // Draw cities
    final cities = [
      ('New York', -74.0, 40.7),
      ('London', -0.1, 51.5),
      ('Tokyo', 139.7, 35.7),
      ('Sydney', 151.2, -33.9),
      ('São Paulo', -46.6, -23.5),
    ];

    final textPainter = TextPainter(textDirection: TextDirection.ltr);

    for (final city in cities) {
      final p = proj.project(city.$2, city.$3);
      if (!p.hasNaN && p.x > 0 && p.x < size.width && p.y > 0 && p.y < size.height) {
        // City marker shadow
        canvas.drawCircle(
          Offset(p.x, p.y),
          6,
          Paint()..color = Colors.black26,
        );
        // City marker
        canvas.drawCircle(
          Offset(p.x, p.y),
          5,
          Paint()..color = Colors.red.shade600,
        );
        canvas.drawCircle(
          Offset(p.x, p.y),
          2,
          Paint()..color = Colors.white,
        );

        textPainter.text = TextSpan(
          text: city.$1,
          style: TextStyle(
            color: Colors.grey.shade800,
            fontSize: 11,
            fontWeight: FontWeight.w500,
          ),
        );
        textPainter.layout();
        textPainter.paint(canvas, Offset(p.x + 8, p.y - 6));
      }
    }
  }

  @override
  bool shouldRepaint(GeoMapPainter old) =>
      old.projection != projection || old.rotation != rotation;
}
