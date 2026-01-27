// Generated from: assets/oceania/guam.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:dv_geo_core/dv_geo_core.dart';
import 'package:dv_point/dv_point.dart';
import 'package:dv_map/src/map_widget.dart';

/// Gzipped GeoJSON data for oceania/guam.10m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE62XS2sbQQzH7/4Ui88h6P3ItdCeSnvpqYRi0m0wJN7gOIcQ8t2LnQd5KFAt9WFZj2Z+aEb/kbR3i2FY7m6vxuXJsPw8rnY32/HTdHExnu3W02Z5tDf/eRi+Xp4MPxfDMAx3h+f7hYfpB8PVdroat7v1YdHT9GFYblaXhwVfblaXz7OHYbm+nn6t6GD58W6cH8a/vjScTZvdejNudnvbt7NxtVmvlo/m+2c3zsfpctxtb1878eT19+ni9vxxk8/Yaft7vVntXuz24ffy/e2/YUCR4wgT4Dh6a+JjEyAQemU4PfoHIBhpCVRBgj7QzCFrIAOhtYEKwh9smV1mbJnDmL0CMrl69oFEIFYBCcypD0QkCC2Aqmyo/TMEJmaugJzIXZynIEZ1gkoOod4GBot6VkA0s/YBOoU7SMGTUA2MNhAlVEqgs6hhF2gq4kAVkBNVpA0UMNZKhMIe2L93xiahpYfCCH3VGIU5VaoRDo9oX2QjwbQqMwgjYbajbCzuVm6ZWCnnBEWcKl0LikdfNaKKUcoQRMJmOOjiWKmG04isH2QxySpzscf+CvV5DF5phk0dop1pjE3Nyg2rCko/JGSMpapZlI1neMjGVmmGhRBC+8CUtCr5M7vYjGsiQlkHhdEQ/qcKSSKtn7uU1RULIIXDnCiruUQVFAoCyXaFMgchqHIXmQT3YxJgLlVMSMx9RvpPVypLKAkC99suxwCKKrmSYEi/JLMalLImSXTqdzUGCFiGJNQY2kfoluxZqXA/zNa+yR+3SUKwL139vjDIo6ygoh79xiscg+uSHIoubWCCZZaN66zGMNnNuVK1Gij3W/VUQi1jrGGh/ZYhFROlbIUz1PtdUrIIlvdOM4OzLZpEYfQqJgazSug+w2tZTww9w9tn2PxKXlTvT2/3i6fn6eJ+8Rd70f3ZyxAAAA==';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for oceania/guam.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get oceaniaGuam10m {
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

/// Widget for rendering the oceania/guam.10m.json map.
///
/// This widget provides a convenient way to render this specific map
/// with customizable projection and styling.
///
/// Example:
/// ```dart
/// Guam10mWidget(
///   projection: MercatorProjection(),
///   fillColor: Color(0xFFE0E0E0),
///   strokeColor: Color(0xFF333333),
///   onFeatureTap: (feature, position) {
///     print('Tapped: ${feature.properties}');
///   },
/// )
/// ```
class Guam10mWidget extends StatelessWidget {
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

  /// Creates a Guam10mWidget.
  const Guam10mWidget({
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
      geoJson: oceaniaGuam10m,
      projection: projection,
      fillColor: fillColor,
      strokeColor: strokeColor,
      strokeWidth: strokeWidth,
      onFeatureTap: onFeatureTap,
      antiAlias: antiAlias,
    );
  }
}
