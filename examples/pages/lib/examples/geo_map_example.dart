import 'package:flutter/material.dart';
import 'package:data_visualization/data_visualization.dart';

class GeoMapExample extends StatefulWidget {
  const GeoMapExample({super.key});

  @override
  State<GeoMapExample> createState() => _GeoMapExampleState();
}

class _GeoMapExampleState extends State<GeoMapExample> {
  String _projection = 'Mercator';
  double _rotation = 0;

  final projections = ['Mercator', 'Equirectangular', 'Orthographic'];

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
                color: Colors.lightBlue.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CustomPaint(
                  size: Size.infinite,
                  painter: GeoMapPainter(
                    projection: _projection,
                    rotation: _rotation,
                  ),
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

  GeoMapPainter({required this.projection, required this.rotation});

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

    // Draw graticule
    final graticulePaint = Paint()
      ..color = Colors.blue.withAlpha(50)
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
      ..color = Colors.red.withAlpha(128)
      ..strokeWidth = 1
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
        canvas.drawCircle(Offset(p.x, p.y), 5, Paint()..color = Colors.red);

        textPainter.text = TextSpan(
          text: city.$1,
          style: const TextStyle(color: Colors.black87, fontSize: 11),
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
