// Generated from: assets/south-america/brazilian-island.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for south-america/brazilian-island.10m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE5WQy2rDMBBF9/qKQWsn6GHZVnZtINBdocsSinDUVGBLRlYWbvC/FzuxyUNQrMUw0r33MKMzAsChazTeAN5pFU5eb11V6TIYZ3EyyN+X5xZv4BMBAJzH+hwc7aPQeNdoH8wYmuwA2Kp6DLx69Wsqoyy8tZWyhzkJgE3rvhQbXCspnwQeEUpng7HahkH7cKfwAy+19qZU+Grq58mO2tU6+O5+rmmRd1d1x+veM9z5g7Eq3HzA5dz2jzeAlcjXWcrSTBTJo8TJmkpOJKN3yj75n0hYLpmIE4mg+WIgpZks0iiwYDJjy4mcy5zIOJGLgsnFxIXfiGL91PVoqnvUoz/fmKF5AAMAAA==';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for south-america/brazilian-island.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get southAmericaBrazilianIsland10m {
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
