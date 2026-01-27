import 'package:flutter/widgets.dart';
import 'package:dv_geo_core/dv_geo_core.dart';
import 'package:dv_point/dv_point.dart';

import 'map_widget.dart';

/// Widget for rendering individual country maps.
///
/// This widget provides a convenient interface for displaying country-level
/// maps with appropriate default styling. It wraps [MapWidget] with
/// country-specific defaults.
///
/// Example:
/// ```dart
/// import 'package:dv_map/maps/africa/nigeria/110m.dart';
///
/// CountryMapWidget(
///   geoJson: africaNigeria110m,
///   projection: Mercator(),
///   fillColor: Color(0xFF4CAF50),
///   strokeColor: Color(0xFF2E7D32),
///   onTap: (feature, position) {
///     print('Tapped country region at ${position}');
///   },
/// )
/// ```
class CountryMapWidget extends StatelessWidget {
  /// The country map GeoJSON data to render.
  final GeoJsonFeatureCollection geoJson;

  /// The projection to use for rendering.
  final Projection projection;

  /// The color to use for filling the country. Defaults to light green.
  final Color? fillColor;

  /// The color to use for borders. Defaults to dark green.
  final Color? strokeColor;

  /// The stroke width for borders.
  final double strokeWidth;

  /// Optional callback when the country is tapped.
  final void Function(GeoJsonFeature feature, Point position)? onTap;

  /// Whether to enable anti-aliasing.
  final bool antiAlias;

  /// Creates a CountryMapWidget.
  const CountryMapWidget({
    super.key,
    required this.geoJson,
    required this.projection,
    this.fillColor,
    this.strokeColor,
    this.strokeWidth = 1.0,
    this.onTap,
    this.antiAlias = true,
  });

  @override
  Widget build(BuildContext context) {
    return MapWidget(
      geoJson: geoJson,
      projection: projection,
      fillColor: fillColor ?? const Color(0xFF81C784),
      strokeColor: strokeColor ?? const Color(0xFF388E3C),
      strokeWidth: strokeWidth,
      onFeatureTap: onTap,
      antiAlias: antiAlias,
    );
  }
}
