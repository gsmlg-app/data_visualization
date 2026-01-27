// Generated from: assets/oceania/palau.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:dv_geo_core/dv_geo_core.dart';
import 'package:dv_point/dv_point.dart';
import 'package:dv_map/src/map_widget.dart';

/// Gzipped GeoJSON data for oceania/palau.10m.json (base64 encoded)
const String _kCompressedData = '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';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for oceania/palau.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get oceaniaPalau10m {
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

/// Widget for rendering the oceania/palau.10m.json map.
///
/// This widget provides a convenient way to render this specific map
/// with customizable projection and styling.
///
/// Example:
/// ```dart
/// Palau10mWidget(
///   projection: MercatorProjection(),
///   fillColor: Color(0xFFE0E0E0),
///   strokeColor: Color(0xFF333333),
///   onFeatureTap: (feature, position) {
///     print('Tapped: ${feature.properties}');
///   },
/// )
/// ```
class Palau10mWidget extends StatelessWidget {
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

  /// Creates a Palau10mWidget.
  const Palau10mWidget({
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
      geoJson: oceaniaPalau10m,
      projection: projection,
      fillColor: fillColor,
      strokeColor: strokeColor,
      strokeWidth: strokeWidth,
      onFeatureTap: onFeatureTap,
      antiAlias: antiAlias,
    );
  }
}
