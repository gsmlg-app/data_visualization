// Generated from: assets/asia/macao-s-a-r.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:dv_geo_core/dv_geo_core.dart';
import 'package:dv_point/dv_point.dart';
import 'package:dv_map/src/map_widget.dart';

/// Gzipped GeoJSON data for asia/macao-s-a-r.10m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE7VZy2obWRDd6ysarYOp9yM7E5hdmGFmOYRBZJQgcCRjKwsT/O9DK7HHsVUXUo21EN19u49KVafOrar+tpqm9fHuert+O61/226OX2+27w5XV9uPx91hv34zL3/6fvl2/Xb6ezVN0/Tt9P3ywdPtp4Xrm8P19ua4Oz30cPs0rfebL6cH3m8+bg7TXxeXF38+PjRN693t4Z8NnW74/cV1Pl2/fPd04eNhf9ztt/vjvHZ5u9usf6zdP5ryeXv4sj3e3P1syIPl779eHXd/HK7uPv/4t4/Ah5t/d/vN8cnf/v55evz87OX5NCHyhWoYiLx5sUh0gcbAyM+WPjy/twKmBPcCWIMjm8BC6VlaHCDSBUZhxgKYmNOawCzCpY+RALo+ZiJ2Og+sZCj+KsDK3LZYECLPA0t4ZLRZQWIVMASKtoGZgitgZ8YusJLGeVwUEm7nByK4FcBM5t3YCTtiYTG4JbVjZwFSsA2UndsZnWhSxG4RsKJSCWwo1pUKJVIrVHORj9U5uABGRMWuK4wHnkjMrgSZMau+gidMMa1gG5KhdfPDzKzYPtDZ+45woWL3IGaNrrI5pFdpR4B9BXIBs0qBkh26oXNPp0LkCRK9q8XuElJYTGbarimCNaIgBTGjd10RmlICCyR0gxcuWSU0SVjbEyNcJ2rjmgUUOkGp0tb4kYcZU6RNtnTjIu8YE9oWu0RAoRSswNZWikHecUBEVzKHwGncrtqclEpXOKNSV43duKquOMGkvS0BVaQQVLFuPg/2ZwUN6LLYPAKLgmIRsKNHUWUqRWabEoNdSQ3bBdAI18CV2ht/CnmRHIuAf73nX1VnP/1kawDBJlZ0hIQO1t4hWUnifEYRilF7J6NIgPMBf0VgDm133SQsfF4ECEkVu2pIzlowicBV2rU0U0QVvLnQa9emTOCVxXNf0a5NmR0qti3CHdB4mYvngqCK3dzftkmhAlhsZcmzwLRpHIyF0iaDQbfrpjlvC1yQbLcVBJhVeRMSgV0WY4Z5oeDBLtT2hLgWNJ57WG533aPYOQf22VaLJnpYe/4wUKBluJoBRd0UZP2umzOimoAuAh4N3EMwoRs6CeFqoBgBqu0CZzCei1Trv9QYAOc8d+0Wp2PgiLa0DYEFM7usUHCs+u7UsOiyYjQCTZf+JF85oFLjZRaPgM2kTzdHzvM+JiBpc2IUukiDbt6N5u2Zztx+Q1ArBQGBtl/CDNKDQAS5zQkLrIorVo22tKlmVcovKgcHJCZEyb4narYt62pkfoNWtUs2j9JeA9jNo8s2jsRiKkUE7m2V//UmelWd/X/8cHS/evj+sLpf/QdImy5SmCEAAA==';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for asia/macao-s-a-r.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get asiaMacaoSAR10m {
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

/// Widget for rendering the asia/macao-s-a-r.10m.json map.
///
/// This widget provides a convenient way to render this specific map
/// with customizable projection and styling.
///
/// Example:
/// ```dart
/// AsiaMacaoSAR10mWidget(
///   projection: MercatorProjection(),
///   fillColor: Color(0xFFE0E0E0),
///   strokeColor: Color(0xFF333333),
///   onFeatureTap: (feature, position) {
///     print('Tapped: ${feature.properties}');
///   },
/// )
/// ```
class AsiaMacaoSAR10mWidget extends StatelessWidget {
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

  /// Creates a AsiaMacaoSAR10mWidget.
  const AsiaMacaoSAR10mWidget({
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
      geoJson: asiaMacaoSAR10m,
      projection: projection,
      fillColor: fillColor,
      strokeColor: strokeColor,
      strokeWidth: strokeWidth,
      onFeatureTap: onFeatureTap,
      antiAlias: antiAlias,
    );
  }
}
