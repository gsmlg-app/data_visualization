// Generated from: assets/north-america/belize.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:dv_geo_core/dv_geo_core.dart';
import 'package:dv_point/dv_point.dart';
import 'package:dv_map/src/map_widget.dart';

/// Gzipped GeoJSON data for north-america/belize.10m.json (base64 encoded)
const String _kCompressedData = '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';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for north-america/belize.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get northAmericaBelize10m {
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

/// Widget for rendering the north-america/belize.10m.json map.
///
/// This widget provides a convenient way to render this specific map
/// with customizable projection and styling.
///
/// Example:
/// ```dart
/// Belize10mWidget(
///   projection: MercatorProjection(),
///   fillColor: Color(0xFFE0E0E0),
///   strokeColor: Color(0xFF333333),
///   onFeatureTap: (feature, position) {
///     print('Tapped: ${feature.properties}');
///   },
/// )
/// ```
class Belize10mWidget extends StatelessWidget {
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

  /// Creates a Belize10mWidget.
  const Belize10mWidget({
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
      geoJson: northAmericaBelize10m,
      projection: projection,
      fillColor: fillColor,
      strokeColor: strokeColor,
      strokeWidth: strokeWidth,
      onFeatureTap: onFeatureTap,
      antiAlias: antiAlias,
    );
  }
}
