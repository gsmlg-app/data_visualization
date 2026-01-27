// Generated from: assets/europe/isle-of-man.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:dv_geo_core/dv_geo_core.dart';
import 'package:dv_point/dv_point.dart';
import 'package:dv_map/src/map_widget.dart';

/// Gzipped GeoJSON data for europe/isle-of-man.10m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE51YTWtbVxDd61c8tHbDfJz5yra00EVK9yUUkypB4EjGVhYm+L+XJ9fBTsYtYy3E07vvHc2dc+brft0sy/Z0d73bvl22v+4uT19udj8fr652H07742F7sS5/fLh9u327/LlZlmX5ev7+8cXz4+eF65vj9e7mtD+/9Pj4smwPl5/PL/x2e7Vbjh+Xd5eHby8ty3Z/e/zrUs4PvPvhvj7c//3pwofj4bQ/7A6nde2XL+u/bv9dvf9mzKfd8fPudHP33JRH2/84Xt19Oh6eox5v/t4fLk9P9vzweXr9/a9l+QlvnIWV9eK7FcMbMi8Tebbw/uL/8KyyENHhpWYWj/GolLPDKyYjm+JFWZS0eIBETvFcU6XH85Qc24eKAjd4TOSmGONpBFeLl3CrKZ6UpHd6YS5KH8IhYJUdvQxKxtR9CENpu11Tho7tg2f29nmxYioXsFh20cFJlGM1a1FEtGophOSUXa1iq45dEaGQmOIFJ5t3eMriY7momyt1/hM1MpnSoVYRbfYTiNiYDoNaWQdnbCo6xUNK7z0roxh7D5RUrfdciXysFvFQ6oJNkhQ0x6My6fHUGGP1MRf3+83g8LFaWEXaWiRlVjW3r0De2acEq3HtVYGXo8NjEopp7VAVTu3xFMJjfo1eSM7KCJ/zayliXfZTDudxtLmGZWueQNLHdASJZBe+ayDmuNXQOIusxUtVTFsrjbA+3NQ5U+f0BqW19lWBaGyfsVLbSoI1CWM5e0RG16qBi3hePNJCueMXbMHjdAoC0NEBKrfpbgEhao0jqGMaHChTayuvpr2irVeqso4LdWe2aWkzg5V1lVe1OHLc1ldqZJdaJNxqnEqdBeZt6XADckqHQ8msxUOBfWyfawW1nYuqIcb2ZTKoKx0iq2On/AaTRL9fIcd4zAoW8b41YHehaa4PZspqWzWqIp/6Lxhwb1shIsU418fq9Y5eToPN6VijoJULh1jpmA5J1hfGQDHHmA4NbjM9C4rGjUYEpbeN0OuG/PDyvrGiCIzJWM3rpELhojWWXrIKtScugYjxSB6JFOpSKYWSj4esKOJeexQsOm4L/gPPNTLH2nMXQXsCZiU6nooCZtX2BeShPp7x1wDN/sQqil6RqgjrmVV74of0cSn3LM92KqJkk+l2PZioXnAfYXyg5uYgaeX8Krk41imrqxzkbmXTzsWVxdounIJcxpXDhcKit68cMQ3f4YHzprt+vLrfPH6/39xv/gFS21alGxgAAA==';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for europe/isle-of-man.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get europeIsleOfMan10m {
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

/// Widget for rendering the europe/isle-of-man.10m.json map.
///
/// This widget provides a convenient way to render this specific map
/// with customizable projection and styling.
///
/// Example:
/// ```dart
/// IsleOfMan10mWidget(
///   projection: MercatorProjection(),
///   fillColor: Color(0xFFE0E0E0),
///   strokeColor: Color(0xFF333333),
///   onFeatureTap: (feature, position) {
///     print('Tapped: ${feature.properties}');
///   },
/// )
/// ```
class IsleOfMan10mWidget extends StatelessWidget {
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

  /// Creates a IsleOfMan10mWidget.
  const IsleOfMan10mWidget({
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
      geoJson: europeIsleOfMan10m,
      projection: projection,
      fillColor: fillColor,
      strokeColor: strokeColor,
      strokeWidth: strokeWidth,
      onFeatureTap: onFeatureTap,
      antiAlias: antiAlias,
    );
  }
}
