// Generated from: assets/europe/jersey.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:dv_geo_core/dv_geo_core.dart';
import 'package:dv_point/dv_point.dart';
import 'package:dv_map/src/map_widget.dart';

/// Gzipped GeoJSON data for europe/jersey.10m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE61XyWobQRC96ysGnR1T++JrcA455RqCCSKZGIEtGXl8EMb/HkZe8FIhlLEOQ09X91NV16tXPbeLYVhO+6txeTIsv4yr6WY3ft5eXIy/pvV2szyazX/up6+XJ8OPxTAMw+3h+XbjYfnBcLXbXo27aX3Y9Lh8GJab1eVhw9dxdz3un9YPw3J9vf25ooPt9M08389/f274td1M6824mWbb6c38h8sH692TH+fj9nKcdvuXXjy6/W17sT9/iPIJdbv7vd6spmfh3v+ej1+/DcMnOoYgc/SjVxbJYzIgeTF9dvRftHQ14QpN0xy4iYfA4UglXhCodvEQzExLPBbohouE6VGHGxSWXTxhjyjDNQxz6+IpWhCWeA6s1MUzcsgaDwTIu3hOrFSST42U2nQJcgor8QRUsYuXRh7yUXQhVMws6fKOWiNK1iy5bAzQJh8JIkZ+lHdCgFJSRTwVu1QmZiIt8SgUsEs9IhOH8vTAAKBLFWI2rioXQxS17x6zRxUuhjhm2z2g+dArvARBjTYeIHBFZcy5atqFmxZWCQFGInJfWBy1ZB8GoGFbmC0soTw+D8o2W9DAmKtawwQXbAufUgpXbMbMZG/nQyTEykYEOnvexWNPivg4PIpILYUeGPwdjRyobhyYiSbd/EJappR4wWbYzQd4ZljJZw/LbnmAJJFUfe19dAYBoLJPoquTdcUeGFErtqCjqLRPj0RJy+pwZKZ2uDRLXJlc5KB2tEQgXJ5ekmj70gwEGWW4BODtSxCgZXp5LwAngm7rAJgpVmoLkli28RDDofQPldzb3zDoTGU6iJADulr1T7YQqST02QJWCh8rqbW5Yh5WX4MUzL2djM7n5KIaP47uFo/Ps8Xd4i95pJJq8g8AAA==';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for europe/jersey.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get europeJersey10m {
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

/// Widget for rendering the europe/jersey.10m.json map.
///
/// This widget provides a convenient way to render this specific map
/// with customizable projection and styling.
///
/// Example:
/// ```dart
/// Jersey10mWidget(
///   projection: MercatorProjection(),
///   fillColor: Color(0xFFE0E0E0),
///   strokeColor: Color(0xFF333333),
///   onFeatureTap: (feature, position) {
///     print('Tapped: ${feature.properties}');
///   },
/// )
/// ```
class Jersey10mWidget extends StatelessWidget {
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

  /// Creates a Jersey10mWidget.
  const Jersey10mWidget({
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
      geoJson: europeJersey10m,
      projection: projection,
      fillColor: fillColor,
      strokeColor: strokeColor,
      strokeWidth: strokeWidth,
      onFeatureTap: onFeatureTap,
      antiAlias: antiAlias,
    );
  }
}
