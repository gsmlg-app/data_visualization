// Generated from: assets/asia/georgia.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:dv_geo_core/dv_geo_core.dart';
import 'package:dv_point/dv_point.dart';
import 'package:dv_map/src/map_widget.dart';

/// Gzipped GeoJSON data for asia/georgia.10m.json (base64 encoded)
const String _kCompressedData = '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';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for asia/georgia.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get asiaGeorgia10m {
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

/// Widget for rendering the asia/georgia.10m.json map.
///
/// This widget provides a convenient way to render this specific map
/// with customizable projection and styling.
///
/// Example:
/// ```dart
/// AsiaGeorgia10mWidget(
///   projection: MercatorProjection(),
///   fillColor: Color(0xFFE0E0E0),
///   strokeColor: Color(0xFF333333),
///   onFeatureTap: (feature, position) {
///     print('Tapped: ${feature.properties}');
///   },
/// )
/// ```
class AsiaGeorgia10mWidget extends StatelessWidget {
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

  /// Creates a AsiaGeorgia10mWidget.
  const AsiaGeorgia10mWidget({
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
      geoJson: asiaGeorgia10m,
      projection: projection,
      fillColor: fillColor,
      strokeColor: strokeColor,
      strokeWidth: strokeWidth,
      onFeatureTap: onFeatureTap,
      antiAlias: antiAlias,
    );
  }
}
