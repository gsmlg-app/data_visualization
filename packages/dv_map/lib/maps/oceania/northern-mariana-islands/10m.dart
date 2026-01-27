// Generated from: assets/oceania/northern-mariana-islands.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:dv_geo_core/dv_geo_core.dart';
import 'package:dv_point/dv_point.dart';
import 'package:dv_map/src/map_widget.dart';

/// Gzipped GeoJSON data for oceania/northern-mariana-islands.10m.json (base64 encoded)
const String _kCompressedData = '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';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for oceania/northern-mariana-islands.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get oceaniaNorthernMarianaIslands10m {
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

/// Widget for rendering the oceania/northern-mariana-islands.10m.json map.
///
/// This widget provides a convenient way to render this specific map
/// with customizable projection and styling.
///
/// Example:
/// ```dart
/// NorthernMarianaIslands10mWidget(
///   projection: MercatorProjection(),
///   fillColor: Color(0xFFE0E0E0),
///   strokeColor: Color(0xFF333333),
///   onFeatureTap: (feature, position) {
///     print('Tapped: ${feature.properties}');
///   },
/// )
/// ```
class NorthernMarianaIslands10mWidget extends StatelessWidget {
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

  /// Creates a NorthernMarianaIslands10mWidget.
  const NorthernMarianaIslands10mWidget({
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
      geoJson: oceaniaNorthernMarianaIslands10m,
      projection: projection,
      fillColor: fillColor,
      strokeColor: strokeColor,
      strokeWidth: strokeWidth,
      onFeatureTap: onFeatureTap,
      antiAlias: antiAlias,
    );
  }
}
