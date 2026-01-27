// Generated from: assets/asia/indian-ocean-territories.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:dv_geo_core/dv_geo_core.dart';
import 'package:dv_point/dv_point.dart';
import 'package:dv_map/src/map_widget.dart';

/// Gzipped GeoJSON data for asia/indian-ocean-territories.10m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE7WYTWvcaAzH7/MpzJxTI+nRa2+lsLCH0j3sbSnLkLrFkNph4h5CyXdf7DTdNrEoKGQOZjx6/BtZj/SX7G+Hrjsut9fD8XV3/GM4LV/Pw9v56mq4XMZ5Ol6s5k/3P98cX3f/HLqu675tx6cXbss3w/V5vh7Oy7hd9LC8647T6ct2wZ/Tx/E0de8vh9PU/T2cz+Myn9fVF/+vHW/mf0+0rn4V8cTQdgyX87SM0zAtq+3NzXg6frfd/XDs8zB/GZbz7a9uPdzHu69Xy/jXfHX7+fu9/wDP54/jdFp+CsL95+fvj8+ennddaO/akAIvntheIfXoaE3ike3D48X7YDZVjQxs6M41cFMMahmYQFGKYGwQnIAN2anIFUKxhKsgZlgDUzizJmBm1uZFsDcLT8BNG8lLgElFoRhjQuH2IuDGKFmMBcK4mhXrxmfJFsGixboTIpEEHKauxfLQaCFZebgFQTEpChJ0yM5++cuCHgYQBmb7HREqtWINbIGQhS9YkGobHgRomnnsHIFFjwnBMKspa4LFTApU9KwzKFpYLZECWRRTAX+GwxBAltXUM1pOAIClrcHVvNrL3AUjBRs3qoJDJS3WIIdW1K2gljezEA8tpnGhol9GXhCkN2BEoj1voOcGzhUVXcnqQi0DMzSlQqPawBrk+2UFPYtSw8Ikt5GFRfa3BnrWCGitSCZbu35G9iC1InnVRN8dP9doOJMXCmAlSzDxvi6uZIbGhQr4PVnVKIo7KBGa5ZyDaN1jopDd3gM9h7Nacf/E1wazq4zQC7CjVGPhHJZls6A2K9cJbF08IwNQq2YzOTontS2win1VjjhIMck5wYZY0fN7PWKwlkbD2a2sdEa8/8wKvbS2Pm8Vyev0kamzcIBr1WdzozTrVAHLGhosAVmlKLtVgxHhvj8KQy/SWkTZZQuyRJyFPFyKZAPNXg6sScckUhiofkvmYCq9gdnIiNw0Iz+nvW7N1ZISZIFgLAqSIWsyra3zUfG1UXXyyufAw+Nvd4eH44fD3eE/MZtc0MoUAAA=';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for asia/indian-ocean-territories.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get asiaIndianOceanTerritories10m {
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

/// Widget for rendering the asia/indian-ocean-territories.10m.json map.
///
/// This widget provides a convenient way to render this specific map
/// with customizable projection and styling.
///
/// Example:
/// ```dart
/// IndianOceanTerritories10mWidget(
///   projection: MercatorProjection(),
///   fillColor: Color(0xFFE0E0E0),
///   strokeColor: Color(0xFF333333),
///   onFeatureTap: (feature, position) {
///     print('Tapped: ${feature.properties}');
///   },
/// )
/// ```
class IndianOceanTerritories10mWidget extends StatelessWidget {
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

  /// Creates a IndianOceanTerritories10mWidget.
  const IndianOceanTerritories10mWidget({
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
      geoJson: asiaIndianOceanTerritories10m,
      projection: projection,
      fillColor: fillColor,
      strokeColor: strokeColor,
      strokeWidth: strokeWidth,
      onFeatureTap: onFeatureTap,
      antiAlias: antiAlias,
    );
  }
}
