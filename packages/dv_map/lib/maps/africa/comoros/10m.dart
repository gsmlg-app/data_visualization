// Generated from: assets/africa/comoros.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:dv_geo_core/dv_geo_core.dart';
import 'package:dv_point/dv_point.dart';
import 'package:dv_map/src/map_widget.dart';

/// Gzipped GeoJSON data for africa/comoros.10m.json (base64 encoded)
const String _kCompressedData = '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';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for africa/comoros.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get africaComoros10m {
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

/// Widget for rendering the africa/comoros.10m.json map.
///
/// This widget provides a convenient way to render this specific map
/// with customizable projection and styling.
///
/// Example:
/// ```dart
/// Comoros10mWidget(
///   projection: MercatorProjection(),
///   fillColor: Color(0xFFE0E0E0),
///   strokeColor: Color(0xFF333333),
///   onFeatureTap: (feature, position) {
///     print('Tapped: ${feature.properties}');
///   },
/// )
/// ```
class Comoros10mWidget extends StatelessWidget {
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

  /// Creates a Comoros10mWidget.
  const Comoros10mWidget({
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
      geoJson: africaComoros10m,
      projection: projection,
      fillColor: fillColor,
      strokeColor: strokeColor,
      strokeWidth: strokeWidth,
      onFeatureTap: onFeatureTap,
      antiAlias: antiAlias,
    );
  }
}
