// Generated from: assets/north-america/united-states-virgin-islands.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:dv_geo_core/dv_geo_core.dart';
import 'package:dv_point/dv_point.dart';
import 'package:dv_map/src/map_widget.dart';

/// Gzipped GeoJSON data for north-america/united-states-virgin-islands.10m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE7VYTWsbZxC+61csOqfLfH/kVgqFHBJKS3MpoQh76wpsycibgwn+72Xl2CT2ziED1UFo9e4+Gj3zzMzzvl82w7Cd72+n7dth++u0mz+fpl+O19fTxbw/HrZvluV/Hr++274d/toMwzB8Ob+/fvB8+3nh9nS8nU7z/vzQ0+3DsD3sbs4P/HnYz9Pl8Me8m6e74eP+dLU/DO/urneHy7tnlGHY7u+Of+9oeeLju1ff8+P3v3+7cHE8zPvDdJiXtQ/H0/zv8PPNdNpf7LZfb3p4DvJqOt5M8+n++xCf/tP7z9fz/rfj9f3VVx6ef+F4utwflsCfCXl8ffv55dXr62H4yWRUTU7LN68W0UdXNGR/sfTp5b0d4BBJawInehivA1tQWhPYGNIh1oEdmBGbwGYJQEXEFCHRBI50KwIWcfdm7iwTRKXIHQWL9IB9YdgKJjQIVJvADB7sBcVK0Qa2RJWCiiWr2hSFOxqbFsBklNwETpWAovDCVZq4gS7KVpSHIGoXmMOSCxmbBDerI9xEpRCba1hTEhFiTAXB5hHZLLsIt5BCxKrk2mUizKhqFChClO2IQ3xdxJYZ7V4cqei4ToUFeRvXjb3InUVie9yZgxIW1YFODE21mYQn4zowsQM0y87AFrEW04Oo2zE1FFOKxiaRFk0VN6zKprr67ic7vskBMnntX8bIQunWNQsuuGZuYmQWsW6lmgEnVMDmxNQFFjWsiLAk7wIHiVMRsRoAdxlOL3QUIxuRcJNjR1aMtR6wACtEl2MXS131YzGys3bjVU3kAtYS1JqV6orOqxZ9AUaL7BJhaRJF6tQ0ukzE4sUKJiTdqam1AKQoioOCupbpHK+vWZsYGZUIu5ljI4aCCEzXtoRBAHRtjMXIy94K+tUstDofF4pN2zuVQIOilgVQuvuJH58b/98Qi2UPsmaylmSLUdfQGzBSkRIMTejaTUWBKGXv0ZV9CIBnkW1cXEtT9qGSsbq3eZQRZVOfkSjr28elE2ZaNCNOCgUpIg5g657bpAJQFEMhTDO6wItZXd3wLtMxILvJSzLArOajoXI3YpYsGDbudtiFX6j8krN2O2GGmVSwEsStLqEjIIZXabPQ7J1e6QiCkpWtUTaN1qjREUgZKvfBkdT1/JlsVb+UAGpnDk2q0ciqGs0Gn2aQ1TBncu76mhTR0KI02By7h1fJWtYGg0Q7cwzBVX/nVIVu7ghDK60tm3NpHlQkgqQXwKiu3UPj8AjOYjiDiHRPQH7YpdSGafPy08Pm6f3T5mHzH1r823WNGgAA';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for north-america/united-states-virgin-islands.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get northAmericaUnitedStatesVirginIslands10m {
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

/// Widget for rendering the north-america/united-states-virgin-islands.10m.json map.
///
/// This widget provides a convenient way to render this specific map
/// with customizable projection and styling.
///
/// Example:
/// ```dart
/// UnitedStatesVirginIslands10mWidget(
///   projection: MercatorProjection(),
///   fillColor: Color(0xFFE0E0E0),
///   strokeColor: Color(0xFF333333),
///   onFeatureTap: (feature, position) {
///     print('Tapped: ${feature.properties}');
///   },
/// )
/// ```
class UnitedStatesVirginIslands10mWidget extends StatelessWidget {
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

  /// Creates a UnitedStatesVirginIslands10mWidget.
  const UnitedStatesVirginIslands10mWidget({
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
      geoJson: northAmericaUnitedStatesVirginIslands10m,
      projection: projection,
      fillColor: fillColor,
      strokeColor: strokeColor,
      strokeWidth: strokeWidth,
      onFeatureTap: onFeatureTap,
      antiAlias: antiAlias,
    );
  }
}
