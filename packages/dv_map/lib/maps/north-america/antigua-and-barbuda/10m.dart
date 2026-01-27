// Generated from: assets/north-america/antigua-and-barbuda.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:dv_geo_core/dv_geo_core.dart';
import 'package:dv_point/dv_point.dart';
import 'package:dv_map/src/map_widget.dart';

/// Gzipped GeoJSON data for north-america/antigua-and-barbuda.10m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE7VaS2tbZxDd+1dcvE7NPM/MZJcW2lVLF92VUNRETQ2OFRx5EUL+e7nKg8a+45Ix1ULovo5G833nzEvvz5bl/Pjuzf786XL+4353vL3Z/3C4utq/OF4ers+frJf/+nj67fnT5fezZVmW96f3+w+ebj9deHNzeLO/OV6eHvp8+7KcX+9enx54dn28fHW7W3bXL5fvdzd/3r7cfXl4Wc4v3x7+2Mnpxp/undfT+d++uvDicH28vN5fH9drvxxujn8vz17vby5f7M4/3fThi22v9ofX++PNu68t+/xTfr69Ol7+erh69+rTz//yDYebl5fXu+O//PDx9e/Pd4/uHy/Ld+CLTAV7PLl3keOCrIgDdy49v3tvA1ykQbINrK4JHwKnwmHbwAIJriGwc7BhG5gC6jkE1kRpNsCWkjIE5kiQd8DlpENgMgI64FCeAkeqVzWLxyjWoSsikGbVAKcbDRcvUAFrFo+pQmwI7Oqy6QpcVCFZpq7QYGXdBs4S0yFBQgpmW8DrrmAGeGqxKayjtEfqUIRCtSo7EbL0GIpQCEQ6EdK0yKmPqVbadhYzpiKEinW7Nj6O5BwuHtJRHW6609DFCDOJBtg808bAwtlZ7OGQ4W5DBIU0sRRSqjF3sWezKZACm65dWWkX/aNsLMfIZKOGH7GK0JAfCNOMhtFRRTyUYyC8uNkVj3JFCFM2sbQINhU3hLt0QbocFFOpSILr9uIxkSsPoz8yqWp7uz0KOIhh1blCzXkaS9lSlTtgynH8cMqGd1WpNQ14D4RoZmPI2GByqe00iBnMPrWY0eNm0nzl1KpRIBZxs6EYByUotssElki1aUIoRCnb0sYCRY3XrtaMpLO4KsZ5W4CrcYVKYcxnU2U0rjB2whTYJRwNPySzZAzsZk34YFFSmSaEDuNs9vGjGB3alOcscB07IgnoNN5Wtk8JXapNtFvF33RanYsLsC3xjAzktAOihegUyGtefKRlNAkFW1nyFNfJXBtyaMBoKJlpou4dOcwYQ8lMnBpJDTkixaZrl8oSHevIiaYWl7E3pe6jUqAMVXDTp8jyabWUgFBXkCbSa+qJFOtrj0ySKaFTktpMnoRj2m6LEuGm9gCZ83y3fWsT9qw7+uorRx1hza5Z6aUqNdZvC2tkywPMMY04gQK219uhJtOGcARhO7lxc/dxQFcP2o437mxV08TUVMIbB/u6QcddNGhl42A3knlR0VcrHpIyLeZDIkKatcs0mwackAyrbQkAWWE61Qj1Ytq2GGrFU/1+aFfAWV3HGa9JF3DwmLwpkBxN4w9p0GlfI9KkeJt5KKiPF69CYrPjvgJnVExHUpwi2A4MKE6tKbCy+f/giRTzaBiNKsV4nPjAqCtIuaYalBpRuU28kECO184ZTQYZQpLTAisdpra9J9YWf2DqYivuOqAoYqX5ZhNCoxRJljFNIcVJOos9ynzY2Fhb6tlZrGLTVOUh2rHmdD6QptzV3BDiHJdBDwKX53TwkFoi0jjY2MbzgQeyV7ibjFlnJhKNJ+A1HX0miKrlhsmcdA/UbY+TeER2c7kgoxxLPErDtnOroFAbF4ShpE3TL5igOeVdaHqTyqOYbfzHDlR04zOEW46jHbSEu21MbPOoVO0IH8ZRPCXIWgi0GTfVeNK+/t2n6V17wmOsmd9cP591R4+s5eVCzX3bebgoLR7OmVbgNTfqgENz1uVdgVOwKVsr8PrPr7nF61SzAebC3BVrObmVma7A4rO58Yqr5JuJ6YrrNGz8r8BSm3XbipuK2WzlPww2ysKIqScPgzbTphOwkY0Cw4gePVfP7n76cPb5/fnZh7N/ALAoL6HgKgAA';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for north-america/antigua-and-barbuda.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get northAmericaAntiguaAndBarbuda10m {
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

/// Widget for rendering the north-america/antigua-and-barbuda.10m.json map.
///
/// This widget provides a convenient way to render this specific map
/// with customizable projection and styling.
///
/// Example:
/// ```dart
/// AntiguaAndBarbuda10mWidget(
///   projection: MercatorProjection(),
///   fillColor: Color(0xFFE0E0E0),
///   strokeColor: Color(0xFF333333),
///   onFeatureTap: (feature, position) {
///     print('Tapped: ${feature.properties}');
///   },
/// )
/// ```
class AntiguaAndBarbuda10mWidget extends StatelessWidget {
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

  /// Creates a AntiguaAndBarbuda10mWidget.
  const AntiguaAndBarbuda10mWidget({
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
      geoJson: northAmericaAntiguaAndBarbuda10m,
      projection: projection,
      fillColor: fillColor,
      strokeColor: strokeColor,
      strokeWidth: strokeWidth,
      onFeatureTap: onFeatureTap,
      antiAlias: antiAlias,
    );
  }
}
