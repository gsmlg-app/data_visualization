// Generated from: assets/europe/latvia.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:dv_geo_core/dv_geo_core.dart';
import 'package:dv_point/dv_point.dart';
import 'package:dv_map/src/map_widget.dart';

/// Gzipped GeoJSON data for europe/latvia.10m.json (base64 encoded)
const String _kCompressedData = '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';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for europe/latvia.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get europeLatvia10m {
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

/// Widget for rendering the europe/latvia.10m.json map.
///
/// This widget provides a convenient way to render this specific map
/// with customizable projection and styling.
///
/// Example:
/// ```dart
/// EuropeLatvia10mWidget(
///   projection: MercatorProjection(),
///   fillColor: Color(0xFFE0E0E0),
///   strokeColor: Color(0xFF333333),
///   onFeatureTap: (feature, position) {
///     print('Tapped: ${feature.properties}');
///   },
/// )
/// ```
class EuropeLatvia10mWidget extends StatelessWidget {
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

  /// Creates a EuropeLatvia10mWidget.
  const EuropeLatvia10mWidget({
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
      geoJson: europeLatvia10m,
      projection: projection,
      fillColor: fillColor,
      strokeColor: strokeColor,
      strokeWidth: strokeWidth,
      onFeatureTap: onFeatureTap,
      antiAlias: antiAlias,
    );
  }
}
