// Generated from: assets/asia/akrotiri-sovereign-base-area.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:dv_geo_core/dv_geo_core.dart';
import 'package:dv_point/dv_point.dart';
import 'package:dv_map/src/map_widget.dart';

/// Gzipped GeoJSON data for asia/akrotiri-sovereign-base-area.10m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE62XXWsTURCG7/MrDrmuYc58T++q4LXgpYgEXctimy3bVSjS/y6JtrQ6ESY0F8sms+fJzM7He87PVWvr5e5mWJ+39dthu3yfhzfT1dXweRmn3fpsb/76++fb9Xn7sGqttZ+H678LD48fDDfzdDPMy3hY9PB4a+vd9vqw4OLbPC3jPLb3049hHsbLXXu9vR3axTxsHymtrcfb6dMW9yteRfxjoMTwedot427YLYe/uR236z+2+0fnLofpeljmu+euPcTybrq6u/wT+iNzmr+Mu+3y5B38/jy9//tba0Qb6KLEeva3hTdKzMjyzPDx7P883ESA0cvRNITRUh4CG5d5KJ1THgr0KPNEJFKaewiWaQwUnvEYQ3qZp6Jd0mxIF++9yjNAVUz90w5UfnseFkfiPY1ngtoznhG5az0f1rukPKNexjGiWIpT6yRW5ZGCKKfpNSMo+4dh0tN0KLKzV3ndkPN0nBZvJ1VNR5UCWkSR584ClPNUQcu8fbtRXn5uJNXh5wpMkPLcFMv5dQn1yOI1ADGvjgMXsiPjIIK1PJydJSKvvxN54OAvyCNRlCM8J6vWsxNiUCYfBhDsVOWhsfe0XkIFyv3miKqeykd0QizzehDl8+q0egYF8FTMXUyj2m8W+45L/TMIrbaHmWvHdHdg1B2r6TVV0yPqpp2r1WwKHTDNrkZ5a2AKaj3XIkIsj76OTkekw5W1XCrEhJArOYRKedSLMWEu5QEd61JJ4pyOFtn3YF0qxZVS/ygooLyzYlbDLB8StN+jl3kQ6JkUibFZ/ZxwnKcu7LX80gYI0DmN96V5J8RLG4DoKJn0ShiF104KB16uRIocwLXyKx8qV9n9w9396uH6cXW/+gVCHtk5DxAAAA==';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for asia/akrotiri-sovereign-base-area.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get asiaAkrotiriSovereignBaseArea10m {
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

/// Widget for rendering the asia/akrotiri-sovereign-base-area.10m.json map.
///
/// This widget provides a convenient way to render this specific map
/// with customizable projection and styling.
///
/// Example:
/// ```dart
/// AsiaAkrotiriSovereignBaseArea10mWidget(
///   projection: MercatorProjection(),
///   fillColor: Color(0xFFE0E0E0),
///   strokeColor: Color(0xFF333333),
///   onFeatureTap: (feature, position) {
///     print('Tapped: ${feature.properties}');
///   },
/// )
/// ```
class AsiaAkrotiriSovereignBaseArea10mWidget extends StatelessWidget {
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

  /// Creates a AsiaAkrotiriSovereignBaseArea10mWidget.
  const AsiaAkrotiriSovereignBaseArea10mWidget({
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
      geoJson: asiaAkrotiriSovereignBaseArea10m,
      projection: projection,
      fillColor: fillColor,
      strokeColor: strokeColor,
      strokeWidth: strokeWidth,
      onFeatureTap: onFeatureTap,
      antiAlias: antiAlias,
    );
  }
}
