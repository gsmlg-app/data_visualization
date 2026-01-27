// Generated from: assets/north-america/saint-pierre-and-miquelon.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:dv_geo_core/dv_geo_core.dart';
import 'package:dv_point/dv_point.dart';
import 'package:dv_map/src/map_widget.dart';

/// Gzipped GeoJSON data for north-america/saint-pierre-and-miquelon.10m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE61ZTWsjRxC961cMOm+G+v7YWwjk5mDIMSxBeJWNwJYcrXwwi/97GK2drO2uhZTjg5hR9zy1X796VdXzZTVN69P97Xb9flr/vN2c7o7bnw7X19ur0+6wX79bhv/4+vXn9fvpt9U0TdOX8+frB8/TzwO3x8Pt9njanR96mj5N6/3m5vzAr5vd/jRd7rbH43ba7D9OF7u/7rbXj7/4OHn3+fD7hpbplxevvuczzPOBq8P+tNtv96dl7JfD8fTn9OPN9ri72qwfJz38s8JP28PN9nS8f76+p3/o4u76tLs8XN9/er6kq8Ph+HG335y+YePr37fXL+9e30/TD2ozKqSkv3s1KDZ7sonZi6EPL+cWwOLKOAYO8BCXJrAhm/EYGFETsgkcQGJarDhVrbvixAjOAtiMzHvABK4QY2BPD/bm5hFGAuEYOIJctQkswKAFsKkldYEJE5nGwCpG0uQYUz2hAiZX7so4IEpcJ8t24ImbxP9PMSoQ+jjw3Gyhv0uFYmJBhZNStK2CA7wwN4/ohgcaeFqBG8KWXSbUJHhsQR5J2sb9zy6/qu6e/WQn5ZCzJ489IFJFuzpiQHQvDDyNwZsewIiuY/YSAJmaOmI0oJQxMJKHd5n4HrByAEUXmMNpnHFSFxPoAkNa4Ni10gAVmq7FYK5FKkuTzPbmQWgUMk5HF8c2x45QAaspN+2QCUALO0w3Du1uHmmiVys2sbaOmUOLIjI9VbtJkjkdsVpxgmOXY1H3otZLz6Q2xwpoUYR0qGCz6mUFgiyYSDHsxp2wulmBe9ZLV2zpgOMyJJOoW5oyElq1cxms0XYgRdNxeZOZ0G5YGDCzZMLS2wsGCiqk9gaGKV3TCo8PV5YmEZQYmuPE/5bYoAAWKXYu0rIbHN8rgd4kCbJk9ZGIfQYIka5hkhogjij2GTAAu4mflBhiZPE+AwNhtIHRcmiYPoNwJHS7bmWmkbH5DMqW3SITxLPYuWDU7kEMCzBhwUMkaPf0gdUBpABOMW+nJEc0GWsNQROom5wdl/gYA6OhWrOZZ0PGYefhM5KmtYtMITcaWabPyGpi7bQvJjLKHT6jIBl107MZxbBkW4CBQLq1oLswVFQIWbssDreQYsWknF1RpCbIyOQXtbFmuwlL09SCCeDsSiIRgQonDg/uajhifGy0+CUGdU/QOCQzR9l5yRxqDO3mwDyGjrk0uUIK7QYsyKs+CSWFu4oobcLmcFXVrsd7htO4AgpFBW+Lzbjq7IKNHbs2UarY5iABaRubK44roOW9A6e2y3hX8KGxnV8PpFLfMROL1s4zAbvnn+xgbsWBbRgBdENaQ2FYBC3A4OLtADGyQscerGlNVVAk5bjLDeTlXUkTV5KKI8cQonZ4EKsCF8BOgF2naJzqrqq7f6+frh5WT58fVg+rvwGos9g+Mh4AAA==';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for north-america/saint-pierre-and-miquelon.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get northAmericaSaintPierreAndMiquelon10m {
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

/// Widget for rendering the north-america/saint-pierre-and-miquelon.10m.json map.
///
/// This widget provides a convenient way to render this specific map
/// with customizable projection and styling.
///
/// Example:
/// ```dart
/// NorthAmericaSaintPierreAndMiquelon10mWidget(
///   projection: MercatorProjection(),
///   fillColor: Color(0xFFE0E0E0),
///   strokeColor: Color(0xFF333333),
///   onFeatureTap: (feature, position) {
///     print('Tapped: ${feature.properties}');
///   },
/// )
/// ```
class NorthAmericaSaintPierreAndMiquelon10mWidget extends StatelessWidget {
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

  /// Creates a NorthAmericaSaintPierreAndMiquelon10mWidget.
  const NorthAmericaSaintPierreAndMiquelon10mWidget({
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
      geoJson: northAmericaSaintPierreAndMiquelon10m,
      projection: projection,
      fillColor: fillColor,
      strokeColor: strokeColor,
      strokeWidth: strokeWidth,
      onFeatureTap: onFeatureTap,
      antiAlias: antiAlias,
    );
  }
}
