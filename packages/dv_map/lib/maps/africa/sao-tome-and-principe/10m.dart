// Generated from: assets/africa/sao-tome-and-principe.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:dv_geo_core/dv_geo_core.dart';
import 'package:dv_point/dv_point.dart';
import 'package:dv_map/src/map_widget.dart';

/// Gzipped GeoJSON data for africa/sao-tome-and-principe.10m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE6WZS2vbWBSA9/4VwusizvvRXRmY3UBgupspQ0jdYkjs4DqLUPLfh6s0bZocLXrqhZF0pc/H5563vm6maXu+v91t307bP3eX57vT7o/j9fXu6rw/HrZvxvKnx8tftm+nfzbTNE1fl+/XDy63Lwu3p+Pt7nTeLw893T5N28PlzfLA3//eAez4OL0/3iyHOV0ePk4Xp/3han/7AzRN2/2X43+XtDz0/tV1frx+8Xzh6ng47w+7w3msvft02l9dbr+tPnwX8PPueLM7n+5/Fu/p//x1d33eXxyv7z9/08F39PH0cX+4PD9TxuPn+fHLs9fn02SzBQo4vnm1BPO4zsgvVj68vLWkCoYal1QET5YWFVIlpKJyAptlh6oelCtUE7VsyaoCHlTqlRXDBVtUZtAaKoEM1oFKeiCXm8VIFqk9qrJjllQwDmrKKozlXlFmplAPCiRaQyGttVPiEG411DwivUW1UFyhaqZqT1YLhLSSyhnIPQMwY0yqqTg03qOiBdQaIEJtOauYU2qUUCSxjJazAllaqQDIGGGnR1UHX6FKeE8DOuycS7VCDoPthStkC6qpERTcigGKluxeUj0QsSmrGVKtV8v0Vh5URKcs4xUoOUFvsxAQsDRXUBSMJtXYaijzWGpByYzqLAAkiNpTK1vqig+QCUvPrkQIoMyuIJyMPbWqM1CZXYGCTFuJQM0do9arEDarCw/2rE3gNxwrKFRX3NWZW3ZlaERYpqzfENUw0KUWNZCglwhtcZ96r/p5wARF6tCyhIds+YApaUYZsRGYsFdimwGAlJ6F4EzWlJWZodQrkqhnT6+amFD6K1KM8qungRDz0l6REaBpAy7qWMZBZB65t0N1YGStZQ2QXpPhqBp1esFUsV6f6TJUV9eYGOrcpIbKSjnIoxhoQdW07gdJAcxbocUNFKIMWGRB2XMsN0isDYBC0LQVstcVwAih0VOAGILUzTsHBLTygJOD1W3mmDJQbyTgwCsewInB2EuEvzy/2ayd/fR7vzpJ8lmMnKvUgUucko4t+iyaTl5sBc4WMZr+FlXGBKbQGs6WjEGNosxnISSWwm8GVR20YeI+CzCA1hrIdO/00T5zKFk19BhUYuqkDp/ZMcomYtiAY2JPVjOVysZxNg0Eb3jOQhWr6lIctZVnp4QcVAGSonzA2Sg5OtnTZ1bNsnwYVADClhcwJ5vVeh1VSaeNGlSAqHLSoIop9HaLksuJMs6aRhpNDZBy1fLhrKO8lEag95mF3aDcLdWMaO6WhkDWsmokdFrp4bFEwuVuqY4Wo2cDMbqFmsqe2fSCcA4oI6EKiVkvuqSAcr1bopzWi4SpFlVpvsg6om+PGu4rsrKkd5q+kWGQ3cuorYyjPO9RSbGO2ioE2pWVEKHWq4K3WslBVfdqSDOoJsa9KgODqBqqLh4r2ZnTjSpDVarx54hZNIZNLep4sVQN6nDWUYD1mKrq9f9PGhmtR5Wh2Dq/KLVmqoMaq2mbkzrz71G8komvUJ2l82ppFNroVm+VMQRIK8GKmmOdYI2DmXpqFdaVRGAywmvPWCm8nP4Nqoc23ZUlqHq7upSZEdBsNQzL6R/OS1nbbDXU2VbaIsuMbBUDv97CbdbOfhw/HT1snr4/bB42/wNj49tJ8iEAAA==';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for africa/sao-tome-and-principe.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get africaSaoTomeAndPrincipe10m {
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

/// Widget for rendering the africa/sao-tome-and-principe.10m.json map.
///
/// This widget provides a convenient way to render this specific map
/// with customizable projection and styling.
///
/// Example:
/// ```dart
/// SaoTomeAndPrincipe10mWidget(
///   projection: MercatorProjection(),
///   fillColor: Color(0xFFE0E0E0),
///   strokeColor: Color(0xFF333333),
///   onFeatureTap: (feature, position) {
///     print('Tapped: ${feature.properties}');
///   },
/// )
/// ```
class SaoTomeAndPrincipe10mWidget extends StatelessWidget {
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

  /// Creates a SaoTomeAndPrincipe10mWidget.
  const SaoTomeAndPrincipe10mWidget({
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
      geoJson: africaSaoTomeAndPrincipe10m,
      projection: projection,
      fillColor: fillColor,
      strokeColor: strokeColor,
      strokeWidth: strokeWidth,
      onFeatureTap: onFeatureTap,
      antiAlias: antiAlias,
    );
  }
}
