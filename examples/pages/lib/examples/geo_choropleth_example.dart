import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:data_visualization/data_visualization.dart';

/// Choropleth map showing population density by country
class GeoChoroplethExample extends StatefulWidget {
  const GeoChoroplethExample({super.key});

  @override
  State<GeoChoroplethExample> createState() => _GeoChoroplethExampleState();
}

class _GeoChoroplethExampleState extends State<GeoChoroplethExample> {
  GeoJsonFeatureCollection? _worldData;
  bool _loading = true;
  String? _error;
  String? _hoveredCountry;
  String _colorScheme = 'Blues';

  final colorSchemes = ['Blues', 'Greens', 'Reds', 'Purples', 'Oranges'];

  // Simulated population density data (people per sq km)
  final Map<String, double> _densityData = {
    'China': 153,
    'India': 464,
    'United States of America': 36,
    'Indonesia': 151,
    'Pakistan': 287,
    'Brazil': 25,
    'Nigeria': 226,
    'Bangladesh': 1265,
    'Russia': 9,
    'Mexico': 66,
    'Japan': 347,
    'Ethiopia': 115,
    'Philippines': 368,
    'Egypt': 103,
    'Vietnam': 314,
    'Germany': 240,
    'Turkey': 110,
    'Iran': 52,
    'Thailand': 137,
    'United Kingdom': 281,
    'France': 119,
    'Italy': 206,
    'South Africa': 49,
    'Tanzania': 67,
    'Myanmar': 83,
    'Kenya': 94,
    'South Korea': 527,
    'Colombia': 46,
    'Spain': 94,
    'Argentina': 17,
    'Uganda': 229,
    'Algeria': 18,
    'Sudan': 25,
    'Ukraine': 75,
    'Iraq': 93,
    'Afghanistan': 60,
    'Poland': 124,
    'Canada': 4,
    'Morocco': 83,
    'Saudi Arabia': 16,
    'Uzbekistan': 79,
    'Peru': 26,
    'Angola': 26,
    'Malaysia': 99,
    'Mozambique': 40,
    'Ghana': 137,
    'Yemen': 56,
    'Nepal': 203,
    'Venezuela': 32,
    'Madagascar': 48,
    'Cameroon': 56,
    'Australia': 3,
  };

  @override
  void initState() {
    super.initState();
    _loadGeoJson();
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

  Color _getColorForDensity(double? density) {
    if (density == null) return Colors.grey.shade300;

    // Log scale for better distribution
    final logDensity = density > 0 ? math.log(density + 1) : 0;
    final maxLog = math.log(1300); // Max density ~1265
    final t = (logDensity / maxLog).clamp(0.0, 1.0);

    switch (_colorScheme) {
      case 'Blues':
        return Color.lerp(
          const Color(0xFFE3F2FD),
          const Color(0xFF0D47A1),
          t,
        )!;
      case 'Greens':
        return Color.lerp(
          const Color(0xFFE8F5E9),
          const Color(0xFF1B5E20),
          t,
        )!;
      case 'Reds':
        return Color.lerp(
          const Color(0xFFFFEBEE),
          const Color(0xFFB71C1C),
          t,
        )!;
      case 'Purples':
        return Color.lerp(
          const Color(0xFFF3E5F5),
          const Color(0xFF4A148C),
          t,
        )!;
      case 'Oranges':
        return Color.lerp(
          const Color(0xFFFFF3E0),
          const Color(0xFFE65100),
          t,
        )!;
      default:
        return Color.lerp(
          const Color(0xFFE3F2FD),
          const Color(0xFF0D47A1),
          t,
        )!;
    }
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
              const Text('Color Scheme: '),
              const SizedBox(width: 8),
              DropdownButton<String>(
                value: _colorScheme,
                items: colorSchemes.map((s) {
                  return DropdownMenuItem(value: s, child: Text(s));
                }).toList(),
                onChanged: (v) => setState(() => _colorScheme = v!),
              ),
              const Spacer(),
              if (_hoveredCountry != null)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '$_hoveredCountry: ${_densityData[_hoveredCountry]?.toStringAsFixed(0) ?? "N/A"} /km²',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFE3F2FD),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: _buildMapContent(),
              ),
            ),
          ),
          const SizedBox(height: 16),
          _buildLegend(theme),
        ],
      ),
    );
  }

  Widget _buildLegend(ThemeData theme) {
    final stops = [0, 10, 50, 100, 250, 500, 1000];
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Population Density (people/km²): ',
          style: theme.textTheme.bodySmall,
        ),
        const SizedBox(width: 8),
        ...stops.map((value) {
          return Row(
            children: [
              Container(
                width: 24,
                height: 16,
                color: _getColorForDensity(value.toDouble()),
              ),
              const SizedBox(width: 4),
              Text(
                '$value',
                style: theme.textTheme.bodySmall,
              ),
              const SizedBox(width: 8),
            ],
          );
        }),
      ],
    );
  }

  Widget _buildMapContent() {
    if (_loading) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Loading world map...'),
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
            Text('Error loading map: $_error'),
          ],
        ),
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        return MouseRegion(
          onExit: (_) => setState(() => _hoveredCountry = null),
          child: CustomPaint(
            size: Size(constraints.maxWidth, constraints.maxHeight),
            painter: ChoroplethPainter(
              worldData: _worldData!,
              densityData: _densityData,
              getColorForDensity: _getColorForDensity,
              hoveredCountry: _hoveredCountry,
              onHover: (country) {
                if (country != _hoveredCountry) {
                  setState(() => _hoveredCountry = country);
                }
              },
            ),
          ),
        );
      },
    );
  }
}

class ChoroplethPainter extends CustomPainter {
  final GeoJsonFeatureCollection worldData;
  final Map<String, double> densityData;
  final Color Function(double?) getColorForDensity;
  final String? hoveredCountry;
  final void Function(String?) onHover;

  ChoroplethPainter({
    required this.worldData,
    required this.densityData,
    required this.getColorForDensity,
    required this.hoveredCountry,
    required this.onHover,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Point(size.width / 2, size.height / 2);
    final scale = size.width / 6.5;

    final proj = geoMercator(
      center: (0, 20),
      scale: scale,
      translate: center,
    );

    final geoPathGenerator = GeoPath(proj);

    // Draw each country
    for (final feature in worldData.features) {
      final name = feature.properties?['name'] as String?;
      final density = densityData[name];
      final color = getColorForDensity(density);
      final isHovered = name == hoveredCountry;

      final paths = geoPathGenerator.generate(feature);

      final fillPaint = Paint()
        ..color = isHovered ? color.withAlpha(220) : color
        ..style = PaintingStyle.fill;

      final strokePaint = Paint()
        ..color = isHovered ? Colors.black87 : Colors.grey.shade600
        ..strokeWidth = isHovered ? 1.5 : 0.5
        ..style = PaintingStyle.stroke;

      for (final pathPoints in paths) {
        if (pathPoints.length < 3) continue;

        final path = Path();
        path.moveTo(pathPoints.first.x, pathPoints.first.y);
        for (int i = 1; i < pathPoints.length; i++) {
          path.lineTo(pathPoints[i].x, pathPoints[i].y);
        }
        path.close();

        canvas.drawPath(path, fillPaint);
        canvas.drawPath(path, strokePaint);
      }
    }
  }

  @override
  bool shouldRepaint(ChoroplethPainter old) =>
      old.hoveredCountry != hoveredCountry;
}
