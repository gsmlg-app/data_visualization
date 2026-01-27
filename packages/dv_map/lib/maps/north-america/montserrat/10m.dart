// Generated from: assets/north-america/montserrat.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:dv_geo_core/dv_geo_core.dart';
import 'package:dv_point/dv_point.dart';
import 'package:dv_map/src/map_widget.dart';

/// Gzipped GeoJSON data for north-america/montserrat.10m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE52VTWsbMRCG7/srxJ7dMF+aGeVWCr21lPZYQlnSbbpg75q1ejDB/71kHRsnUSnyHoRWr+ZhRqMZPTYhtHm/7dvb0H7su/xn7j9M63V/n4dpbFdP8q/j8q69Dd+bEEJ4XMa3hsv2RdjO07af87AYnbaH0I7dZjH4NI15189zl882IbTDbvrR0aJ/e7POx/Wvl8L9NOZh7Mf8pH2e5vw7vN/083Dftc+bDmeXHvpp0+d5/9KhUwRfpvX+4TngM3yafw5jly8iP36X89d/IbxTukExVk+rVxLqjYmQp/hCuFv9HxiVCbwEVGBCqQYaADOXgGYAwvXAxAhWAiaJgPU8UaMCzpGRrZ7nlJiwCCRjoHpgEqFYBIpwqgYSEGAs5dgxMdXz0F2x5KCZMpJWAxmQSUtAMgWtvtX/9lDdDdSrc6LmpqUjVIusUF8m0Zy0VCZqxsj1hSzJNJXKRB3tms4gAkxSPkNCvwIIsdgYNKmYV98aFEQv+WeALsnqeZwQip0LPNkVORaLVjxBw+hu9bcwgrkWuz8BK9eHHNGUi5VMElHqm6GYJikC2UD0iiRXPXhNaX6aHZrTeNccmr+dWy9LoggAAA==';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for north-america/montserrat.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get northAmericaMontserrat10m {
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

/// Widget for rendering the north-america/montserrat.10m.json map.
///
/// This widget provides a convenient way to render this specific map
/// with customizable projection and styling.
///
/// Example:
/// ```dart
/// Montserrat10mWidget(
///   projection: MercatorProjection(),
///   fillColor: Color(0xFFE0E0E0),
///   strokeColor: Color(0xFF333333),
///   onFeatureTap: (feature, position) {
///     print('Tapped: ${feature.properties}');
///   },
/// )
/// ```
class Montserrat10mWidget extends StatelessWidget {
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

  /// Creates a Montserrat10mWidget.
  const Montserrat10mWidget({
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
      geoJson: northAmericaMontserrat10m,
      projection: projection,
      fillColor: fillColor,
      strokeColor: strokeColor,
      strokeWidth: strokeWidth,
      onFeatureTap: onFeatureTap,
      antiAlias: antiAlias,
    );
  }
}
