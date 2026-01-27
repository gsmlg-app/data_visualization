import 'package:flutter/widgets.dart';
import 'package:dv_geo_core/dv_geo_core.dart';
import 'package:dv_point/dv_point.dart';

import 'map_widget.dart';

/// Widget for rendering world maps.
///
/// This widget provides a convenient interface for displaying world maps
/// with common default styling. It wraps [MapWidget] with world-specific
/// defaults.
///
/// Example:
/// ```dart
/// import 'package:dv_map/maps/world/110m.dart';
///
/// WorldMapWidget(
///   geoJson: world110m,
///   projection: Mercator(),
///   fillColor: Color(0xFFE0E0E0),
///   strokeColor: Color(0xFF333333),
///   onCountryTap: (country, position) {
///     print('Tapped: ${country.properties?['name']}');
///   },
/// )
/// ```
class WorldMapWidget extends StatelessWidget {
  /// The world map GeoJSON data to render.
  final GeoJsonFeatureCollection geoJson;

  /// The projection to use for rendering.
  final Projection projection;

  /// The color to use for filling countries. Defaults to light gray.
  final Color? fillColor;

  /// The color to use for country borders. Defaults to dark gray.
  final Color? strokeColor;

  /// The stroke width for borders.
  final double strokeWidth;

  /// Optional callback when a country is tapped.
  final void Function(GeoJsonFeature country, Point position)? onCountryTap;

  /// Whether to enable anti-aliasing.
  final bool antiAlias;

  /// Creates a WorldMapWidget.
  const WorldMapWidget({
    super.key,
    required this.geoJson,
    required this.projection,
    this.fillColor,
    this.strokeColor,
    this.strokeWidth = 0.5,
    this.onCountryTap,
    this.antiAlias = true,
  });

  @override
  Widget build(BuildContext context) {
    return MapWidget(
      geoJson: geoJson,
      projection: projection,
      fillColor: fillColor ?? const Color(0xFFE0E0E0),
      strokeColor: strokeColor ?? const Color(0xFF999999),
      strokeWidth: strokeWidth,
      onFeatureTap: onCountryTap,
      antiAlias: antiAlias,
    );
  }
}
