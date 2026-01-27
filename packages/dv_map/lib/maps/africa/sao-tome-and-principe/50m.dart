// Generated from: assets/africa/sao-tome-and-principe.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for africa/sao-tome-and-principe.50m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE51UTWvjMBC9+1cIn4uYb0m9LQt7Wwhsb7tlMalbDIkdXOcQSv77Eqfppol6iHwQkp7mafT8Zt4q5+ppt2nre1f/aJtpO7bfh9WqXU7d0Nd3B/j5uP1a37vflXPOvc3jdeB8fAY247Bpx6mbg07Hnav7Zj0H/PqzBWh5cA/Dep4m1/RPbjF2/bLb/Cdyru5eh78NzUEPV/t83F+cA8uhn7q+7acD9u157JZN/Y7uPxJ8aYd1O427z+md3vNzu5q6xbDavbxr8EE9jE9d30xnYhy/8/nl6nrtXPBCHCni3RWEXi0EErtAHi+PZlmVWDjmWI0RgbWMFTiBZVkNk1EqYuUAiCHLGhnUyhRAEeWsrpYSEmIJK8egKXyRK2DQWMTKYCb5XIHZUlmuR2vlncUahMoUMCPM+1VQlULR37q5CqqvVp/uu7UezZumZJCuMwGPBKbCt7/PfNAcIQmLFuhlPkiKIBkfgmdSYynwoXmLljDnQ/ACwkkKuoZ5I40hZhUVABIpcLd5JWE0ySogQJEL3G1eQlBOWQUoApaY27xYxGx5gycKLFzGmiwFyloAMRzKqUhWTIEs0+LBgxlDLGjG5lUtsmYtABLYuKiobi/Vr5tGdTnbV6fxsdpX/wA1f4kxIAkAAA==';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for africa/sao-tome-and-principe.50m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get africaSaoTomeAndPrincipe50m {
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
