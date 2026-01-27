// Generated from: assets/oceania/guam.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for oceania/guam.50m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE5WTwWoCMRCG7/sUIWeRTCaZZLwW2lNpLz0VKYtNZUETWeNBxHcvrq6oDZTsIUzmn/n4J9kcGiFk3m+CnAn5HNq868NTWq3CIncpyslJ/jmnt3ImPhshhDgM69/GoXwQNn3ahD53Q9NYLoSM7XpoeNm162u1ELLbpq9WD8rHnzye86+3wiLF3MUQ80l7W4Q2dq28yMerjWVI65D7/b2J0fV7Wu2XlyGv2NR/d7HNN9Oev9v4cScEGDN1BhwTTx4lnGrL2jm8E+aT/4GOvde+ADQAgNrXAtkorxUWgNYpBG2rgYqJSgYts9JoanneWWRFBSCBIePrgUgOfMkhaY2E9XfCClGXJtbkra0+QTKMQKZ0x9o7UFwNtAUWAhpHVM0i7bj0u2gGRaZ+WGYL4IovxFngamDlk2tK8Rgdm3GdN8fmFzQfgHAYBQAA';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for oceania/guam.50m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get oceaniaGuam50m {
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
