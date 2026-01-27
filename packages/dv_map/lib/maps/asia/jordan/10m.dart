// Generated from: assets/asia/jordan.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:dv_geo_core/dv_geo_core.dart';
import 'package:dv_point/dv_point.dart';
import 'package:dv_map/src/map_widget.dart';

/// Gzipped GeoJSON data for asia/jordan.10m.json (base64 encoded)
const String _kCompressedData = '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';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for asia/jordan.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get asiaJordan10m {
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

/// Widget for rendering the asia/jordan.10m.json map.
///
/// This widget provides a convenient way to render this specific map
/// with customizable projection and styling.
///
/// Example:
/// ```dart
/// AsiaJordan10mWidget(
///   projection: MercatorProjection(),
///   fillColor: Color(0xFFE0E0E0),
///   strokeColor: Color(0xFF333333),
///   onFeatureTap: (feature, position) {
///     print('Tapped: ${feature.properties}');
///   },
/// )
/// ```
class AsiaJordan10mWidget extends StatelessWidget {
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

  /// Creates a AsiaJordan10mWidget.
  const AsiaJordan10mWidget({
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
      geoJson: asiaJordan10m,
      projection: projection,
      fillColor: fillColor,
      strokeColor: strokeColor,
      strokeWidth: strokeWidth,
      onFeatureTap: onFeatureTap,
      antiAlias: antiAlias,
    );
  }
}
