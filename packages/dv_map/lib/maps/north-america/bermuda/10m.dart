// Generated from: assets/north-america/bermuda.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:dv_geo_core/dv_geo_core.dart';
import 'package:dv_point/dv_point.dart';
import 'package:dv_map/src/map_widget.dart';

/// Gzipped GeoJSON data for north-america/bermuda.10m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE7VZTW/bZgy++1cIPncFvz962wr01mGXnYZiMFKtM5BYgascgiL/fZDTBGkiDiiN+GBYeqVHNF/y4UPq22YYtvPt9bh9N2w/jLv55ji+ny4vx4t5Px22b5blf+5Pf92+G/7aDMMwfDt9v7zxdPlp4fo4XY/HeX+66eHyYdgedlenG34bj1c3n3ePNwzDdv91+ntHp8WPL87z/fk/ny5cTId5fxgP87L2+3Sc/x1+vRqP+4vd9vtFd4/2fBmnq3E+3v5ozYP5H28u5/0f0+Xtl+9/+fEJ0/Hz/rCbn/z3+8/T38+PXh4Pwy8mb80N0ujNi0Wmtxxh6vls6dPzawvgdFJdx3VWQurhOjIyFQabsFIXmAgICmAlRbQmMBuH4zqwcCBwE1jQNHMdmBm8i8sp4bGOS2EpbU+Ic3gB7A7Utpgio/SEM2M3KMS42jsOD3uNMBYycW0Cg3JAkXhsoNHdPOQE52LzUiy9CxyqUQGzaTvaNDMLTxBFQHTzDsioiDYSEO5arEgIRbQhG6k0gQ2DK25DSM6uKwJQoKAKYMEuGwdCsBS4rppNTwRyWhXFwOnRBQZlt3VPULKQdBM6RUnWw5giVaKbd55AuB4UlAjZrPwekMjr6UHhKk2SD2BQXN86cs3gLjCmo68HG5mLWnPrghIwK2CzwK7FS73TYus0HaS5dyEWEusMRCpm1rVY3aEoS+cBm1CUPibBroANY2RYFytkCeBNlo9FXFnhY/MQaYqV/wV2SJEmy4c5ABU+doqgJgWFE0hlsLFDe+8ywIpo84XkX8MTZ3BmaEBUxcMt2ubWycHAiO1Qs0iBCjiSvGuxk1DYK1js6UlF7wEqnN10dlGJKiT0DJJ3T7eqjhp4V2aGmxXaijwSsZvNoVkxcZB6WwsGRXJV+NGxnXVuDFJYrO5mbf6BACyITSKUuopCEp3X04MkpK1UWEC9iDUJcG/L4iSlwmA1Quv2SosGkgL4HNHmxgnF5OqsMPZFqhctPyUjdgWFC2jRjQKIYLe3Q4eqtUNVtCZNWEZZOsjYssnw5ss4pprViEI0idhSErXwBGdyu7UDyawGCcLA2h1bQUAWNMGKatie6qKQFzMV47TuaNBCiao5tDq7dqMtwKMKY0PnbjqbOWfRNbJGUtcTBkJQBIWyZHdWY6pu1bhYgTO7nlDlKEQxay6TqyawLAW60GwWRF1P/PxLj0119MMjO29gAlW0Uk3hfZVHEFEME2kpRNyVY5QCpS5NNOxKdCYFL0r6mRYvU7QCGD29azGBJJXAQF2eDURMqFxBGF2eDSAzLqYa51jsy6y9GpcEs/QV5OnFUNUGiUR38xDTtLI4k9sjqZ/O6JpdNs9/3W0evj9t7jb/AfEU2BkqHwAA';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for north-america/bermuda.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get northAmericaBermuda10m {
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

/// Widget for rendering the north-america/bermuda.10m.json map.
///
/// This widget provides a convenient way to render this specific map
/// with customizable projection and styling.
///
/// Example:
/// ```dart
/// NorthAmericaBermuda10mWidget(
///   projection: MercatorProjection(),
///   fillColor: Color(0xFFE0E0E0),
///   strokeColor: Color(0xFF333333),
///   onFeatureTap: (feature, position) {
///     print('Tapped: ${feature.properties}');
///   },
/// )
/// ```
class NorthAmericaBermuda10mWidget extends StatelessWidget {
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

  /// Creates a NorthAmericaBermuda10mWidget.
  const NorthAmericaBermuda10mWidget({
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
      geoJson: northAmericaBermuda10m,
      projection: projection,
      fillColor: fillColor,
      strokeColor: strokeColor,
      strokeWidth: strokeWidth,
      onFeatureTap: onFeatureTap,
      antiAlias: antiAlias,
    );
  }
}
