// Generated from: assets/asia/brunei.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:dv_geo_core/dv_geo_core.dart';
import 'package:dv_point/dv_point.dart';
import 'package:dv_map/src/map_widget.dart';

/// Gzipped GeoJSON data for asia/brunei.10m.json (base64 encoded)
const String _kCompressedData = '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';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for asia/brunei.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get asiaBrunei10m {
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

/// Widget for rendering the asia/brunei.10m.json map.
///
/// This widget provides a convenient way to render this specific map
/// with customizable projection and styling.
///
/// Example:
/// ```dart
/// Brunei10mWidget(
///   projection: MercatorProjection(),
///   fillColor: Color(0xFFE0E0E0),
///   strokeColor: Color(0xFF333333),
///   onFeatureTap: (feature, position) {
///     print('Tapped: ${feature.properties}');
///   },
/// )
/// ```
class Brunei10mWidget extends StatelessWidget {
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

  /// Creates a Brunei10mWidget.
  const Brunei10mWidget({
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
      geoJson: asiaBrunei10m,
      projection: projection,
      fillColor: fillColor,
      strokeColor: strokeColor,
      strokeWidth: strokeWidth,
      onFeatureTap: onFeatureTap,
      antiAlias: antiAlias,
    );
  }
}
