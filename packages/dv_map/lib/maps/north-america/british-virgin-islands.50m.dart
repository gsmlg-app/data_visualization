// Generated from: assets/north-america/british-virgin-islands.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for north-america/british-virgin-islands.50m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE7WVTW/bMAyG7/4Vgs9dIX5IpHpbB2zYYcNOvQzFYKReKsCxA0c9BEX+++CkCdLEOlTAfBAskXxEvabo18qYOm3XbX1n6q9tk17G9svQde0ixaGvbybz38Pypr4zvytjjHndj9eBe/e9YT0O63ZMcR90dDem7pvVPuB+jCluns1DHJexN983XdM/bU7xxtRxM/xpcPJ9+Ha1Tof1+3PDYuhT7Ns+Tbafw5iezedVO8ZFU7857U7pLdth1aZx+z6542l+vHQp/hq67fJNgdMOw/gU+yadSXF4zt8vZ9dzYz55vqXgEFhvroygt+zZheAvTI+XvhkwsneKs2AHwmpdGZjRW+EcmKy6UAhmEjcvhBCpSiGW1JLAPNhpUOZSIQAYfQYsjFAoREFNVLnZuy1LCtQF8g5pPhmLSlh2SMcOfEY8UiDWQq4PwDYDZo8aoAzsnQ2Sy5jRYaBCcHAAMn+hGMD7UFhHXkDRz4MpBEAolOLjNfH/6hNVNGS+t7B14gsLlJBscDIPdujVlTbQqW24+estUymU9g22wD7TN4R0akmFUihRUM6A0YOUgimwo/neLGQFsFAKVCTM/KTEikBpe0Ehl1NiyleLE/5wGefvVHX5tquO42O1q/4BRexuN+4JAAA=';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for north-america/british-virgin-islands.50m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get northAmericaBritishVirginIslands50m {
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
