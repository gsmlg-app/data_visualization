// Generated from: assets/seven-seas-open-ocean/saint-helena.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:dv_geo_core/dv_geo_core.dart';
import 'package:dv_point/dv_point.dart';
import 'package:dv_map/src/map_widget.dart';

/// Gzipped GeoJSON data for seven-seas-open-ocean/saint-helena.10m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE7WZy2pcRxCG9/MUh1kl4DR1v3gbCN4kBLIMJgzOiRmQZ4Q0Dgijdw99ZBtb6g6ojLUY5ty+af1d9Vd1nw+7Zdlf7q7X/ctl/8t6uLy/WX8+X12tby7H82n/ol/+5+H07f7l8uduWZblw/b59MHt9u3C9c35er25HLeHPt2+LPvT4d32wB+H4+myvFqv1tPh81PLsj/env860HbHqyfn+eH8b19eeHM+XY6n9XTZrq3/rqfldj3cLj+cr9fTcn6zHk4/7j/efv95eG/X87v1cnP39eA+/Te/vr+6HH8/X929/ajA59863/x9PB0uX0jx8Pfl98dHT4+X5adsScaBL55eEmgsEZD66NrrxzePuUxsJBMwJwhnDSyMIDYBI5FlFMGZAjMwiKhzDWzk6jkDYyhjAYzQAMLUZiKXh9zJRARGM7ITCRXJDIDhs/ljZ7EqOdl9GnIYUJX5/8Fh7MXAUHDnCTfIpZh7pGgw46ZHYC1FIpVdZ24RJuCVqMiWAIAcE7ATmlaCooONDXUCNsEEKWr8bN/czY6++sVnezhST8iJ2bI3cICgkg9QY1JNHJliJ6eYZimpqDEro41mhr0hCFnJYLoYguAj6+pgUg0uGQw1cjOAkXV1siRGqaZ1srEHjzL2gQyERZlJxANHgdrJ7FHK2A5GdJmKgQhoFffqZFBxmUQzQgBomQwMNrKZh5iDzKIamOoQEzJkqGnFZzYykvM0A0EhKtVnm0FGkkmidJkRqmTyZJ35kQVSVWcSyZCJa4Ameq3joUaJCTBTQ9U1izNIaUZz8jeMueL736kKaXPCYBylAGpLiJTSUkKbs4PkqH/uYHS0qNiuNldFtJHrdjBlSqnr0OYOyCPP7VxRKvV1HWuKORuvAbIXxxvAITOFnQWoCvbedk/AIeJQCf0OTpVhTnVwKmWpFG9SYOAopdDallBcHLGxC418vINRnapSiI2nrmM5JIpTRxkRI6fdhJDAUkXT5qgmNgu2bhRZFALRdJoefd+g5LPaHNx1ms9prKX1VAcL83A9tYFTRKojxhwv1LbJUxSopYeFJeao63vQOKBomeacnMP06E4RhFzT2IxcclaWPDW85samrDpcs25uzKpVKRSmWImsrbE7FtOmeceiQMWYUHcY9pFbfU6lYn02M1ObpUdfE3Fx6jzNp1KAM2GxekBqyHTElmlF0yw0V9+p00NprEaOI/28RYhllNp76Tsy6jSylw5OZquYwAbOybrhW8HOJjbyrQ5WltpKp4PNMkaNiLdwD6MqOMFwuLz+RikEzEDHUiQJRG1HR5qg+7Al85acRCXf2rhE481Bb6nAta2RzsW+nznmGoPV1nubwgI0ATtHlqr6FhMIhKPWqYPTaiusLYpDKSdz5wZQzjsFZhwVnQ4WByntXUh/NyXjMtknr7tIafdQGlNIDN8vdTAxS1VjUJLhTmoPY4IobR1KoxSPnEgsKlG2NgTBYcPQjcIVau+WpLG4wCShIzPqEj+/4M2r7+7xt/vdp8/Xu/vdfyiKASgLHwAA';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for seven-seas-open-ocean/saint-helena.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get sevenSeasOpenOceanSaintHelena10m {
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

/// Widget for rendering the seven-seas-open-ocean/saint-helena.10m.json map.
///
/// This widget provides a convenient way to render this specific map
/// with customizable projection and styling.
///
/// Example:
/// ```dart
/// SevenSeasOpenOceanSaintHelena10mWidget(
///   projection: MercatorProjection(),
///   fillColor: Color(0xFFE0E0E0),
///   strokeColor: Color(0xFF333333),
///   onFeatureTap: (feature, position) {
///     print('Tapped: ${feature.properties}');
///   },
/// )
/// ```
class SevenSeasOpenOceanSaintHelena10mWidget extends StatelessWidget {
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

  /// Creates a SevenSeasOpenOceanSaintHelena10mWidget.
  const SevenSeasOpenOceanSaintHelena10mWidget({
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
      geoJson: sevenSeasOpenOceanSaintHelena10m,
      projection: projection,
      fillColor: fillColor,
      strokeColor: strokeColor,
      strokeWidth: strokeWidth,
      onFeatureTap: onFeatureTap,
      antiAlias: antiAlias,
    );
  }
}
