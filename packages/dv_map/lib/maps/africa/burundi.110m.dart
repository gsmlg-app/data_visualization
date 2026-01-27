// Generated from: assets/africa/burundi.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for africa/burundi.110m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE5WTTWsCMRCG7/srQs42JDP5Gm/9oNBb70XKolECupE1HkT878XVFXWXQnIIk3kzD/Pm41gxxvNhG/iU8c9Q530b3tN6HeY5poZPzvLykt7xKfupGGPs2M3Dwm57J2zbtA1tjl1Rv50x3tSbruBt3+6bRbwVMMbjLv3W0Ilfgzx2+Y8HYZ6aHJvQ5LP2umzjvOZX9XRrZBXSJuT28NhG3/d3Wh9WV5s3amoXsanznd/LuI+fV4yhFNqSdWgnT8oLCK3QG+0fhNnkXx6QIPRoaASH2mtvS3EWQTmrRniknDeulCdBE1g9wvNIYBwV8sBZ9Dj0iwIISToo5CESkRtehxaaiDzqQp4zaBQM/WqhDaCnIh5KoZRFGKFJkqrIK0phpDHDzlAY603RvaIUzsCISxRoCFUpS6McvjgUEnUxy4CzY5/LS2dLz6vwq1ZjcR+dqn6eVafqDz0CipZRBQAA';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for africa/burundi.110m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get africaBurundi110m {
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
