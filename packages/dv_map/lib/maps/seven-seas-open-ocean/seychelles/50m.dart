// Generated from: assets/seven-seas-open-ocean/seychelles.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for seven-seas-open-ocean/seychelles.50m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE5WSTWvDMAyG7/kVwqcNupLYlj96Lew82GmMMkKmdYHUDok3CKX/fcxtStsZhn0Qsl7psSS8LwBYmHpiK2CPVIevgda+66gJrXds8St/HMMjW8FrAQCwj/ZvYUyPQj/4nobQxqI5HYC5ehcLnmlqPqnraDzXALB29G81j/r6T1zE+MuV0HgXWkcuHJnf5GCkeoQ735MD31Dt7tkp/XBubkt+R2GYrlubZ3ny3bQ9jX5+xg/vravDxQ6O59K/vQEgLlGWQvDFjfAgl8qKUil5JWwW/+EkolaVTvAQjTa2yuQJI4Q1MtVfabnWIre/SmmrbIqHJbfZOFNxTC5PGi55Ls1KzZVK8DRKNNZk8lByq4xJ8QyiVDabl/NXipQ/e4ditpviUPwAciAOHuUDAAA=';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for seven-seas-open-ocean/seychelles.50m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get sevenSeasOpenOceanSeychelles50m {
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
