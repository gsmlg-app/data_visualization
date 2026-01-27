// Generated from: assets/asia/cyprus-no-mans-area.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:dv_geo_core/dv_geo_core.dart';
import 'package:dv_point/dv_point.dart';
import 'package:dv_map/src/map_widget.dart';

/// Gzipped GeoJSON data for asia/cyprus-no-mans-area.10m.json (base64 encoded)
const String _kCompressedData = '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';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for asia/cyprus-no-mans-area.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get asiaCyprusNoMansArea10m {
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

/// Widget for rendering the asia/cyprus-no-mans-area.10m.json map.
///
/// This widget provides a convenient way to render this specific map
/// with customizable projection and styling.
///
/// Example:
/// ```dart
/// CyprusNoMansArea10mWidget(
///   projection: MercatorProjection(),
///   fillColor: Color(0xFFE0E0E0),
///   strokeColor: Color(0xFF333333),
///   onFeatureTap: (feature, position) {
///     print('Tapped: ${feature.properties}');
///   },
/// )
/// ```
class CyprusNoMansArea10mWidget extends StatelessWidget {
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

  /// Creates a CyprusNoMansArea10mWidget.
  const CyprusNoMansArea10mWidget({
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
      geoJson: asiaCyprusNoMansArea10m,
      projection: projection,
      fillColor: fillColor,
      strokeColor: strokeColor,
      strokeWidth: strokeWidth,
      onFeatureTap: onFeatureTap,
      antiAlias: antiAlias,
    );
  }
}
