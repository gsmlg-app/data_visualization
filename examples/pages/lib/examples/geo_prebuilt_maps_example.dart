import 'package:flutter/material.dart';
import 'package:data_visualization/data_visualization.dart';

class GeoPrebuiltMapsExample extends StatefulWidget {
  const GeoPrebuiltMapsExample({super.key});

  @override
  State<GeoPrebuiltMapsExample> createState() => _GeoPrebuiltMapsExampleState();
}

class _GeoPrebuiltMapsExampleState extends State<GeoPrebuiltMapsExample> {
  MapScale _scale = MapScale.m110;
  String _projection = 'Mercator';
  double _rotation = 0;

  GeoJsonFeatureCollection? _mapData;
  bool _loading = true;
  String? _error;

  final List<String> _projections = ['Mercator', 'Equirectangular', 'Orthographic'];

  List<MapCountryEntry> _countries = [];
  final Map<String, MapCountryEntry> _entryById = {};
  String _selectionId = 'world';

  @override
  void initState() {
    super.initState();
    _loadIndexAndWorld();
  }

  Future<void> _loadIndexAndWorld() async {
    setState(() {
      _loading = true;
      _error = null;
      _selectionId = 'world';
    });

    try {
      final index = await DvMapIndex.load(_scale);
      _countries = index.countries;
      _entryById
        ..clear()
        ..addEntries(
          _countries.map((e) => MapEntry(e.asset, e)),
        );

      final world = await DvMapLoader.loadWorld(_scale);
      setState(() {
        _mapData = world;
        _loading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _loading = false;
      });
    }
  }

  Future<void> _loadSelection(String selectionId) async {
    setState(() {
      _loading = true;
      _error = null;
      _selectionId = selectionId;
    });

    try {
      GeoJsonFeatureCollection data;
      if (selectionId == 'world') {
        data = await DvMapLoader.loadWorld(_scale);
      } else {
        final entry = _entryById[selectionId];
        if (entry == null) {
          throw StateError('Unknown map selection: $selectionId');
        }
        data = await DvMapLoader.loadCountryBySlug(
          scale: _scale,
          continentSlug: entry.continentSlug,
          countrySlug: entry.countrySlug,
        );
      }
      setState(() {
        _mapData = data;
        _loading = false;
      });
    } catch (e) {
      setState(() {
        _error = e.toString();
        _loading = false;
      });
    }
  }

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
              _buildScaleSelector(),
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
        ],
      ),
    );
  }

  Widget _buildScaleSelector() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('Scale:'),
        const SizedBox(width: 8),
        DropdownButton<MapScale>(
          value: _scale,
          items: const [
            DropdownMenuItem(value: MapScale.m110, child: Text('110m')),
            DropdownMenuItem(value: MapScale.m50, child: Text('50m')),
            DropdownMenuItem(value: MapScale.m10, child: Text('10m')),
          ],
          onChanged: (value) {
            if (value == null || value == _scale) return;
            setState(() {
              _scale = value;
            });
            _loadIndexAndWorld();
          },
        ),
      ],
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
    final values = <String>{'world', ..._countries.map((e) => e.asset)};
    final effectiveValue = values.contains(_selectionId) ? _selectionId : 'world';
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('Map:'),
        const SizedBox(width: 8),
        DropdownButton<String>(
          value: effectiveValue,
          items: [
            const DropdownMenuItem(
              value: 'world',
              child: Text('World (all countries)'),
            ),
            ..._countries.map((entry) {
              final label = '${entry.name} · ${entry.continent}';
              return DropdownMenuItem(
                value: entry.asset,
                child: Text(label),
              );
            }),
          ],
          onChanged: (value) {
            if (value == null || value == _selectionId) return;
            _loadSelection(value);
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
    if (_loading) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 16),
            Text('Loading map...'),
          ],
        ),
      );
    }

    if (_error != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 48, color: Colors.redAccent),
            const SizedBox(height: 16),
            Text('Error loading map: $_error'),
          ],
        ),
      );
    }

    if (_mapData == null) {
      return const Center(child: Text('No map data loaded.'));
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        return CustomPaint(
          size: Size(constraints.maxWidth, constraints.maxHeight),
          painter: GeoMapPainter(
            projection: _projection,
            rotation: _rotation,
            mapData: _mapData!,
          ),
        );
      },
    );
  }
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
        proj = geoEquirectangular(center: (0, 0), scale: scale, translate: center);
        break;
      case 'Orthographic':
        proj = geoOrthographic(
          center: (0, 0),
          scale: scale * 1.2,
          translate: center,
          rotate: (rotation, 0, 0),
        );
        break;
      default:
        proj = geoMercator(center: (0, 0), scale: scale, translate: center);
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
