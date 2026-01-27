// Generated from: assets/africa/lesotho.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:dv_geo_core/dv_geo_core.dart';
import 'package:dv_point/dv_point.dart';
import 'package:dv_map/src/map_widget.dart';

/// Gzipped GeoJSON data for africa/lesotho.10m.json (base64 encoded)
const String _kCompressedData = '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';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for africa/lesotho.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get africaLesotho10m {
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

/// Widget for rendering the africa/lesotho.10m.json map.
///
/// This widget provides a convenient way to render this specific map
/// with customizable projection and styling.
///
/// Example:
/// ```dart
/// AfricaLesotho10mWidget(
///   projection: MercatorProjection(),
///   fillColor: Color(0xFFE0E0E0),
///   strokeColor: Color(0xFF333333),
///   onFeatureTap: (feature, position) {
///     print('Tapped: ${feature.properties}');
///   },
/// )
/// ```
class AfricaLesotho10mWidget extends StatelessWidget {
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

  /// Creates a AfricaLesotho10mWidget.
  const AfricaLesotho10mWidget({
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
      geoJson: africaLesotho10m,
      projection: projection,
      fillColor: fillColor,
      strokeColor: strokeColor,
      strokeWidth: strokeWidth,
      onFeatureTap: onFeatureTap,
      antiAlias: antiAlias,
    );
  }
}
