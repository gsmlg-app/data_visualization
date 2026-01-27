// Generated from: assets/africa/rwanda.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:dv_geo_core/dv_geo_core.dart';
import 'package:dv_point/dv_point.dart';
import 'package:dv_map/src/map_widget.dart';

/// Gzipped GeoJSON data for africa/rwanda.10m.json (base64 encoded)
const String _kCompressedData = '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';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for africa/rwanda.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get africaRwanda10m {
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

/// Widget for rendering the africa/rwanda.10m.json map.
///
/// This widget provides a convenient way to render this specific map
/// with customizable projection and styling.
///
/// Example:
/// ```dart
/// AfricaRwanda10mWidget(
///   projection: MercatorProjection(),
///   fillColor: Color(0xFFE0E0E0),
///   strokeColor: Color(0xFF333333),
///   onFeatureTap: (feature, position) {
///     print('Tapped: ${feature.properties}');
///   },
/// )
/// ```
class AfricaRwanda10mWidget extends StatelessWidget {
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

  /// Creates a AfricaRwanda10mWidget.
  const AfricaRwanda10mWidget({
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
      geoJson: africaRwanda10m,
      projection: projection,
      fillColor: fillColor,
      strokeColor: strokeColor,
      strokeWidth: strokeWidth,
      onFeatureTap: onFeatureTap,
      antiAlias: antiAlias,
    );
  }
}
