import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:data_visualization/data_visualization.dart';

/// Interactive 3D globe with orthographic projection
class GeoGlobeExample extends StatefulWidget {
  const GeoGlobeExample({super.key});

  @override
  State<GeoGlobeExample> createState() => _GeoGlobeExampleState();
}

class _GeoGlobeExampleState extends State<GeoGlobeExample>
    with SingleTickerProviderStateMixin {
  GeoJsonFeatureCollection? _worldData;
  bool _loading = true;
  String? _error;

  double _rotationX = 0; // longitude rotation
  double _rotationY = 20; // latitude rotation (tilt)
  bool _autoRotate = true;
  late AnimationController _animationController;

  Offset? _lastPanPosition;

  @override
  void initState() {
    super.initState();
    _loadGeoJson();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 60),
    )..addListener(() {
        if (_autoRotate) {
          setState(() {
            _rotationX = (_animationController.value * 360) % 360;
          });
        }
      });
    _animationController.repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _loadGeoJson() async {
    try {
      final jsonString =
          await rootBundle.loadString('assets/world.geo.json');
      final jsonData = json.decode(jsonString) as Map<String, dynamic>;
      setState(() {
        _worldData = GeoJsonFeatureCollection.fromJson(jsonData);
        _loading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _loading = false;
      });
    }
  }

  void _handlePanStart(DragStartDetails details) {
    _lastPanPosition = details.localPosition;
    if (_autoRotate) {
      setState(() => _autoRotate = false);
    }
  }

  void _handlePanUpdate(DragUpdateDetails details) {
    if (_lastPanPosition == null) return;

    final delta = details.localPosition - _lastPanPosition!;
    setState(() {
      _rotationX = (_rotationX - delta.dx * 0.5) % 360;
      _rotationY = (_rotationY + delta.dy * 0.3).clamp(-90.0, 90.0);
    });
    _lastPanPosition = details.localPosition;
  }

  void _handlePanEnd(DragEndDetails details) {
    _lastPanPosition = null;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Interactive Globe',
                style: theme.textTheme.titleMedium,
              ),
              const SizedBox(width: 24),
              Row(
                children: [
                  Checkbox(
                    value: _autoRotate,
                    onChanged: (v) => setState(() => _autoRotate = v ?? true),
                  ),
                  const Text('Auto Rotate'),
                ],
              ),
              const Spacer(),
              Text(
                'Drag to rotate • Lon: ${_rotationX.toStringAsFixed(0)}° Lat: ${_rotationY.toStringAsFixed(0)}°',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  colors: [
                    const Color(0xFF1A237E),
                    const Color(0xFF000033),
                  ],
                  center: Alignment.center,
                  radius: 1.2,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: _buildGlobeContent(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGlobeContent() {
    if (_loading) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(color: Colors.white),
            SizedBox(height: 16),
            Text(
              'Loading globe...',
              style: TextStyle(color: Colors.white70),
            ),
          ],
        ),
      );
    }

    if (_error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 48, color: Colors.red.shade400),
            const SizedBox(height: 16),
            Text(
              'Error loading map: $_error',
              style: const TextStyle(color: Colors.white70),
            ),
          ],
        ),
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        return GestureDetector(
          onPanStart: _handlePanStart,
          onPanUpdate: _handlePanUpdate,
          onPanEnd: _handlePanEnd,
          child: CustomPaint(
            size: Size(constraints.maxWidth, constraints.maxHeight),
            painter: GlobePainter(
              worldData: _worldData!,
              rotationX: _rotationX,
              rotationY: _rotationY,
            ),
          ),
        );
      },
    );
  }
}

class GlobePainter extends CustomPainter {
  final GeoJsonFeatureCollection worldData;
  final double rotationX;
  final double rotationY;

