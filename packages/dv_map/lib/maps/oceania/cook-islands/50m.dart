// Generated from: assets/oceania/cook-islands.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for oceania/cook-islands.50m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE52TTWvDMAyG7/kVwueu+EuO3GthMHbo7qOM0HolNLVL4h1K6X8fSZvSDw+W+GBkvXofJGMfMwAWD3vHZsBeXRF/ajcPVeVWsQyeTVr5+5xu2Aw+MwCAY7c/G7vyTtjXYe/qWHamvhyA+WLXGeYhbOGtqQq/bq4uAFY24auQXcX7U151+cWdsAo+lt752GqLlSt8WbCLfLq2s3Fh52J9uG+m7/4jVIfNZdgrNtTr0hfxZurzuo0fTwAvAu001xxlriaPmhRTqa0URHfKcvIPpDJkUKaR3EgcQbTI00BOguMIoiGFVqeQgkjnxgxGto1YzNNIoyUOv0lSkivxx+BcE6nhSC01cUwipRVcjBhcWbTWJJGKOKEdcZeq9aWfkORkR7zKXCJSukttUYh8OHLg38lScR+dsn5fZqfsF+dTe33rBAAA';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for oceania/cook-islands.50m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get oceaniaCookIslands50m {
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
