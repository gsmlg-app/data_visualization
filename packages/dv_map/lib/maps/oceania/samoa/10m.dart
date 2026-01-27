// Generated from: assets/oceania/samoa.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:dv_geo_core/dv_geo_core.dart';
import 'package:dv_point/dv_point.dart';
import 'package:dv_map/src/map_widget.dart';

/// Gzipped GeoJSON data for oceania/samoa.10m.json (base64 encoded)
const String _kCompressedData = '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';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for oceania/samoa.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get oceaniaSamoa10m {
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

/// Widget for rendering the oceania/samoa.10m.json map.
///
/// This widget provides a convenient way to render this specific map
/// with customizable projection and styling.
///
/// Example:
/// ```dart
/// Samoa10mWidget(
///   projection: MercatorProjection(),
///   fillColor: Color(0xFFE0E0E0),
///   strokeColor: Color(0xFF333333),
///   onFeatureTap: (feature, position) {
///     print('Tapped: ${feature.properties}');
///   },
/// )
/// ```
class Samoa10mWidget extends StatelessWidget {
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

  /// Creates a Samoa10mWidget.
  const Samoa10mWidget({
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
      geoJson: oceaniaSamoa10m,
      projection: projection,
      fillColor: fillColor,
      strokeColor: strokeColor,
      strokeWidth: strokeWidth,
      onFeatureTap: onFeatureTap,
      antiAlias: antiAlias,
    );
  }
}
