// Generated from: assets/africa/djibouti.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:dv_geo_core/dv_geo_core.dart';
import 'package:dv_point/dv_point.dart';
import 'package:dv_map/src/map_widget.dart';

/// Gzipped GeoJSON data for africa/djibouti.10m.json (base64 encoded)
const String _kCompressedData = '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';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for africa/djibouti.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get africaDjibouti10m {
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

/// Widget for rendering the africa/djibouti.10m.json map.
///
/// This widget provides a convenient way to render this specific map
/// with customizable projection and styling.
///
/// Example:
/// ```dart
/// Djibouti10mWidget(
///   projection: MercatorProjection(),
///   fillColor: Color(0xFFE0E0E0),
///   strokeColor: Color(0xFF333333),
///   onFeatureTap: (feature, position) {
///     print('Tapped: ${feature.properties}');
///   },
/// )
/// ```
class Djibouti10mWidget extends StatelessWidget {
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

  /// Creates a Djibouti10mWidget.
  const Djibouti10mWidget({
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
      geoJson: africaDjibouti10m,
      projection: projection,
      fillColor: fillColor,
      strokeColor: strokeColor,
      strokeWidth: strokeWidth,
      onFeatureTap: onFeatureTap,
      antiAlias: antiAlias,
    );
  }
}
