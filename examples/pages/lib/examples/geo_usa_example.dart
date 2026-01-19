import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:data_visualization/data_visualization.dart';

/// USA map with Albers projection showing state population density
class GeoUsaExample extends StatefulWidget {
  const GeoUsaExample({super.key});

  @override
  State<GeoUsaExample> createState() => _GeoUsaExampleState();
}

class _GeoUsaExampleState extends State<GeoUsaExample> {
  GeoJsonFeatureCollection? _usaData;
  bool _loading = true;
  String? _error;
  String? _selectedState;
  bool _showLabels = true;

  @override
  void initState() {
    super.initState();
    _loadGeoJson();
  }

  Future<void> _loadGeoJson() async {
    try {
      final jsonString =
          await rootBundle.loadString('assets/us-states.geo.json');
      final jsonData = json.decode(jsonString) as Map<String, dynamic>;
      setState(() {
        _usaData = GeoJsonFeatureCollection.fromJson(jsonData);
        _loading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _loading = false;
      });
    }
  }

  Color _getColorForDensity(double density) {
    // Color scale based on population density
    if (density < 20) return const Color(0xFFE8F5E9);
    if (density < 50) return const Color(0xFFC8E6C9);
    if (density < 100) return const Color(0xFFA5D6A7);
    if (density < 200) return const Color(0xFF81C784);
    if (density < 500) return const Color(0xFF66BB6A);
    if (density < 1000) return const Color(0xFF4CAF50);
    return const Color(0xFF2E7D32);
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
                'US Population Density by State',
                style: theme.textTheme.titleMedium,
              ),
              const SizedBox(width: 16),
              Row(
                children: [
                  Checkbox(
                    value: _showLabels,
                    onChanged: (v) => setState(() => _showLabels = v ?? true),
                  ),
                  const Text('Show Labels'),
                ],
              ),
              const Spacer(),
              if (_selectedState != null)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    _selectedState!,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: theme.colorScheme.onPrimaryContainer,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFFAFAFA),
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
    final stops = [
      (0, '<20'),
      (20, '20-50'),
      (50, '50-100'),
      (100, '100-200'),
      (200, '200-500'),
      (500, '500-1000'),
      (1000, '>1000'),
    ];
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Density (people/mi²): ',
          style: theme.textTheme.bodySmall,
        ),
        const SizedBox(width: 8),
        ...stops.map((stop) {
          return Row(
            children: [
              Container(
                width: 20,
                height: 14,
                decoration: BoxDecoration(
                  color: _getColorForDensity(stop.$1.toDouble()),
                  border: Border.all(color: Colors.grey.shade400, width: 0.5),
                ),
              ),
              const SizedBox(width: 4),
              Text(
                stop.$2,
                style: theme.textTheme.bodySmall?.copyWith(fontSize: 10),
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
            Text('Loading USA map...'),
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
        return GestureDetector(
          onTapUp: (details) {
            // Hit test for state selection
            _handleTap(details.localPosition, constraints);
          },
          child: CustomPaint(
            size: Size(constraints.maxWidth, constraints.maxHeight),
            painter: UsaMapPainter(
              usaData: _usaData!,
              selectedState: _selectedState,
              showLabels: _showLabels,
              getColorForDensity: _getColorForDensity,
            ),
          ),
        );
      },
    );
  }

  void _handleTap(Offset position, BoxConstraints constraints) {
    final size = Size(constraints.maxWidth, constraints.maxHeight);
    final center = Point(size.width / 2, size.height / 2);
    final scale = size.width / 1.3;

    final proj = geoAlbers(
      center: (-96, 38),
      scale: scale,
      translate: center,
      parallels0: 29.5,
      parallels1: 45.5,
    );

    final geoPathGenerator = GeoPath(proj);

    for (final feature in _usaData!.features) {
      final paths = geoPathGenerator.generate(feature);
      for (final pathPoints in paths) {
        if (pathPoints.length < 3) continue;

        final path = Path();
        path.moveTo(pathPoints.first.x, pathPoints.first.y);
        for (int i = 1; i < pathPoints.length; i++) {
          path.lineTo(pathPoints[i].x, pathPoints[i].y);
        }
        path.close();

        if (path.contains(position)) {
          final name = feature.properties?['name'] as String?;
          final density = feature.properties?['density'];
          setState(() {
            _selectedState = name != null && density != null
                ? '$name: ${density.toStringAsFixed(1)} /mi²'
                : name;
          });
          return;
        }
      }
    }
    setState(() => _selectedState = null);
  }
}

class UsaMapPainter extends CustomPainter {
  final GeoJsonFeatureCollection usaData;
  final String? selectedState;
  final bool showLabels;
  final Color Function(double) getColorForDensity;

  UsaMapPainter({
    required this.usaData,
    required this.selectedState,
    required this.showLabels,
    required this.getColorForDensity,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Point(size.width / 2, size.height / 2);
    final scale = size.width / 1.3;

    final proj = geoAlbers(
      center: (-96, 38),
      scale: scale,
      translate: center,
      parallels0: 29.5,
      parallels1: 45.5,
    );

    final geoPathGenerator = GeoPath(proj);
    final textPainter = TextPainter(textDirection: TextDirection.ltr);

    // Draw each state
    for (final feature in usaData.features) {
      final name = feature.properties?['name'] as String?;
      final density = (feature.properties?['density'] as num?)?.toDouble() ?? 0;
      final isSelected = selectedState?.startsWith(name ?? '') ?? false;

      final paths = geoPathGenerator.generate(feature);
      final color = getColorForDensity(density);

      final fillPaint = Paint()
        ..color = isSelected ? color.withAlpha(200) : color
        ..style = PaintingStyle.fill;

      final strokePaint = Paint()
        ..color = isSelected ? Colors.blue.shade900 : Colors.grey.shade600
        ..strokeWidth = isSelected ? 2.0 : 0.5
        ..style = PaintingStyle.stroke;

      double totalX = 0, totalY = 0;
      int pointCount = 0;

      for (final pathPoints in paths) {
        if (pathPoints.length < 3) continue;

        final path = Path();
        path.moveTo(pathPoints.first.x, pathPoints.first.y);
        for (int i = 1; i < pathPoints.length; i++) {
          path.lineTo(pathPoints[i].x, pathPoints[i].y);
          totalX += pathPoints[i].x;
          totalY += pathPoints[i].y;
          pointCount++;
        }
        path.close();

        canvas.drawPath(path, fillPaint);
        canvas.drawPath(path, strokePaint);
      }

      // Draw state abbreviation label
      if (showLabels && name != null && pointCount > 0) {
        final abbrev = _getStateAbbreviation(name);
        if (abbrev != null) {
          final centerX = totalX / pointCount;
          final centerY = totalY / pointCount;

          textPainter.text = TextSpan(
            text: abbrev,
            style: TextStyle(
              color: _shouldUseLightText(density)
                  ? Colors.white
                  : Colors.grey.shade800,
              fontSize: 9,
              fontWeight: FontWeight.w600,
            ),
          );
          textPainter.layout();
          textPainter.paint(
            canvas,
            Offset(centerX - textPainter.width / 2,
                centerY - textPainter.height / 2),
          );
        }
      }
    }
  }

  bool _shouldUseLightText(double density) => density >= 200;

  String? _getStateAbbreviation(String name) {
    const abbrevs = {
      'Alabama': 'AL',
      'Alaska': 'AK',
      'Arizona': 'AZ',
      'Arkansas': 'AR',
      'California': 'CA',
      'Colorado': 'CO',
      'Connecticut': 'CT',
      'Delaware': 'DE',
      'Florida': 'FL',
      'Georgia': 'GA',
      'Hawaii': 'HI',
      'Idaho': 'ID',
      'Illinois': 'IL',
      'Indiana': 'IN',
      'Iowa': 'IA',
      'Kansas': 'KS',
      'Kentucky': 'KY',
      'Louisiana': 'LA',
      'Maine': 'ME',
      'Maryland': 'MD',
      'Massachusetts': 'MA',
      'Michigan': 'MI',
      'Minnesota': 'MN',
      'Mississippi': 'MS',
      'Missouri': 'MO',
      'Montana': 'MT',
      'Nebraska': 'NE',
      'Nevada': 'NV',
      'New Hampshire': 'NH',
      'New Jersey': 'NJ',
      'New Mexico': 'NM',
      'New York': 'NY',
      'North Carolina': 'NC',
      'North Dakota': 'ND',
      'Ohio': 'OH',
      'Oklahoma': 'OK',
      'Oregon': 'OR',
      'Pennsylvania': 'PA',
      'Rhode Island': 'RI',
      'South Carolina': 'SC',
      'South Dakota': 'SD',
      'Tennessee': 'TN',
      'Texas': 'TX',
      'Utah': 'UT',
      'Vermont': 'VT',
      'Virginia': 'VA',
      'Washington': 'WA',
      'West Virginia': 'WV',
      'Wisconsin': 'WI',
      'Wyoming': 'WY',
      'District of Columbia': 'DC',
      'Puerto Rico': 'PR',
    };
    return abbrevs[name];
  }

  @override
  bool shouldRepaint(UsaMapPainter old) =>
      old.selectedState != selectedState || old.showLabels != showLabels;
}
