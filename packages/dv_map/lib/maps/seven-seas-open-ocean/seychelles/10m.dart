// Generated from: assets/seven-seas-open-ocean/seychelles.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:dv_geo_core/dv_geo_core.dart';
import 'package:dv_point/dv_point.dart';
import 'package:dv_map/src/map_widget.dart';

/// Gzipped GeoJSON data for seven-seas-open-ocean/seychelles.10m.json (base64 encoded)
const String _kCompressedData = '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';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for seven-seas-open-ocean/seychelles.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get sevenSeasOpenOceanSeychelles10m {
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

/// Widget for rendering the seven-seas-open-ocean/seychelles.10m.json map.
///
/// This widget provides a convenient way to render this specific map
/// with customizable projection and styling.
///
/// Example:
/// ```dart
/// Seychelles10mWidget(
///   projection: MercatorProjection(),
///   fillColor: Color(0xFFE0E0E0),
///   strokeColor: Color(0xFF333333),
///   onFeatureTap: (feature, position) {
///     print('Tapped: ${feature.properties}');
///   },
/// )
/// ```
class Seychelles10mWidget extends StatelessWidget {
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

  /// Creates a Seychelles10mWidget.
  const Seychelles10mWidget({
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
      geoJson: sevenSeasOpenOceanSeychelles10m,
      projection: projection,
      fillColor: fillColor,
      strokeColor: strokeColor,
      strokeWidth: strokeWidth,
      onFeatureTap: onFeatureTap,
      antiAlias: antiAlias,
    );
  }
}
