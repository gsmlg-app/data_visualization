// Generated from: assets/asia/syria.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:dv_geo_core/dv_geo_core.dart';
import 'package:dv_point/dv_point.dart';
import 'package:dv_map/src/map_widget.dart';

/// Gzipped GeoJSON data for asia/syria.10m.json (base64 encoded)
const String _kCompressedData = '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';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for asia/syria.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get asiaSyria10m {
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

/// Widget for rendering the asia/syria.10m.json map.
///
/// This widget provides a convenient way to render this specific map
/// with customizable projection and styling.
///
/// Example:
/// ```dart
/// AsiaSyria10mWidget(
///   projection: MercatorProjection(),
///   fillColor: Color(0xFFE0E0E0),
///   strokeColor: Color(0xFF333333),
///   onFeatureTap: (feature, position) {
///     print('Tapped: ${feature.properties}');
///   },
/// )
/// ```
class AsiaSyria10mWidget extends StatelessWidget {
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

  /// Creates a AsiaSyria10mWidget.
  const AsiaSyria10mWidget({
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
      geoJson: asiaSyria10m,
      projection: projection,
      fillColor: fillColor,
      strokeColor: strokeColor,
      strokeWidth: strokeWidth,
      onFeatureTap: onFeatureTap,
      antiAlias: antiAlias,
    );
  }
}
