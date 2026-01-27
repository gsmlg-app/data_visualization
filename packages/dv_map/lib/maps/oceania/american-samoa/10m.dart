// Generated from: assets/oceania/american-samoa.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:dv_geo_core/dv_geo_core.dart';
import 'package:dv_point/dv_point.dart';
import 'package:dv_map/src/map_widget.dart';

/// Gzipped GeoJSON data for oceania/american-samoa.10m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE7WYTWvcQAyG7/srzJ5bM/qWeiuF3koLPZZSTOqWhWQdtu4hlPz3Mk4T0iQ6RJA9GNvjeVaj0SvJ/rMbhv16dTnv3wz79/O0/j7N75bz8/lsPSzH/as+/OPm9q/9m+HLbhiG4c92fDxxe3wbuDwtl/NpPWyTbh8fhv1xutgmvL2YT4ez6Th8ni6W6W7eMOwPv5ZvE27PfH50n27uf7g/cLYc18NxPq597OPZPB0P0/7f8PWdQT/n5WJeT1f/m3Nr/4ff5+vh03J+9fPfmu/Yy+n74Tit9xZ/87t//vDq8fUwvAZrowQ0IHj1xCiPqOwo8GDs68OHE7RiayqRoIXFAKtoBWazDI1kXCWHs0lG1iZlmw1BmlJC9kCKMprMlTKjA5ubVNGGYsgZGpi0jHZXlozMgh5FshMgW4ImCKbyLjqiIyeuJlQTKfsjlCW1miIoqlI0EXbUBK11IRq7smZgY3WvKtEQLCDJTCTE7OX04SSeJT1q6BhWRUtgajW6oIBW0YyElEnRmwZTES3OYIYJ2syUq1aLOlvzDN0CvY42lJb5WlyknEHEFDkTDAoKaTVCKhV3l13996fPbwA0RlZyyRSMPeLCKyvVGKUpS2QrRUSlUsB2NJpQbrW2pmWrGdUoq9OkxqWg6mRis8gEzABMpdqx+aPrKDOa3YJKyXJDizTMVRYqZVcjOmjWAtRzQ0cDCkLWfBoYY6kwbWHNqJBnNG1UqtNdjOGUo1Ubl33Nwa5pIyeGUlYMO4dlPREqhNXRpuB5O47kVMrDW+Lz5p5JRtywVqk3dAOhbBt7/LSyQ9iAMH2pEsXaW8SGbkCcNQEsGFTNfMzcuGVCp14nqmqs1K8XK6c+goJoJFsvhB5Qy/Ed3dgg2R/BerbsaBLMokogzKNWqX0Eo+aSlA9B0pC61c/39Qt2UmqK4Mn+QL1tUA1jT8QDblHPJqoNWBLxgAdwMVpjVBJtkVlt1kDKDmEDlRSNQOUCrOIQmKHV3ay+jQ4Kma81AKuJ+9mB91IiMBibpd9HYGyyFb/KMjvaRfnpRrSjgZRLOtjQKvT0+y+MW0NXfN3raBB6uu/qaG3BZbRR9q2yoxFanfz8XcyDavfw7Hp3e/y6u979BfGV1tvwFwAA';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for oceania/american-samoa.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get oceaniaAmericanSamoa10m {
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

/// Widget for rendering the oceania/american-samoa.10m.json map.
///
/// This widget provides a convenient way to render this specific map
/// with customizable projection and styling.
///
/// Example:
/// ```dart
/// AmericanSamoa10mWidget(
///   projection: MercatorProjection(),
///   fillColor: Color(0xFFE0E0E0),
///   strokeColor: Color(0xFF333333),
///   onFeatureTap: (feature, position) {
///     print('Tapped: ${feature.properties}');
///   },
/// )
/// ```
class AmericanSamoa10mWidget extends StatelessWidget {
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

  /// Creates a AmericanSamoa10mWidget.
  const AmericanSamoa10mWidget({
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
      geoJson: oceaniaAmericanSamoa10m,
      projection: projection,
      fillColor: fillColor,
      strokeColor: strokeColor,
      strokeWidth: strokeWidth,
      onFeatureTap: onFeatureTap,
      antiAlias: antiAlias,
    );
  }
}
