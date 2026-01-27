// Generated from: assets/africa/gambia.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:dv_geo_core/dv_geo_core.dart';
import 'package:dv_point/dv_point.dart';
import 'package:dv_map/src/map_widget.dart';

/// Gzipped GeoJSON data for africa/gambia.10m.json (base64 encoded)
const String _kCompressedData = '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';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for africa/gambia.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get africaGambia10m {
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

/// Widget for rendering the africa/gambia.10m.json map.
///
/// This widget provides a convenient way to render this specific map
/// with customizable projection and styling.
///
/// Example:
/// ```dart
/// AfricaGambia10mWidget(
///   projection: MercatorProjection(),
///   fillColor: Color(0xFFE0E0E0),
///   strokeColor: Color(0xFF333333),
///   onFeatureTap: (feature, position) {
///     print('Tapped: ${feature.properties}');
///   },
/// )
/// ```
class AfricaGambia10mWidget extends StatelessWidget {
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

  /// Creates a AfricaGambia10mWidget.
  const AfricaGambia10mWidget({
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
      geoJson: africaGambia10m,
      projection: projection,
      fillColor: fillColor,
      strokeColor: strokeColor,
      strokeWidth: strokeWidth,
      onFeatureTap: onFeatureTap,
      antiAlias: antiAlias,
    );
  }
}
