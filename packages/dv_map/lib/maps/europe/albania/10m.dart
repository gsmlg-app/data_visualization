// Generated from: assets/europe/albania.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:dv_geo_core/dv_geo_core.dart';
import 'package:dv_point/dv_point.dart';
import 'package:dv_map/src/map_widget.dart';

/// Gzipped GeoJSON data for europe/albania.10m.json (base64 encoded)
const String _kCompressedData = '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';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for europe/albania.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get europeAlbania10m {
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

/// Widget for rendering the europe/albania.10m.json map.
///
/// This widget provides a convenient way to render this specific map
/// with customizable projection and styling.
///
/// Example:
/// ```dart
/// EuropeAlbania10mWidget(
///   projection: MercatorProjection(),
///   fillColor: Color(0xFFE0E0E0),
///   strokeColor: Color(0xFF333333),
///   onFeatureTap: (feature, position) {
///     print('Tapped: ${feature.properties}');
///   },
/// )
/// ```
class EuropeAlbania10mWidget extends StatelessWidget {
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

  /// Creates a EuropeAlbania10mWidget.
  const EuropeAlbania10mWidget({
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
      geoJson: europeAlbania10m,
      projection: projection,
      fillColor: fillColor,
      strokeColor: strokeColor,
      strokeWidth: strokeWidth,
      onFeatureTap: onFeatureTap,
      antiAlias: antiAlias,
    );
  }
}
