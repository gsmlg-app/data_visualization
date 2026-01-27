// Generated from: assets/africa/togo.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:dv_geo_core/dv_geo_core.dart';
import 'package:dv_point/dv_point.dart';
import 'package:dv_map/src/map_widget.dart';

/// Gzipped GeoJSON data for africa/togo.10m.json (base64 encoded)
const String _kCompressedData = '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';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for africa/togo.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get africaTogo10m {
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

/// Widget for rendering the africa/togo.10m.json map.
///
/// This widget provides a convenient way to render this specific map
/// with customizable projection and styling.
///
/// Example:
/// ```dart
/// Togo10mWidget(
///   projection: MercatorProjection(),
///   fillColor: Color(0xFFE0E0E0),
///   strokeColor: Color(0xFF333333),
///   onFeatureTap: (feature, position) {
///     print('Tapped: ${feature.properties}');
///   },
/// )
/// ```
class Togo10mWidget extends StatelessWidget {
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

  /// Creates a Togo10mWidget.
  const Togo10mWidget({
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
      geoJson: africaTogo10m,
      projection: projection,
      fillColor: fillColor,
      strokeColor: strokeColor,
      strokeWidth: strokeWidth,
      onFeatureTap: onFeatureTap,
      antiAlias: antiAlias,
    );
  }
}
