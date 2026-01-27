// Generated from: assets/europe/liechtenstein.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:dv_geo_core/dv_geo_core.dart';
import 'package:dv_point/dv_point.dart';
import 'package:dv_map/src/map_widget.dart';

/// Gzipped GeoJSON data for europe/liechtenstein.10m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE5WWS2vcMBDH7/sphM8hzEPzyrWkUOih9xLKkrqpIbHDxjmEkO9edtMNeUwp44OQNdLPI81/Rn7ctDasD7fjcNaGz+N2vd+Nn5br6/FynZZ5ONmbfz0P3w1n7fumtdYeD+3HhYfpB8Ptbrkdd+t0WHSc3towb28OC75O4+XvdZzv1nGaX5a1Nkx3y48tHaZ8+TDOz+Pnrw2Xy7xO8zive9v5/f67w1/r04s7V+NyM667h7fOHL3/tlw/XC3zW+qy+znN2/XVrp+f1/33b63FqRCidD95Z+h2SkoO+Gb84uR/NOiK3jNaZ2PqNVx3Y8lxCIAsVVwPR05waMpduYgLUorMO5RwiKieHXdHyXBdOIiKOEQXxgxHwUbFsxMk1sh0guDAdaGQK2ZnB9E1TMtCEZVss+Ac3Yuh6CbumgkFjImqzpkBMWU0ZQ+vJkWESE/3KsECVdkpKIumOOoARe/EkYAynYCoWxWn4BaeBxbMwIs4FCOyVMVqWnZOJNJI4F4l1Xoijk5pdZIeAEXViRCIpThV96jmv2BIWutMxLBanBTdJDJcgNYlTAF5IQ6zXpawdGbMwkqIilI9ud6dKEswImCqiqQDm2e3BFFgNR+kG4T+477e30dFHAP1yMJKwiq9utfSv8km6x97T5tje7F52vwBCggXLUYKAAA=';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for europe/liechtenstein.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get europeLiechtenstein10m {
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

/// Widget for rendering the europe/liechtenstein.10m.json map.
///
/// This widget provides a convenient way to render this specific map
/// with customizable projection and styling.
///
/// Example:
/// ```dart
/// EuropeLiechtenstein10mWidget(
///   projection: MercatorProjection(),
///   fillColor: Color(0xFFE0E0E0),
///   strokeColor: Color(0xFF333333),
///   onFeatureTap: (feature, position) {
///     print('Tapped: ${feature.properties}');
///   },
/// )
/// ```
class EuropeLiechtenstein10mWidget extends StatelessWidget {
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

  /// Creates a EuropeLiechtenstein10mWidget.
  const EuropeLiechtenstein10mWidget({
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
      geoJson: europeLiechtenstein10m,
      projection: projection,
      fillColor: fillColor,
      strokeColor: strokeColor,
      strokeWidth: strokeWidth,
      onFeatureTap: onFeatureTap,
      antiAlias: antiAlias,
    );
  }
}
