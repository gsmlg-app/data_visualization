// Generated from: assets/oceania/wallis-and-futuna.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:dv_geo_core/dv_geo_core.dart';
import 'package:dv_point/dv_point.dart';
import 'package:dv_map/src/map_widget.dart';

/// Gzipped GeoJSON data for oceania/wallis-and-futuna.10m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE61WTWvcQAy9768YfE6NRh8jKddCTi3trYcSikncYNjYYeM9hJD/Xtb5INl4WlDqg/GMZp41T0/S3G9Saua7m745Tc1Z3837Xf952m77i3mYxubkYP79OH3bnKafm5RSul/e7zcuyxfDzW666XfzsGx6Xp5SM3bXy4Yf3XY73KZuvExn+3k/di9bU2qG2+lXh8uys3fztMx/eWO4mMZ5GPtxPti+XfTdOHTNk/nhxaerfrru593dW4+ej/B1v52H79P27urp2C/Y0+5yGLv51fkfn9ffx6P345Q+ZbU2MxISn6xYuUUmMfYj2/nx4hq0GrBTBZpQ3EoU2kTJtea1IVIYWgU516BVgRCj0FIKSFmHJpAMRlFoLo65EkbKkIXCYcTM1TBSJnPlKDSYkVS9dqYc5hoAuFShC2SKcg1clLFKyEe8/gc0ikvYa0dWq8jazF3CTAt49hqyoORwLoJlpmoumluYjkjd29RGb34aKMOlzSJcymrgqUUwzyWWv6XNCuQuFegluWOhL202BoLV+FCLpGbBglba7JCVV1VFLYpCxpiqDl6j5QqwqqPGfXZRrgXRoSBqGJpVsUIHQVGSsD6MHKwSREIyFPv/TBM5WhhXCUGxgszlI5IWZ+fVHk0tCaByWB6suUglEYlVo4XyAJ2NpEq1WFh3rEVotW3Q4V7B6rHmf4BmVq9KGkxLmA60XKiiD3RDxbDXBFKoVpc8Z8ewPgizQIVrNBMo4YQhKVDtAcZagrehA9civn4VpxYLg8eL3l+5XpQZLnpMkGsJgwSKca4Drbx+s9gcfz1snt/nm4fNHxf/Tx4vDwAA';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for oceania/wallis-and-futuna.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get oceaniaWallisAndFutuna10m {
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

/// Widget for rendering the oceania/wallis-and-futuna.10m.json map.
///
/// This widget provides a convenient way to render this specific map
/// with customizable projection and styling.
///
/// Example:
/// ```dart
/// OceaniaWallisAndFutuna10mWidget(
///   projection: MercatorProjection(),
///   fillColor: Color(0xFFE0E0E0),
///   strokeColor: Color(0xFF333333),
///   onFeatureTap: (feature, position) {
///     print('Tapped: ${feature.properties}');
///   },
/// )
/// ```
class OceaniaWallisAndFutuna10mWidget extends StatelessWidget {
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

  /// Creates a OceaniaWallisAndFutuna10mWidget.
  const OceaniaWallisAndFutuna10mWidget({
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
      geoJson: oceaniaWallisAndFutuna10m,
      projection: projection,
      fillColor: fillColor,
      strokeColor: strokeColor,
      strokeWidth: strokeWidth,
      onFeatureTap: onFeatureTap,
      antiAlias: antiAlias,
    );
  }
}
