import 'package:flutter/material.dart';
import 'package:data_visualization/data_visualization.dart';

// Import prebuilt maps - only these will be bundled
import 'package:dv_map/maps/world/110m.dart' as world_110m;
import 'package:dv_map/maps/world/50m.dart' as world_50m;
import 'package:dv_map/maps/africa/nigeria/110m.dart' as nigeria;
import 'package:dv_map/maps/asia/china/110m.dart' as china;
import 'package:dv_map/maps/asia/japan/110m.dart' as japan;
import 'package:dv_map/maps/europe/france/110m.dart' as france;
import 'package:dv_map/maps/north-america/united-states-of-america/110m.dart' as usa;
import 'package:dv_map/maps/south-america/brazil/110m.dart' as brazil;
import 'package:dv_map/maps/oceania/australia/110m.dart' as australia;

class GeoPrebuiltMapsExample extends StatefulWidget {
  const GeoPrebuiltMapsExample({super.key});

  @override
  State<GeoPrebuiltMapsExample> createState() =>
      _GeoPrebuiltMapsExampleState();
}

class _GeoPrebuiltMapsExampleState extends State<GeoPrebuiltMapsExample> {
  String _projection = 'Mercator';
  double _rotation = 0;

  final List<String> _projections = [
    'Mercator',
    'Equirectangular',
    'Orthographic'
  ];

  String _selectedMap = 'world_110m';

  // Map of available prebuilt maps
  final Map<String, MapData> _availableMaps = {
    'world_110m': MapData(
      'World (110m)',
      world_110m.world110m,
    ),
    'world_50m': MapData(
      'World (50m)',
      world_50m.world50m,
    ),
    'nigeria': MapData(
      'Nigeria',
      nigeria.africaNigeria110m,
    ),
    'china': MapData(
      'China',
      china.asiaChina110m,
    ),
    'japan': MapData(
      'Japan',
      japan.asiaJapan110m,
    ),
    'france': MapData(
      'France',
      france.europeFrance110m,
    ),
    'usa': MapData(
      'United States',
      usa.northAmericaUnitedStatesOfAmerica110m,
    ),
    'brazil': MapData(
      'Brazil',
      brazil.southAmericaBrazil110m,
    ),
    'australia': MapData(
      'Australia',
      australia.oceaniaAustralia110m,
    ),
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 16,
            runSpacing: 12,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              _buildProjectionSelector(),
              _buildMapSelector(),
              if (_projection == 'Orthographic') _buildRotationSlider(),
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
                child: _buildMapContent(),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Note: Only imported maps are bundled (tree-shakeable). '
            'This example imports 9 maps (~2 MB total).',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }

  Widget _buildProjectionSelector() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('Projection:'),
        const SizedBox(width: 8),
        DropdownButton<String>(
          value: _projection,
          items: _projections
              .map((p) => DropdownMenuItem(value: p, child: Text(p)))
              .toList(),
          onChanged: (value) {
            if (value == null) return;
            setState(() => _projection = value);
          },
        ),
      ],
    );
  }

  Widget _buildMapSelector() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('Map:'),
        const SizedBox(width: 8),
        DropdownButton<String>(
          value: _selectedMap,
          items: _availableMaps.entries.map((entry) {
            return DropdownMenuItem(
              value: entry.key,
              child: Text(entry.value.name),
            );
          }).toList(),
          onChanged: (value) {
            if (value == null) return;
            setState(() => _selectedMap = value);
          },
        ),
      ],
    );
  }

  Widget _buildRotationSlider() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('Rotation:'),
        const SizedBox(width: 8),
        SizedBox(
          width: 220,
          child: Slider(
            value: _rotation,
            min: -180,
            max: 180,
            onChanged: (value) => setState(() => _rotation = value),
          ),
        ),
      ],
    );
  }

  Widget _buildMapContent() {
    final mapData = _availableMaps[_selectedMap]?.data;
    if (mapData == null) {
      return const Center(child: Text('Map not found.'));
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        return CustomPaint(
          size: Size(constraints.maxWidth, constraints.maxHeight),
          painter: GeoMapPainter(
            projection: _projection,
            rotation: _rotation,
            mapData: mapData,
          ),
        );
      },
    );
  }
}

class MapData {
  final String name;
  final GeoJsonFeatureCollection data;

  MapData(this.name, this.data);
}

class GeoMapPainter extends CustomPainter {
  GeoMapPainter({
    required this.projection,
    required this.rotation,
    required this.mapData,
  });

  final String projection;
  final double rotation;
  final GeoJsonFeatureCollection mapData;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Point(size.width / 2, size.height / 2);
    final scale = size.shortestSide / 3.2;

    Projection proj;
    switch (projection) {
      case 'Equirectangular':
        proj = EquirectangularProjection(
          center: (0, 0),
          scale: scale,
          translate: center,
        );
        break;
      case 'Orthographic':
        proj = OrthographicProjection(
          center: (0, 0),
          scale: scale * 1.2,
          translate: center,
          rotate: (rotation, 0, 0),
        );
        break;
      default:
        proj = MercatorProjection(
          center: (0, 0),
          scale: scale,
          translate: center,
        );
    }

    if (projection == 'Orthographic') {
      canvas.drawCircle(
        Offset(center.x, center.y),
        scale * 1.2,
        Paint()..color = Colors.lightBlue.shade200,
      );
    }

    final geoPathGenerator = GeoPath(proj);
    final landPaths = geoPathGenerator.generate(mapData);

    final landPaint = Paint()
      ..color = Colors.green.shade300
      ..style = PaintingStyle.fill;

    final landBorderPaint = Paint()
      ..color = Colors.green.shade700
      ..strokeWidth = 0.6
      ..style = PaintingStyle.stroke;

    for (final pathPoints in landPaths) {
      if (pathPoints.length < 3) continue;

      final path = Path();
      path.moveTo(pathPoints.first.x, pathPoints.first.y);
      for (final p in pathPoints.skip(1)) {
        path.lineTo(p.x, p.y);
      }
      path.close();

      canvas.drawPath(path, landPaint);
      canvas.drawPath(path, landBorderPaint);
    }
  }

  @override
  bool shouldRepaint(covariant GeoMapPainter oldDelegate) {
    return projection != oldDelegate.projection ||
        rotation != oldDelegate.rotation ||
        mapData != oldDelegate.mapData;
  }
}
