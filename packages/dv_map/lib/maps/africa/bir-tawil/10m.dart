// Generated from: assets/africa/bir-tawil.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:dv_geo_core/dv_geo_core.dart';
import 'package:dv_point/dv_point.dart';
import 'package:dv_map/src/map_widget.dart';

/// Gzipped GeoJSON data for africa/bir-tawil.10m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE62Ty2rDMBBF9/4KoXVq9BqNJru20HUX3ZVQTKoGgWMFR6WEkH8vcR7koVIU4oUY+2gOd2x5XTHG02rh+ZjxF9+k794/x7b10xRix0db/LV7vORj9l4xxth6WK8bh+0DWPRx4fsUhqbDdsZ418yHhqfQs7fmJ7THFsZ4WMaPRm3xA9EV0BkwjV0Kne/Slj1+9WHa8D3dHLPMfJz71K/Okxyiv8Z2NdtPerTG/jN0TToZeXed1pd3jGldSyelBju6IErWRGAEwRmYjP7zaaGtkzmd0EIpVagzmgAx53NCgCUq9AE4Y1RGh1IQoCnUoURlNeZ8WpCxttDnrDVgIeczhKo0HhFJibmPixY1KCzymVo4I5HMH4cFTFk+Uwu0UqG+k0/XDhAF5F7fbT6rQIDLHZfbfJqUBrrfvIU/b5WrD9WmOqyTalP9AumnM95mBQAA';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for africa/bir-tawil.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get africaBirTawil10m {
  if (_cached != null) return _cached!;

  // Decode base64 and decompress
  final compressed = base64Decode(_kCompressedData);
  final decompressed = gzip.decode(compressed);
  final jsonString = utf8.decode(decompressed);

  // Parse GeoJSON
  final data = parseGeoJson(
    jsonDecode(jsonString) as Map<String, dynamic>,
  );

  if (data is! GeoJsonFeatureCollection) {
    throw StateError('Invalid GeoJSON format');
  }

  _cached = data;
  return _cached!;
}

/// Widget for rendering the africa/bir-tawil.10m.json map.
///
/// This widget provides a convenient way to render this specific map
/// with customizable projection and styling.
///
/// Example:
/// ```dart
/// BirTawil10mWidget(
///   projection: MercatorProjection(),
///   fillColor: Color(0xFFE0E0E0),
///   strokeColor: Color(0xFF333333),
///   onFeatureTap: (feature, position) {
///     print('Tapped: ${feature.properties}');
///   },
/// )
/// ```
class BirTawil10mWidget extends StatelessWidget {
  /// The projection to use for rendering.
  final Projection projection;

  /// The color to use for filling shapes.
  final Color? fillColor;

  /// The color to use for stroking shapes.
  final Color? strokeColor;

  /// The stroke width for shape outlines.
  final double strokeWidth;

  /// Optional callback when a feature is tapped.
  final void Function(GeoJsonFeature feature, Point position)? onFeatureTap;

  /// Whether to enable anti-aliasing.
  final bool antiAlias;

  /// Creates a BirTawil10mWidget.
  const BirTawil10mWidget({
    super.key,
    required this.projection,
    this.fillColor,
    this.strokeColor,
    this.strokeWidth = 1.0,
    this.onFeatureTap,
    this.antiAlias = true,
  });

  @override
  Widget build(BuildContext context) {
    return MapWidget(
      geoJson: africaBirTawil10m,
      projection: projection,
      fillColor: fillColor,
      strokeColor: strokeColor,
      strokeWidth: strokeWidth,
      onFeatureTap: onFeatureTap,
      antiAlias: antiAlias,
    );
  }
}
