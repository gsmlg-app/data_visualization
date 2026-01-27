// Generated from: assets/asia/lebanon.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:dv_geo_core/dv_geo_core.dart';
import 'package:dv_point/dv_point.dart';
import 'package:dv_map/src/map_widget.dart';

/// Gzipped GeoJSON data for asia/lebanon.10m.json (base64 encoded)
const String _kCompressedData = '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';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for asia/lebanon.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get asiaLebanon10m {
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

/// Widget for rendering the asia/lebanon.10m.json map.
///
/// This widget provides a convenient way to render this specific map
/// with customizable projection and styling.
///
/// Example:
/// ```dart
/// Lebanon10mWidget(
///   projection: MercatorProjection(),
///   fillColor: Color(0xFFE0E0E0),
///   strokeColor: Color(0xFF333333),
///   onFeatureTap: (feature, position) {
///     print('Tapped: ${feature.properties}');
///   },
/// )
/// ```
class Lebanon10mWidget extends StatelessWidget {
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

  /// Creates a Lebanon10mWidget.
  const Lebanon10mWidget({
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
      geoJson: asiaLebanon10m,
      projection: projection,
      fillColor: fillColor,
      strokeColor: strokeColor,
      strokeWidth: strokeWidth,
      onFeatureTap: onFeatureTap,
      antiAlias: antiAlias,
    );
  }
}
