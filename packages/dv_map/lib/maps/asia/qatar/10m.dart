// Generated from: assets/asia/qatar.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:dv_geo_core/dv_geo_core.dart';
import 'package:dv_point/dv_point.dart';
import 'package:dv_map/src/map_widget.dart';

/// Gzipped GeoJSON data for asia/qatar.10m.json (base64 encoded)
const String _kCompressedData = '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';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for asia/qatar.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get asiaQatar10m {
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

/// Widget for rendering the asia/qatar.10m.json map.
///
/// This widget provides a convenient way to render this specific map
/// with customizable projection and styling.
///
/// Example:
/// ```dart
/// AsiaQatar10mWidget(
///   projection: MercatorProjection(),
///   fillColor: Color(0xFFE0E0E0),
///   strokeColor: Color(0xFF333333),
///   onFeatureTap: (feature, position) {
///     print('Tapped: ${feature.properties}');
///   },
/// )
/// ```
class AsiaQatar10mWidget extends StatelessWidget {
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

  /// Creates a AsiaQatar10mWidget.
  const AsiaQatar10mWidget({
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
      geoJson: asiaQatar10m,
      projection: projection,
      fillColor: fillColor,
      strokeColor: strokeColor,
      strokeWidth: strokeWidth,
      onFeatureTap: onFeatureTap,
      antiAlias: antiAlias,
    );
  }
}
