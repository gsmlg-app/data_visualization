// Generated from: assets/north-america/saint-lucia.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:dv_geo_core/dv_geo_core.dart';
import 'package:dv_point/dv_point.dart';
import 'package:dv_map/src/map_widget.dart';

/// Gzipped GeoJSON data for north-america/saint-lucia.10m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE52XS0scQRCA7/srhj2boR7d9fAmQk4SAjkGCctmYgZ0R9bxIOJ/D726ok5J6N7D0NuPj+p69+Oq69bzw+2wPu3WX4fNfL8fzqfr62E7j9NufVKW/zxP361Pu5+rruu6x8N3efCw/bBwu59uh/08Hg4dt3fdere5ORz4sRl3c3dxvx03r4e6bj3eTb82VDZcnC/m+Xn+7O3CdtrN427YzWXt27Sf/3ZnN8N+3G7WL5ueXmW6GqabYd4/vJfoeIXv0/XD1cuNX+HT/ve428xvrv78ezv++K/rvgj0ZqLm+eTDEqYeEECV3i1cnvwf6ECgITATMTUAyTWlCChJjLkW6IDAiBFQmR2reYjOEuI8ecr1PBNwioBmKUmqByZk5gCIkMW9msecJFQgIppxPTCpEEY3RiCyeosogYYWEUPAeo9RAYlNLIhWbxB1F/eIlzhTg8sYMcVALj4t9UAlT2GMMGW26ih2V8iuEZAURSttjD0AkVjIY2TTah6JACwF5KILVqoXkHPOtEyE3LskR6xUIfaQPaktw5h7ZyR0qwZKcoalDrl3VAZuAEoJ/wgIDlAZd9iDZkddeiGXKsMilYmmAC0TRio0dTWtDLwDEDEoTtybuGADL2fHZaYpPCbRBhWSpiD3c2/ZiLA+ThQxS3jjjOrUAATIGgWeMYE3RPLnEhJ6m9d8ZmQQhoZI1kRgkV9rSTbUEHiGkCK3USe0Bit/mhrUxLnByslQJMqGKsoEDTWeWWMdsrl7pYTQe84gQePKvWKS6gpVgKXRjEKvFZgUEKL0qijkqf7KqSTEUEIixIbWmlEzhUYRYML6TokUkaPQU3GnVN+HEFmKdagkjg3dPzBYKKEKQsNzApRcQ6OoMtWW+QIs3Xocy4lSvR+aE0FcRZnRa4tUAWZwiMuylrdGNdA4ToeeU0Kuf4MaucRAA0Gt7q8rn92raHwcPa2O38vV0+ofSXQUGSkRAAA=';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for north-america/saint-lucia.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get northAmericaSaintLucia10m {
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

/// Widget for rendering the north-america/saint-lucia.10m.json map.
///
/// This widget provides a convenient way to render this specific map
/// with customizable projection and styling.
///
/// Example:
/// ```dart
/// SaintLucia10mWidget(
///   projection: MercatorProjection(),
///   fillColor: Color(0xFFE0E0E0),
///   strokeColor: Color(0xFF333333),
///   onFeatureTap: (feature, position) {
///     print('Tapped: ${feature.properties}');
///   },
/// )
/// ```
class SaintLucia10mWidget extends StatelessWidget {
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

  /// Creates a SaintLucia10mWidget.
  const SaintLucia10mWidget({
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
      geoJson: northAmericaSaintLucia10m,
      projection: projection,
      fillColor: fillColor,
      strokeColor: strokeColor,
      strokeWidth: strokeWidth,
      onFeatureTap: onFeatureTap,
      antiAlias: antiAlias,
    );
  }
}
