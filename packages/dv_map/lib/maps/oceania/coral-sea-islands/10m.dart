// Generated from: assets/oceania/coral-sea-islands.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:dv_geo_core/dv_geo_core.dart';
import 'package:dv_point/dv_point.dart';
import 'package:dv_map/src/map_widget.dart';

/// Gzipped GeoJSON data for oceania/coral-sea-islands.10m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE62PT2vDMAzF7/4Uwue0xE6axL0WBjt1sOMow6RaMbhWcNxDKPnuI24T+ic7jM0HIfmn99A7MwAeugb5GvgL6nDyuCFrsQ6GHE8G/HX5bvkaPhgAwDnWZ2Fcj6Dx1KAPJorGdQDu9DEKNuS1hXfU8Npa7fbtJAXgpqVPLYe1hVJPIJsBNblgHLowsG2N2hnNr7ifjjogHTH47v6kMcMb2e5wjTzZkt8bp8NN9su77R8nALHKl5kSsirK5AEtpFimWZrmmbwju+RPjrIqcyF+7VhVK6F+cFRpUZT/eeNcajbXj13PxrpjPfsGhpT7mKoCAAA=';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for oceania/coral-sea-islands.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get oceaniaCoralSeaIslands10m {
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

/// Widget for rendering the oceania/coral-sea-islands.10m.json map.
///
/// This widget provides a convenient way to render this specific map
/// with customizable projection and styling.
///
/// Example:
/// ```dart
/// OceaniaCoralSeaIslands10mWidget(
///   projection: MercatorProjection(),
///   fillColor: Color(0xFFE0E0E0),
///   strokeColor: Color(0xFF333333),
///   onFeatureTap: (feature, position) {
///     print('Tapped: ${feature.properties}');
///   },
/// )
/// ```
class OceaniaCoralSeaIslands10mWidget extends StatelessWidget {
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

  /// Creates a OceaniaCoralSeaIslands10mWidget.
  const OceaniaCoralSeaIslands10mWidget({
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
      geoJson: oceaniaCoralSeaIslands10m,
      projection: projection,
      fillColor: fillColor,
      strokeColor: strokeColor,
      strokeWidth: strokeWidth,
      onFeatureTap: onFeatureTap,
      antiAlias: antiAlias,
    );
  }
}
