// Generated from: assets/asia/dhekelia-sovereign-base-area.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:dv_geo_core/dv_geo_core.dart';
import 'package:dv_point/dv_point.dart';
import 'package:dv_map/src/map_widget.dart';

/// Gzipped GeoJSON data for asia/dhekelia-sovereign-base-area.10m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE62ZS2scRxCA7/oVw56Vpd4P35yEnAM5BhMWZ6IskXfFahMQRv89tGwJ2apxUoN0WGbVOx9VXc+u/ngxTZvz3c28eTNtfpp3579P8w/H6+v5/Xl/PGwux/Ifn/59u3kz/XoxTdP08eHz5YsPP39YuDkdb+bTef/w0uPPp2lz2H14eOHHP+e/5uv9bvrl+M98mvdXh+n73e08vT3NuyfKNG32t8ffdjTe+C7zxQIXC++Ph/P+MB/OY+3t7X63+bx2/yTc1Xz8MJ9Pd1+K9qjLz8fru6vPqj8xj6ff94fd+dkefPp7/vz1t2li3npAsuLl1yuyTTcWxS8W3l3+Dx4mZMlLRm7zXFUqWgBEUJsGEVlqu45nyRxR8jiNs81TQaz1VTVt8zQJgUpemJm25UOJUrwEsujjDFlKZ1nHc85Ifz113RO9dhexcGkHB6nV3rIOZ5IL0bGKl4hiXPJIkK3NE9ba+9zdKNo88sw6t6ziRYBo6S5uGd7WNyRlKZcSUtv9AoOhtIcbETdxAUKQpfs5GWBX3cA0p1JdE5foul+IC1FpDiFRaOtrxKjl9rFHtnEuSlTiBImyvX3BnnWykkTi9vYlhoBVPA3k7FbeMBFiLc1LGdzeP9HAOno1ndy7PA6wqOVjB+tmg1AQhzo8GKBdjEITpO41XMyo22t8g5cYGO39E2ChMjsns3VbjaDkKIqbbgEQva8uAyG/DA/dAjEwtt2PiLVo1XQLDKDtdOCZQ7GSF8rS1heEvSjmuoVR5Pv6InsU6UC3oOrZl48ckUt9Dcmx7S8sYfIyfId8ZtTOVoJoRXQMHEL2i5sqEpbupyzo/WzqRl6a10DS2tHrYtXJaPBcSdq8AOTavM6g0tY3A9FK865ylwRTKIr54CWC9HlBVa829AWndjZNFBF7mU3X7l8Sjnao4gU4tNNpIhtm6S85Dr7d6pagC9n+tXHGBm1tgTXr3ctUpH5vFcWxV7cIEdhPpaNeV8Ihgpi3G5dIqU7RgxeZ0lbWjaA4Fq3noapUxkUA4vZQY5kHoaK2Qt+krEPXgtpTg2/Ity6VmiVwZV8wc+kfPJTViyHTKG2B3u80ZOTzmremki83Bsaa3m/8BJBq3prt8wxyrxsrMmlXtqUpyWj8AMPbvIWp0NrGtJ7ArpZuYeQ3pEODvjU4za20hjhhf2KKIVEnAyaOdl/l4Bpaeh8lRd8aY0RXFg+QUSvbuGTzss01cof2yArFsS7k64INlLFuw1fxLEW0GLqszX3mMWLq1U5Z5gJZu5+YCHTdz1xHNijd2YG1vX8jW0kZbsyjS+ryQgGoTAfrwgOIsD6VE5Fan7fof6hE7QsjSzOGUj6IdG37X47hVCkfkFN/5IwqUo+c0ynbvdVSulp9oQWUlf8N3nDNNg51YeRHEf37InRKrXk+7grbxRKEvL4ASAtsF6PeZe+zb1+w//tSWcjrJAZI3L+n4XSogxBIvW8mDrc6SYwWjtvyCRDXsycEBOjzkOv+HHnFaMLFUGt1UQnaoycfL9WjIhSBfs+wzANh4nbOFrOIskYBOa4wR8ebL6rnx6f7i8fPdxf3F/8COfD2BNwiAAA=';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for asia/dhekelia-sovereign-base-area.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get asiaDhekeliaSovereignBaseArea10m {
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

/// Widget for rendering the asia/dhekelia-sovereign-base-area.10m.json map.
///
/// This widget provides a convenient way to render this specific map
/// with customizable projection and styling.
///
/// Example:
/// ```dart
/// DhekeliaSovereignBaseArea10mWidget(
///   projection: MercatorProjection(),
///   fillColor: Color(0xFFE0E0E0),
///   strokeColor: Color(0xFF333333),
///   onFeatureTap: (feature, position) {
///     print('Tapped: ${feature.properties}');
///   },
/// )
/// ```
class DhekeliaSovereignBaseArea10mWidget extends StatelessWidget {
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

  /// Creates a DhekeliaSovereignBaseArea10mWidget.
  const DhekeliaSovereignBaseArea10mWidget({
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
      geoJson: asiaDhekeliaSovereignBaseArea10m,
      projection: projection,
      fillColor: fillColor,
      strokeColor: strokeColor,
      strokeWidth: strokeWidth,
      onFeatureTap: onFeatureTap,
      antiAlias: antiAlias,
    );
  }
}
