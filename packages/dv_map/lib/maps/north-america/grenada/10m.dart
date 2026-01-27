// Generated from: assets/north-america/grenada.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:dv_geo_core/dv_geo_core.dart';
import 'package:dv_point/dv_point.dart';
import 'package:dv_map/src/map_widget.dart';

/// Gzipped GeoJSON data for north-america/grenada.10m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE6VYy47bVgzd+ysEr9OAj0PyMruiRbtqUXRbBIWRqKmBGXvgOItBMP9eyMkMMjPiAGG9ECzx3qMjPg4pfd5M0/Z8ezNv30zbX+bd+dNp/ul4dTW/O++Ph+2rxfzPl8sft2+mvzbTNE2fL8fnGy/LL4ab0/FmPp33l033y6dpe9hdXzb8epoPu/e7hw3TtN1/PP69k4vx52fX9XL9z0eGd8fDeX+YD+fF9vvxdP53+vF6Pu3f7bZfF9098PkwH6/n8+n2MZt7+r99ujrv/zhe3X74+sgPdzie3u8Pu/M3z/7l9+3/p2fPz6fpB+fXzpIwfvXMyPJaGBDJJ6a3T9cWwOQeY6wDC8kQbQOTRAWsGogmsIQHch1YPYS5CWxkJIWPNUNFmsDBsLCKMQU1GYekA7oKzO5u0vRxKEka1oGRymM0gY0JUTBmolTrAjt4rDOmEUO9i6sR6uu4AXZ0Y4cxjNazjVwcbRfD0rkANkptZxvSqAJWV+lKRZgNFBpESmLZTYokY491YBrqo1nREWaQgjFBNZtyHOaJKNKYFIRuQWdGFmlMnqRd4BckiNgGoxs74TBaF01iJtNufbAKXApXhHh2pYIgplW2wdD1sSdSrQKWoWgDK7TSIBaJbvB8pJYaxBnObWDJqApv8b53p4oAJNanCpLE8K6PXwQWQleOXZfyKvIYoOx2JhcvezSZEpr14WIhXMTOWaQ/EaJuTIu2RXdwE7bgQo0D2QdmV9eCcYRkdKdu1gEqYjdIR3Z9zAmzQo7TA9HNNs4YRfCYYNaVY2dlKgqPOYdllzGNYC1mWPGItlSQK8t6k2bVCGszlogKeEhKd9Z0gnnhiQxYm/D3v+5uqrNHt+y8e0MGIdefEga3brFCQnOsKzjCQNmUF4iqZAGcxqMr4RB2oXVgW1JUmwF/yce2yCE1BwZAEbTedIzd4M1JfZnntEhRpAxp+9hjGbyqrLBuz8EYYxR8h1B3DEGi1G+EKHtTW5BLX1/Xb/hYErzrCAsUjQE+Bkc314a4FV9N/idjp9AKWESs2dWREiMKoYAjRjeJXwoeSNutDJGixQsyltLpfvKCi1lVdmYM67oC5l4VnmUMtFX+u/tS3SQ3T//dbe6Pbzd3m/8AOYH77+sXAAA=';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for north-america/grenada.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get northAmericaGrenada10m {
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

/// Widget for rendering the north-america/grenada.10m.json map.
///
/// This widget provides a convenient way to render this specific map
/// with customizable projection and styling.
///
/// Example:
/// ```dart
/// NorthAmericaGrenada10mWidget(
///   projection: MercatorProjection(),
///   fillColor: Color(0xFFE0E0E0),
///   strokeColor: Color(0xFF333333),
///   onFeatureTap: (feature, position) {
///     print('Tapped: ${feature.properties}');
///   },
/// )
/// ```
class NorthAmericaGrenada10mWidget extends StatelessWidget {
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

  /// Creates a NorthAmericaGrenada10mWidget.
  const NorthAmericaGrenada10mWidget({
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
      geoJson: northAmericaGrenada10m,
      projection: projection,
      fillColor: fillColor,
      strokeColor: strokeColor,
      strokeWidth: strokeWidth,
      onFeatureTap: onFeatureTap,
      antiAlias: antiAlias,
    );
  }
}
