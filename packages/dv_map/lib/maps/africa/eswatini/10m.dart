// Generated from: assets/africa/eswatini.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:dv_geo_core/dv_geo_core.dart';
import 'package:dv_point/dv_point.dart';
import 'package:dv_map/src/map_widget.dart';

/// Gzipped GeoJSON data for africa/eswatini.10m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE51Zy4obRxTd6ysarSfFfT+8M4GsA14EEkwQE9kIxtIgdwiDmX8PJXsGj32VcK2FaHWpj+7z3FOlT5tl2a4P9/vtq2X7y363/n3e/3y6u9vfrofTcXszl999vv1x+2r5Y7Msy/Lp8v79g5evXxbuz6f7/Xk9XB56+vqybI+7D5cH9m/+2a2H4+H5iWXZHj6e/tzRXH3z+3f3+XL/txcLt6fjejjuj+tce/3ufLjdbb+sPj5b8n5/+rBfzw8v7Xgy/NfT3cP7L34+o57Ofx2Ou/Urhz+/vr7+9tOyMI6UJGG6+WblJ9KRGgjCL1be3vwfYCRGkJSAwcFJXUBjVq/xMtm7cCzqVxwOgqCufS6WZlwCMnikdgEZDKC2kJDApQloHO5YAoa5GGcTUJlmGEtA0PlqAgpZpEcF6MIm3k2KAIqXOXHWzK7D7ATopcPOJkhdh5mdU8qUuIgFdMuaISmo9lidk7EJSBACmWWOOYyiW4WIGWxlDBMBRLtMg2BhV5hhhqOdFEg0QrxCXcZ9QHZ3KZJiAwEQsVfWMNIyHIsY2iBIlOhZCCPSGb2IoQ1KdGpyDYwAUQ2rADldtA3oQQlWJMWGOHFEN4YegmLFgLKhHiHYa70JqJZWxtDRkrDXejA81bwaADZ/S+UHkkLCWdCrjYBI0K6FgRnAZVICPL1dhmwiVJDNxFOIdghDmZNKjz3NwNqAFi5QJzkkyXvsBSMCCGuX3YlQejNqAiqllHU9K1TAumQDpBGly8HITN1GSdRAr7MsKdhUSjBSRKTuvHAzwG5SUhWybLxI5O5UnnwNGXWfJCKRtD3W9CuNkmzYHVEzhCngJV+nq4C1q0bZRAuXfQAAo7QB3cCpsNAHsII0hygO8HDlomp8IAYJtIUImQLVgEFG2dVeOHuh6GQfmCbel17qIFzIBh8Eqs5dQBJxsDInxKRh3RBSALIVfO2DhBXaWxRWM8vaQnOwdgxFU+qcUIaldPGUTAtl6IMRouutsSVCGT5GIuZe0+FUXVoXDCNnNmcJjvAwqITrBFRiiCZgWpBBSTOMRtY+t0ibUr1MMAMDa5dm0iQk66ZLNLNuxUzuDy2mkw8KBOqyTCqlcTFLfJADWrcIU5yjmk0+SFWS+oASWmmuyavI0W6TFCGo9mM+0Ii5TQophIilywhg3h4lqWmBZSMDhEd2Gy9dKaJWIGRGbY+TiOudBAdpUwZPvBmnUn8EBDU3tDRAHYWv4Wk2tzo0wBmNyz18IHJoLyM0IN0Na0Ceo65r4bQi6lOGEABsUuEEdM4oATWIlNqA4FCdkNpQAEruJzmDq3FnQ1CCmjp9AhJzfQzCYdGUmDSAM6KSmDYo2Ex7zEUDRFzqoiEVJej18SxrD6wOIG2gq6i2AQOF66MplPD8AQuvniQhClrzTJgGGDlJmRRwR7OeBrlwjZQbCRtzWwLQ5xpQrySDDYD0aKokGgACdOWvhBTuFvZ/jJN5RApC0Z5Pzf+fNtX109Xj5un97eZx8y/YkNm0KBwAAA==';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for africa/eswatini.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get africaEswatini10m {
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

/// Widget for rendering the africa/eswatini.10m.json map.
///
/// This widget provides a convenient way to render this specific map
/// with customizable projection and styling.
///
/// Example:
/// ```dart
/// Eswatini10mWidget(
///   projection: MercatorProjection(),
///   fillColor: Color(0xFFE0E0E0),
///   strokeColor: Color(0xFF333333),
///   onFeatureTap: (feature, position) {
///     print('Tapped: ${feature.properties}');
///   },
/// )
/// ```
class Eswatini10mWidget extends StatelessWidget {
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

  /// Creates a Eswatini10mWidget.
  const Eswatini10mWidget({
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
      geoJson: africaEswatini10m,
      projection: projection,
      fillColor: fillColor,
      strokeColor: strokeColor,
      strokeWidth: strokeWidth,
      onFeatureTap: onFeatureTap,
      antiAlias: antiAlias,
    );
  }
}
