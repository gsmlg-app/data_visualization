// Generated from: assets/north-america/dominica.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for north-america/dominica.50m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE5WSS2sCMRDH7/sphpyt5DV5eJOW3lp6L1IWG23ATSSmBxG/e9nVFR+BkhyGyfxnfsxkcmgASN5vHZkBeXVt/k3uOW42bpl9DGTSy6tTeEdm8NkAABwG+1g4pA/CNsWtS9kPRWM6AAltNxS8xM4Hv2wvFQDE7+JXywf17SEuTvH5tbCMIfvgQu6195jyD8w7l3rsOel4aWjtYudy2t+2M/b/ETf79XncCzymbx/afDX36Vz79zeAJ8Wm3DBlLE7uJIZTLi3lQt4Ii8n/QGRUS14ACi2YlFgN1JpLxQpA5EpTW8sTnFJWnBgNUjSqFijRMIoloBKiV6qBylrObAlIhVTKVAMNY8hF8QmRSVXfIUPNuS4t2VqDohooNApLVekbcs2trN5y5b9uSv7oHZvRLppj8wdpnCwHhwQAAA==';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for north-america/dominica.50m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get northAmericaDominica50m {
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
