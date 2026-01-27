// Generated from: assets/asia/northern-cyprus.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:dv_geo_core/dv_geo_core.dart';
import 'package:dv_point/dv_point.dart';
import 'package:dv_map/src/map_widget.dart';

/// Gzipped GeoJSON data for asia/northern-cyprus.10m.json (base64 encoded)
const String _kCompressedData = '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';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for asia/northern-cyprus.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get asiaNorthernCyprus10m {
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

/// Widget for rendering the asia/northern-cyprus.10m.json map.
///
/// This widget provides a convenient way to render this specific map
/// with customizable projection and styling.
///
/// Example:
/// ```dart
/// NorthernCyprus10mWidget(
///   projection: MercatorProjection(),
///   fillColor: Color(0xFFE0E0E0),
///   strokeColor: Color(0xFF333333),
///   onFeatureTap: (feature, position) {
///     print('Tapped: ${feature.properties}');
///   },
/// )
/// ```
class NorthernCyprus10mWidget extends StatelessWidget {
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

  /// Creates a NorthernCyprus10mWidget.
  const NorthernCyprus10mWidget({
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
      geoJson: asiaNorthernCyprus10m,
      projection: projection,
      fillColor: fillColor,
      strokeColor: strokeColor,
      strokeWidth: strokeWidth,
      onFeatureTap: onFeatureTap,
      antiAlias: antiAlias,
    );
  }
}
