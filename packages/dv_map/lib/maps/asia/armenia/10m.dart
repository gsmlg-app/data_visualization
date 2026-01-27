// Generated from: assets/asia/armenia.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:dv_geo_core/dv_geo_core.dart';
import 'package:dv_point/dv_point.dart';
import 'package:dv_map/src/map_widget.dart';

/// Gzipped GeoJSON data for asia/armenia.10m.json (base64 encoded)
const String _kCompressedData = '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';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for asia/armenia.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get asiaArmenia10m {
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

/// Widget for rendering the asia/armenia.10m.json map.
///
/// This widget provides a convenient way to render this specific map
/// with customizable projection and styling.
///
/// Example:
/// ```dart
/// AsiaArmenia10mWidget(
///   projection: MercatorProjection(),
///   fillColor: Color(0xFFE0E0E0),
///   strokeColor: Color(0xFF333333),
///   onFeatureTap: (feature, position) {
///     print('Tapped: ${feature.properties}');
///   },
/// )
/// ```
class AsiaArmenia10mWidget extends StatelessWidget {
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

  /// Creates a AsiaArmenia10mWidget.
  const AsiaArmenia10mWidget({
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
      geoJson: asiaArmenia10m,
      projection: projection,
      fillColor: fillColor,
      strokeColor: strokeColor,
      strokeWidth: strokeWidth,
      onFeatureTap: onFeatureTap,
      antiAlias: antiAlias,
    );
  }
}
