// Generated from: assets/europe/malta.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:dv_geo_core/dv_geo_core.dart';
import 'package:dv_point/dv_point.dart';
import 'package:dv_map/src/map_widget.dart';

/// Gzipped GeoJSON data for europe/malta.10m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE6WXSWvbYBCG7/4VwudgZl9yLe2pgR56K6GY1g0Gxw6Ocggh/73YWciiCXTqg7A00qPRfO8s391sGObj7dVqfjrMv6yW481+9Wm32ax+jevddn5yMP95uHw9Px1+zIZhGO6Ox/cPHm8/Gq72u6vVflwfH3q6fRjm2+Xl8YGz5WZcPt8+DPP19e7nko6m7++u8/H611eGX7vtuN6utuPB9vnm8L75o/X+2Y2L1e5yNe5vXzvx5PXZzWZcf9ttbi8ev/QZvdv/Xm+X44tPfvi9/P/27P35MKAsVAJI8uSdjXURCSAob0znb++d5mJSuhfcTMtocjnJbJKbAEHCTa4AxDQWIViwiaWwmA5DEgRwkwsexFhwQ1moxRUPi2k1JFuq99wVUfACa8DK2cNSiLsUXHXSFpYl2bUQgzMyWI9rxKg8zQ0S8F4Y2AJdCpGFhGQvh9mdIit/jZh6OfwhN9k4mv4aKqAWXBJ0b+rBFaRItghHaa4bi1Ml3yA279UyJgKmwt//0S+TMhRco+AuNoisSDexNGuGV8gIC5khWkS3PNTcCLCgrszUkYuW6ZqEzThohnPR4i0trZtuDFK1eDMLbco3UAv1hlBajyokEjmtsmOuaa+YiZOZFdFFFIp2h4eEIroQZtjr8IoooVRwTazZi5Vc0YtlA6RukfyQi6zSnE+ZJKokJmwXnQ/naTaAXs1RQ/coVo0yCJoqs0P3KsIgauDNMd0YDataBtCtZY3tyqw6e/XGxtaJ1Axoqn3bAlw1olepMFVCp77RFmCBgE3uQX9S+GviJr2+hSHMk/3bFqDG0KxUGJ45uRmxBYhyWpcrCVbEgcWQe/ElQAyaGj9tAWRgzbGWCMKt4GJiYi9HSVBMp3L0wBVj6dUqMgCCIr7IktpbN3LXjCoO1h4TQUQLb8k0vTkdlUP4getoza00sxBnwWVhy150GcWnN2WHLEbI5maPgtSoUJl5qDfV8O/Vt+4Es7f/7mdPx/PZ/ewvCOdjyoYUAAA=';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for europe/malta.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get europeMalta10m {
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

/// Widget for rendering the europe/malta.10m.json map.
///
/// This widget provides a convenient way to render this specific map
/// with customizable projection and styling.
///
/// Example:
/// ```dart
/// EuropeMalta10mWidget(
///   projection: MercatorProjection(),
///   fillColor: Color(0xFFE0E0E0),
///   strokeColor: Color(0xFF333333),
///   onFeatureTap: (feature, position) {
///     print('Tapped: ${feature.properties}');
///   },
/// )
/// ```
class EuropeMalta10mWidget extends StatelessWidget {
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

  /// Creates a EuropeMalta10mWidget.
  const EuropeMalta10mWidget({
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
      geoJson: europeMalta10m,
      projection: projection,
      fillColor: fillColor,
      strokeColor: strokeColor,
      strokeWidth: strokeWidth,
      onFeatureTap: onFeatureTap,
      antiAlias: antiAlias,
    );
  }
}
