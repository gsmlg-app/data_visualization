// Generated from: assets/oceania/cook-islands.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:dv_geo_core/dv_geo_core.dart';
import 'package:dv_point/dv_point.dart';
import 'package:dv_map/src/map_widget.dart';

/// Gzipped GeoJSON data for oceania/cook-islands.10m.json (base64 encoded)
const String _kCompressedData = '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';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for oceania/cook-islands.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get oceaniaCookIslands10m {
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

/// Widget for rendering the oceania/cook-islands.10m.json map.
///
/// This widget provides a convenient way to render this specific map
/// with customizable projection and styling.
///
/// Example:
/// ```dart
/// CookIslands10mWidget(
///   projection: MercatorProjection(),
///   fillColor: Color(0xFFE0E0E0),
///   strokeColor: Color(0xFF333333),
///   onFeatureTap: (feature, position) {
///     print('Tapped: ${feature.properties}');
///   },
/// )
/// ```
class CookIslands10mWidget extends StatelessWidget {
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

  /// Creates a CookIslands10mWidget.
  const CookIslands10mWidget({
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
      geoJson: oceaniaCookIslands10m,
      projection: projection,
      fillColor: fillColor,
      strokeColor: strokeColor,
      strokeWidth: strokeWidth,
      onFeatureTap: onFeatureTap,
      antiAlias: antiAlias,
    );
  }
}
