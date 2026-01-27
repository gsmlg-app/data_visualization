// Generated from: assets/oceania/ashmore-and-cartier-islands.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:dv_geo_core/dv_geo_core.dart';
import 'package:dv_point/dv_point.dart';
import 'package:dv_map/src/map_widget.dart';

/// Gzipped GeoJSON data for oceania/ashmore-and-cartier-islands.10m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE52QT2vEIBDF736KwXN2iZpE3VtZKPTU3stSJLG7QqJB7SEs+e4l2U3YP4GSehhGf/MebzwjABy7VuMd4Fet4o/Xe1fXuozGWZwM+PvyHPAOPhEAwHmsz8JxfAStd6320YyiaRwAW9WMgpdwapzXoGwFezUMengLtbJVmE0AsAnuS9FBsJHyCbAFUDobjdU2Duy91Moaha+4n+MdtWt09N19uGmbD1d3x+vys63zlbEq3vzC5dz2jzcAQtk2lzwluUge0IbQbUYFI+IOHJK/DXmeZowuGxZFKv9hWBC6nJAVXJB8taPkPBPLEZnIOVmfcd0voqV+6no01QPq0S/ecnf+AwMAAA==';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for oceania/ashmore-and-cartier-islands.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get oceaniaAshmoreAndCartierIslands10m {
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

/// Widget for rendering the oceania/ashmore-and-cartier-islands.10m.json map.
///
/// This widget provides a convenient way to render this specific map
/// with customizable projection and styling.
///
/// Example:
/// ```dart
/// AshmoreAndCartierIslands10mWidget(
///   projection: MercatorProjection(),
///   fillColor: Color(0xFFE0E0E0),
///   strokeColor: Color(0xFF333333),
///   onFeatureTap: (feature, position) {
///     print('Tapped: ${feature.properties}');
///   },
/// )
/// ```
class AshmoreAndCartierIslands10mWidget extends StatelessWidget {
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

  /// Creates a AshmoreAndCartierIslands10mWidget.
  const AshmoreAndCartierIslands10mWidget({
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
      geoJson: oceaniaAshmoreAndCartierIslands10m,
      projection: projection,
      fillColor: fillColor,
      strokeColor: strokeColor,
      strokeWidth: strokeWidth,
      onFeatureTap: onFeatureTap,
      antiAlias: antiAlias,
    );
  }
}