  GlobePainter({
    required this.worldData,
    required this.rotationX,
    required this.rotationY,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Point(size.width / 2, size.height / 2);
    final radius = math.min(size.width, size.height) * 0.4;

    // Draw globe background with gradient
    final globeGradient = RadialGradient(
      colors: [
        const Color(0xFF4FC3F7),
        const Color(0xFF0288D1),
        const Color(0xFF01579B),
      ],
      stops: const [0.0, 0.7, 1.0],
      center: const Alignment(-0.3, -0.3),
    );

    canvas.drawCircle(
      Offset(center.x, center.y),
      radius,
      Paint()
        ..shader = globeGradient.createShader(
          Rect.fromCircle(center: Offset(center.x, center.y), radius: radius),
        ),
    );

    // Create orthographic projection
    final proj = geoOrthographic(
      center: (0, 0),
      scale: radius,
      translate: center,
      rotate: (-rotationX, -rotationY, 0),
    );

    final geoPathGenerator = GeoPath(proj);

    // Draw graticule
    _drawGraticule(canvas, proj, size, radius, center);

    // Draw land masses
    final landPaint = Paint()
      ..color = const Color(0xFF81C784)
      ..style = PaintingStyle.fill;

    final landBorderPaint = Paint()
      ..color = const Color(0xFF388E3C)
      ..strokeWidth = 0.5
      ..style = PaintingStyle.stroke;

    for (final feature in worldData.features) {
      final paths = geoPathGenerator.generate(feature);

      for (final pathPoints in paths) {
        if (pathPoints.length < 3) continue;

        // Check if any points are visible (not NaN)
        if (pathPoints.any((p) => p.hasNaN)) continue;

        final path = Path();
        path.moveTo(pathPoints.first.x, pathPoints.first.y);
        for (int i = 1; i < pathPoints.length; i++) {
          if (!pathPoints[i].hasNaN) {
            path.lineTo(pathPoints[i].x, pathPoints[i].y);
          }
        }
        path.close();

        canvas.drawPath(path, landPaint);
        canvas.drawPath(path, landBorderPaint);
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

    // Draw atmosphere glow
    final atmospherePaint = Paint()
      ..shader = RadialGradient(
        colors: [
          Colors.transparent,
          const Color(0xFF64B5F6).withAlpha(30),
          const Color(0xFF64B5F6).withAlpha(60),
        ],
        stops: const [0.85, 0.95, 1.0],
      ).createShader(
        Rect.fromCircle(
          center: Offset(center.x, center.y),
          radius: radius * 1.1,
        ),
      )
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
      Offset(center.x, center.y),
      radius * 1.1,
      atmospherePaint,
    );
  }

  void _drawGraticule(
    Canvas canvas,
    Projection proj,
    Size size,
    double radius,
    Point center,
  ) {
    final graticulePaint = Paint()
      ..color = const Color(0xFF64B5F6).withAlpha(60)
      ..strokeWidth = 0.5
      ..style = PaintingStyle.stroke;

    // Latitude lines
    for (double lat = -80; lat <= 80; lat += 20) {
      final points = <Offset>[];
      for (double lon = -180; lon <= 180; lon += 5) {
        final p = proj.project(lon, lat);
        if (!p.hasNaN) {
          final dist = math.sqrt(
            math.pow(p.x - center.x, 2) + math.pow(p.y - center.y, 2),
          );
          if (dist <= radius * 1.01) {
            points.add(Offset(p.x, p.y));
          }
        }
      }
      if (points.length > 1) {
        final path = Path()..moveTo(points.first.dx, points.first.dy);
        for (int i = 1; i < points.length; i++) {
          // Check for discontinuity
          final dist = (points[i] - points[i - 1]).distance;
          if (dist < radius * 0.5) {
            path.lineTo(points[i].dx, points[i].dy);
          } else {
            path.moveTo(points[i].dx, points[i].dy);
          }
        }
        canvas.drawPath(path, graticulePaint);
      }
    }

    // Longitude lines
    for (double lon = -180; lon < 180; lon += 30) {
      final points = <Offset>[];
      for (double lat = -90; lat <= 90; lat += 5) {
        final p = proj.project(lon, lat);
        if (!p.hasNaN) {
          final dist = math.sqrt(
            math.pow(p.x - center.x, 2) + math.pow(p.y - center.y, 2),
          );
          if (dist <= radius * 1.01) {
            points.add(Offset(p.x, p.y));
          }
        }
      }
      if (points.length > 1) {
        final path = Path()..moveTo(points.first.dx, points.first.dy);
        for (int i = 1; i < points.length; i++) {
          final dist = (points[i] - points[i - 1]).distance;
          if (dist < radius * 0.5) {
            path.lineTo(points[i].dx, points[i].dy);
          } else {
            path.moveTo(points[i].dx, points[i].dy);
          }
        }
        canvas.drawPath(path, graticulePaint);
      }
    }

    // Draw equator
    final equatorPaint = Paint()
      ..color = const Color(0xFFFFEB3B).withAlpha(150)
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke;

    final equatorPoints = <Offset>[];
    for (double lon = -180; lon <= 180; lon += 3) {
      final p = proj.project(lon, 0);
      if (!p.hasNaN) {
        final dist = math.sqrt(
          math.pow(p.x - center.x, 2) + math.pow(p.y - center.y, 2),
        );
        if (dist <= radius * 1.01) {
          equatorPoints.add(Offset(p.x, p.y));
        }
      }
    }
    if (equatorPoints.length > 1) {
      final path = Path()..moveTo(equatorPoints.first.dx, equatorPoints.first.dy);
      for (int i = 1; i < equatorPoints.length; i++) {
        final dist = (equatorPoints[i] - equatorPoints[i - 1]).distance;
        if (dist < radius * 0.5) {
          path.lineTo(equatorPoints[i].dx, equatorPoints[i].dy);
        } else {
          path.moveTo(equatorPoints[i].dx, equatorPoints[i].dy);
        }
      }
      canvas.drawPath(path, equatorPaint);
    }
  }

  @override
  bool shouldRepaint(GlobePainter old) =>
      old.rotationX != rotationX || old.rotationY != rotationY;
}
