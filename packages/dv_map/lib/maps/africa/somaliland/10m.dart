// Generated from: assets/africa/somaliland.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:dv_geo_core/dv_geo_core.dart';
import 'package:dv_point/dv_point.dart';
import 'package:dv_map/src/map_widget.dart';

/// Gzipped GeoJSON data for africa/somaliland.10m.json (base64 encoded)
const String _kCompressedData = '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';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for africa/somaliland.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get africaSomaliland10m {
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

/// Widget for rendering the africa/somaliland.10m.json map.
///
/// This widget provides a convenient way to render this specific map
/// with customizable projection and styling.
///
/// Example:
/// ```dart
/// Somaliland10mWidget(
///   projection: MercatorProjection(),
///   fillColor: Color(0xFFE0E0E0),
///   strokeColor: Color(0xFF333333),
///   onFeatureTap: (feature, position) {
///     print('Tapped: ${feature.properties}');
///   },
/// )
/// ```
class Somaliland10mWidget extends StatelessWidget {
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

  /// Creates a Somaliland10mWidget.
  const Somaliland10mWidget({
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
      geoJson: africaSomaliland10m,
      projection: projection,
      fillColor: fillColor,
      strokeColor: strokeColor,
      strokeWidth: strokeWidth,
      onFeatureTap: onFeatureTap,
      antiAlias: antiAlias,
    );
  }
}
