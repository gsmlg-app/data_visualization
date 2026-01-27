// Generated from: assets/oceania/vanuatu.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for oceania/vanuatu.110m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE51SO2vDMBDe/SuE51Tc6XGSsha6lXZou5RQTKoGg2MFRx5CyH8vcR6ktjJUGoTuvrtP9/j2BWNl3G18OWflk69i3/nH0DR+GevQlrMj/HNyb8s5+ywYY2w/3NPEIXwANl3Y+C7WQ9IlnLGyrdZDwkfV9lXsrwmMlfU2fFViAN8nfnnyv90Cy9DGuvVtPGIvS1+1dVWe4cO1kpUPax+73d86LoU/902sX0OzW52bvXKH7rtuq3jT9encvsfW1GYMyXCBZAHVbAI+oObWoVUkRthiHJxmRgsAxqaYiaN2zulMZo0aLWKaWTtjlaM8ZquUNWTSzIpISol5zDlzLu5Zf/78/9aJGydRJ1ejOZG1CCavTQAUYOQdZlQEIneABkDY5NI1NwpAgM0UKhiDIrkaxZ2UTkCWUImTcCiTalKcBClnsoZBnJSz2on0MKQTBqTOY85Qxn2ZFuPXobjci+JQ/AKz8p9i4QUAAA==';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for oceania/vanuatu.110m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get oceaniaVanuatu110m {
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
