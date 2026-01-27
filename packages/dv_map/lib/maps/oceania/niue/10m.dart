// Generated from: assets/oceania/niue.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:dv_geo_core/dv_geo_core.dart';
import 'package:dv_point/dv_point.dart';
import 'package:dv_map/src/map_widget.dart';

/// Gzipped GeoJSON data for oceania/niue.10m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE62WS2sbMRDH7/4UYs+umZfmkWuh0EvbS08lFONuw4KzG5zNIYR89+JNnCa1FroiPiyyRvrxn4dGelil1Iz3N21zkZpP7Xa8O7Qfh/2+3Y3d0Dfro/n30/Rtc5F+rFJK6WH6nm+clk+Gm8Nw0x7Gbtp0Wp5S02+vpw1furu/q1Nqutvh55Ymy/ezeZ7mP78x7IZ+7Pq2H4+2r7t223fb5tn8+CLjqh2u2/Fw/1bESfW3YX9/9ezkC3Y4/Or67fjK26ff6/G//1L6gBobz4iS12cm34RmBPQ3lsv1fxCVDZ3KSAHhWI6M7ET2nioDFaDgd2wAGEFlOZHQiQsij0gDJK1AKjvOEAUjLycykOiM386hWIFkg1zId2wAWUEqQsnCoVFEEgR5RSgZsweXkZprqjLIQq2sktGZqxJO2WeQlhloOVLMgLSI1BDGCmQGIfci0o1ZamI573hIAHMFUkCxfB4j2KLCcQyhYg0h5nCwGpEWUjziiMFoNX7PliUSOWqFSobMKGWkcljNEZ/tGkihuapbIgSW00MOVNEtIcJpJpSeQypCCQTiZZFM4RVV6eGBM6EUsiwVd7hDGBRPOFKAU8UdbhSRi30IKQfE8pvHNQvZu9aQE7tgOeNADF7hOOSYuSUcQ3l5dizUVYrHEYwDbHkNmVOAlZulesjyNmQhpFB+Foghc0W+iZSw/LI0yu4VhU6ZQQuFfnxZWmSoULnsRb0qjU+jx9Xpe7l6XP0B3LZ0KfgMAAA=';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for oceania/niue.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get oceaniaNiue10m {
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

/// Widget for rendering the oceania/niue.10m.json map.
///
/// This widget provides a convenient way to render this specific map
/// with customizable projection and styling.
///
/// Example:
/// ```dart
/// OceaniaNiue10mWidget(
///   projection: MercatorProjection(),
///   fillColor: Color(0xFFE0E0E0),
///   strokeColor: Color(0xFF333333),
///   onFeatureTap: (feature, position) {
///     print('Tapped: ${feature.properties}');
///   },
/// )
/// ```
class OceaniaNiue10mWidget extends StatelessWidget {
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

  /// Creates a OceaniaNiue10mWidget.
  const OceaniaNiue10mWidget({
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
      geoJson: oceaniaNiue10m,
      projection: projection,
      fillColor: fillColor,
      strokeColor: strokeColor,
      strokeWidth: strokeWidth,
      onFeatureTap: onFeatureTap,
      antiAlias: antiAlias,
    );
  }
}
