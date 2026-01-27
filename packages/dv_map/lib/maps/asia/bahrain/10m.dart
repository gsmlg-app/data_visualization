// Generated from: assets/asia/bahrain.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:dv_geo_core/dv_geo_core.dart';
import 'package:dv_point/dv_point.dart';
import 'package:dv_map/src/map_widget.dart';

/// Gzipped GeoJSON data for asia/bahrain.10m.json (base64 encoded)
const String _kCompressedData = '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';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for asia/bahrain.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get asiaBahrain10m {
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

/// Widget for rendering the asia/bahrain.10m.json map.
///
/// This widget provides a convenient way to render this specific map
/// with customizable projection and styling.
///
/// Example:
/// ```dart
/// Bahrain10mWidget(
///   projection: MercatorProjection(),
///   fillColor: Color(0xFFE0E0E0),
///   strokeColor: Color(0xFF333333),
///   onFeatureTap: (feature, position) {
///     print('Tapped: ${feature.properties}');
///   },
/// )
/// ```
class Bahrain10mWidget extends StatelessWidget {
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

  /// Creates a Bahrain10mWidget.
  const Bahrain10mWidget({
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
      geoJson: asiaBahrain10m,
      projection: projection,
      fillColor: fillColor,
      strokeColor: strokeColor,
      strokeWidth: strokeWidth,
      onFeatureTap: onFeatureTap,
      antiAlias: antiAlias,
    );
  }
}
