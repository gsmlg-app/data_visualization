// Generated from: assets/europe/malta.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for europe/malta.50m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE52Uu2rDMBSGdz+F0ByMzkW3rKWdGujQrYRiWjcYHDs4yhBC3r3YuZDY8iINQtJ/9OnX0UGnTAgZjrtSLoV8K4tw6MqXtq7Ln1C1jVz08t9leS+X4isTQojT0E83DuGDsOvaXdmFath0CxdCNsV22LAq6lDcw4WQ1b79LnCQPifrNKy/Pwk/bROqpmxCr70e+vPkVT3fbWzKdluG7vhs4uZ6dahD9dHWx831pnd02/1WTREernxpj+PxbDoXAjjXxiAov5hopHOn0RLzSFqPY+NcsgrAxrnOoPWUxGV2RN5FuV5bRvBJXNKAxus41zoGl4hFYorbdRbRaJOWBjKMeoaLYKy3ic+GFniOqxA4LQ8JZZbNzZ5OTCh5AmJrTMSLyRVa7WxiCaFy3nGcSwZJ6TSuIhvPnclVj+W0t0ZD6IDiXKutA0zigusNw4xfxUqlfSngGcnN+GVEMmlfCmoyQDNcQNAuLQ8JdTZf89l4dM5u/To7Z/8aoQeUKAcAAA==';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for europe/malta.50m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get europeMalta50m {
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
