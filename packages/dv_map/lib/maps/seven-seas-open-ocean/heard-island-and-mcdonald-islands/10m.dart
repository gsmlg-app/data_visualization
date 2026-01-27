// Generated from: assets/seven-seas-open-ocean/heard-island-and-mcdonald-islands.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:dv_geo_core/dv_geo_core.dart';
import 'package:dv_point/dv_point.dart';
import 'package:dv_map/src/map_widget.dart';

/// Gzipped GeoJSON data for seven-seas-open-ocean/heard-island-and-mcdonald-islands.10m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE52YTYsbRxCG7/oVg04JbER9f/gaE5KDIZBjMEHsToxAnlkkJbCY/e9htN5lbdcQygINo+7pZ7q63qrq1qfNMGwvD/fj9s2w/WXcX/45jT/Px+N4eznM0/Zm6f77qfm8fTP8uRmGYfh0vX478Pr4teP+NN+Pp8vhOuj58WHYTvuP1wG/jvvT3fDb+bif7obl++727Tztj89t5xfUMGwP5/mvPV2HvfumnZ/a377uuJ2ny2Eap8vS98f47zgN53F/Hn6Y78dpmG/H/fTj9vPjjy9z/jDOH8fL6eHLGT+b+Pt8fPjweUVeXjOf7g7T/vJqaZ4+r++//jUMzjtnRYybrzp+Ut4hknzR/P7m/2CWKc5a0gBC2ryIdC15kEAm1gUas4CXQEcxjS5Q1SCtBJqnWdtkARTnEqjgyO0ZMqlnyRNBoi6OIAVrgzlNDJtAzZBYcQlzWLSB4epaA8k8uguoJoQrLkZzD+4Cwc1AaqAyclczEovSas1AspN3gQ5EK3FHqJ5toDgwYQ0MSOg6WUiNcgWoTNzVtSCFUu2U71tDMiVZcQpjeFeHgpTMRaqmXeYyeW0COVPDC5MXIGRA12SORIeVGXqg9YGSXOcuZMR2rmF3Uap5i+S7gceGkFKnBkiCzC5QRF1WXGKK7YLH7GhRuyTUvW8yL5W3SA0LUDzbFZTSIrRYQ9qloUFb1mTJXqUG2qUruXTzNbEBciGbxWQCiq6XSdAhy00XABFiN3mRsjnVJQ8VLNsmOwLYSg1Fl75sKMJqi0nBvyNOnL2OZEqi7EeyCGMNZKfopxoV9JV9nAhBu8izMsVKCVW0hD4wHXEFGKHYjWR2JPMaaGKUbaCxB9RAlwDqypp9ffOaoBDtIg+CImWcICeztYs8gzDUJyhTSm9vlAQwrRQ2OlO/AIgzZ5bCxkgi6saygjNLfQRNUs1uAdCAoDqWMVxTu7IxSJUo94boGSbtQ5ShMdayETPDrpcDCUPLSEEMBe6uoUeCcw0k0PYp1G0Rx9oEE9vZq/O/xaa6f7573Dxf328eN/8BEl56DoYSAAA=';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for seven-seas-open-ocean/heard-island-and-mcdonald-islands.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get sevenSeasOpenOceanHeardIslandAndMcdonaldIslands10m {
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

/// Widget for rendering the seven-seas-open-ocean/heard-island-and-mcdonald-islands.10m.json map.
///
/// This widget provides a convenient way to render this specific map
/// with customizable projection and styling.
///
/// Example:
/// ```dart
/// HeardIslandAndMcdonaldIslands10mWidget(
///   projection: MercatorProjection(),
///   fillColor: Color(0xFFE0E0E0),
///   strokeColor: Color(0xFF333333),
///   onFeatureTap: (feature, position) {
///     print('Tapped: ${feature.properties}');
///   },
/// )
/// ```
class HeardIslandAndMcdonaldIslands10mWidget extends StatelessWidget {
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

  /// Creates a HeardIslandAndMcdonaldIslands10mWidget.
  const HeardIslandAndMcdonaldIslands10mWidget({
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
      geoJson: sevenSeasOpenOceanHeardIslandAndMcdonaldIslands10m,
      projection: projection,
      fillColor: fillColor,
      strokeColor: strokeColor,
      strokeWidth: strokeWidth,
      onFeatureTap: onFeatureTap,
      antiAlias: antiAlias,
    );
  }
}
