// Generated from: assets/north-america/saint-kitts-and-nevis.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:dv_geo_core/dv_geo_core.dart';
import 'package:dv_point/dv_point.dart';
import 'package:dv_map/src/map_widget.dart';

/// Gzipped GeoJSON data for north-america/saint-kitts-and-nevis.10m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE6VXTWscORC9z68Qc86G+v7ILQRyCTELe1zCMjidpMGeNuPOggn+78uMY+PY0oIrfWhaKun169LTU/WPTWvb9eZq2r5p2/fTbv1+mN4tFxfT+Tov++2rY/jLXff19k37e9Naaz9O9+cTT8NPgavDcjUd1vk06X54a9v97vI04a/dvF/bh3ldr9tu/7mdTf/O1w/TW9vO18s/OzoO/XD2rJ/v+t8+Dpwv+3XeT/v1GDtbDuu39vZyOsznu+3PQbcP7L5Oy+W0Hm5+5Xb/MR+/X6zzn8vFzdefCXh4w3L4PO9366NM3F2Pn5+2nrdb+8PotWYSk716FkR/TUApwU9Cn56O7QMbhgl6FxiDAsyLwGTslH1gAUvSKmNCpz4uCCoVCaupi/RTjADKWEyximtajBibYBWX1UIHuBFOUQTmEMEBMEFmSBXY3HmwdpQOVk0FO9mIsVJkFsX2v6kwTC6rTUwyBqkI9uCq2gzYecA4zanM2EM4+xuagFSwqoqXe9tm1PrllRWjNQUxlD4ZU0MsStTMQrO/LuSsULVDD2ToGzglEVFxWSyPGu0vCzMTF93FMdMA+7gaKl5UfmCqDTIsqMGRRWAiZutrQhAQ0KrAZjJiDI6OVcYcodZfOwFC86KKQ1h9CIxg1aMhxFT6KubMtCyqLWRsLpyBHEU7jGNBEP1TnVOcoMrYEJz7amMjyjIwoyEPcsyAokUZ+7HWGOwPBjHnKrBaig/MOImh7EEiIDE4chI0pWxupCoDl/8txsBHc+wDR1ZrU0ugHBweLvVtZw4SMCgWjNGy+luh6RwDxqSSUNSaiYMMth2hY5RTQeKi/UqPSCmcysDHA6QPLBhVDRtbMAwIaxBotVR5eW01LvQ2T59uN/f3T5vbzX8lseBwqhAAAA==';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for north-america/saint-kitts-and-nevis.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get northAmericaSaintKittsAndNevis10m {
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

/// Widget for rendering the north-america/saint-kitts-and-nevis.10m.json map.
///
/// This widget provides a convenient way to render this specific map
/// with customizable projection and styling.
///
/// Example:
/// ```dart
/// NorthAmericaSaintKittsAndNevis10mWidget(
///   projection: MercatorProjection(),
///   fillColor: Color(0xFFE0E0E0),
///   strokeColor: Color(0xFF333333),
///   onFeatureTap: (feature, position) {
///     print('Tapped: ${feature.properties}');
///   },
/// )
/// ```
class NorthAmericaSaintKittsAndNevis10mWidget extends StatelessWidget {
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

  /// Creates a NorthAmericaSaintKittsAndNevis10mWidget.
  const NorthAmericaSaintKittsAndNevis10mWidget({
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
      geoJson: northAmericaSaintKittsAndNevis10m,
      projection: projection,
      fillColor: fillColor,
      strokeColor: strokeColor,
      strokeWidth: strokeWidth,
      onFeatureTap: onFeatureTap,
      antiAlias: antiAlias,
    );
  }
}
