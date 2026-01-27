// Generated from: assets/europe/montenegro.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:dv_geo_core/dv_geo_core.dart';
import 'package:dv_point/dv_point.dart';
import 'package:dv_map/src/map_widget.dart';

/// Gzipped GeoJSON data for europe/montenegro.10m.json (base64 encoded)
const String _kCompressedData = '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';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for europe/montenegro.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get europeMontenegro10m {
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

/// Widget for rendering the europe/montenegro.10m.json map.
///
/// This widget provides a convenient way to render this specific map
/// with customizable projection and styling.
///
/// Example:
/// ```dart
/// EuropeMontenegro10mWidget(
///   projection: MercatorProjection(),
///   fillColor: Color(0xFFE0E0E0),
///   strokeColor: Color(0xFF333333),
///   onFeatureTap: (feature, position) {
///     print('Tapped: ${feature.properties}');
///   },
/// )
/// ```
class EuropeMontenegro10mWidget extends StatelessWidget {
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

  /// Creates a EuropeMontenegro10mWidget.
  const EuropeMontenegro10mWidget({
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
      geoJson: europeMontenegro10m,
      projection: projection,
      fillColor: fillColor,
      strokeColor: strokeColor,
      strokeWidth: strokeWidth,
      onFeatureTap: onFeatureTap,
      antiAlias: antiAlias,
    );
  }
}
