// Generated from: assets/asia/siachen-glacier.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:dv_geo_core/dv_geo_core.dart';
import 'package:dv_point/dv_point.dart';
import 'package:dv_map/src/map_widget.dart';

/// Gzipped GeoJSON data for asia/siachen-glacier.10m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE5WWy2obUQyG936Kwet00P2SXSm020KXJRTjTtMBxw6Ouwgh717sxCFJBUVeDOPROR/S0S/pPCyGYXm4v52Wl8Py87Q6/NlPn3abzbQ+zLvt8uJo/vX0+W55OXxfDMMwPJye/248LT8Zbve722l/mE+bzsuHYbld3Zw2fJtX69/TdviyWa3naf+ycRiW893ux4qOiz5k/mPgwrDebQ/zdtoejraPd/Nq+Wx7fPHnetrdTIf9/Vtvzu5/3W3ur5+jfWHu9j/n7erwKuyn3+v39/+GwX0EiXS8eGdgHRFBhN58v7r4H01ITMMLHAMlcTR5AcBiXPAkVUCtyXNndc+SdzwH7vIMWCJqHiR143VxobSSJ0wgXR6aM5f+uQpY1z+LNFWpeEaW0vXPDAyZKp4GpHb1p5gGUfLchbPPI8zQkhei6t36cBOO8vzc0dr1IUjuXJWvWApSV88c7AxlfThmWvf8WAkASz2HgRJ2eaAcWZ2fogdz1z8KRMAqv0oByF09k0JgVvlQBgfo9it0V6nkrMSo2pULCpJp6R4pu2eXB0oZVXtW9oxudUASuVbdSsUDVLs8R4iyetURILpqAQ20Wn0BCNytNuAEqdUSCkjteNFVsZq+GqKZvWqzMd0EvUyvh6n14rUxWT3L6aaexs182JioQFrHy6jU5UWaEJXlFmmIPT3bGAEKpZ4NwBx6+bUx9NjUK/0ZhXpzGtkYQhnlbc0EKaKrlyDRxGp6mLhn9rqpjR4U7GW8os7N6WajH69/UMdr2M9vIqOV05I9yK3bTlt38UX1fn57XJyfV4vHxV+X+ga3Nw0AAA==';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for asia/siachen-glacier.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get asiaSiachenGlacier10m {
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

/// Widget for rendering the asia/siachen-glacier.10m.json map.
///
/// This widget provides a convenient way to render this specific map
/// with customizable projection and styling.
///
/// Example:
/// ```dart
/// SiachenGlacier10mWidget(
///   projection: MercatorProjection(),
///   fillColor: Color(0xFFE0E0E0),
///   strokeColor: Color(0xFF333333),
///   onFeatureTap: (feature, position) {
///     print('Tapped: ${feature.properties}');
///   },
/// )
/// ```
class SiachenGlacier10mWidget extends StatelessWidget {
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

  /// Creates a SiachenGlacier10mWidget.
  const SiachenGlacier10mWidget({
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
      geoJson: asiaSiachenGlacier10m,
      projection: projection,
      fillColor: fillColor,
      strokeColor: strokeColor,
      strokeWidth: strokeWidth,
      onFeatureTap: onFeatureTap,
      antiAlias: antiAlias,
    );
  }
}
