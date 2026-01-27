// Generated from: assets/asia/palestine.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:dv_geo_core/dv_geo_core.dart';
import 'package:dv_point/dv_point.dart';
import 'package:dv_map/src/map_widget.dart';

/// Gzipped GeoJSON data for asia/palestine.10m.json (base64 encoded)
const String _kCompressedData = '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';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for asia/palestine.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get asiaPalestine10m {
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

/// Widget for rendering the asia/palestine.10m.json map.
///
/// This widget provides a convenient way to render this specific map
/// with customizable projection and styling.
///
/// Example:
/// ```dart
/// AsiaPalestine10mWidget(
///   projection: MercatorProjection(),
///   fillColor: Color(0xFFE0E0E0),
///   strokeColor: Color(0xFF333333),
///   onFeatureTap: (feature, position) {
///     print('Tapped: ${feature.properties}');
///   },
/// )
/// ```
class AsiaPalestine10mWidget extends StatelessWidget {
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

  /// Creates a AsiaPalestine10mWidget.
  const AsiaPalestine10mWidget({
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
      geoJson: asiaPalestine10m,
      projection: projection,
      fillColor: fillColor,
      strokeColor: strokeColor,
      strokeWidth: strokeWidth,
      onFeatureTap: onFeatureTap,
      antiAlias: antiAlias,
    );
  }
}
