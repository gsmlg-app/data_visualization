// Generated from: assets/africa/eswatini.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for africa/eswatini.110m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE5WTS2sCMRSF9/MrQtY25Hlv4q4Uui64KLRIGWyUwDiRMaWI+N/LjI6oEwqZRbi5J+fj5DHHihCaDjtP54S++jr9dP4lNo1fpRBbOuvl9bm9p3PyWRFCyHEYp8Zh+SDsurjzXQqDaVxOCG3r7WDwi986hTZcHYTQsI9ftezVxcekr4b++52wim0KrW9Trz2vu7Cq6UU9XZNsfNz61B3uc4zB32Jz2Fz2eaXG7ju0dbrZ8Pm7rR9nhCjJOAoAY2YPypMEhkpZycWdspz9DxTMWYPoZA4onUB0rhBoFSKimwINs1opJWwhsPcYhBwQgAvHTSGQa83RZYGohDZSFQE5c9oBgM2dIZcSdNkRcgYIwG32kpWzHG1pQLDGgcjcCTDUympTBhRMWomoxBSITFpj0enSVwOWA1c5YP8IJZYlLP9Rqlw9VqdqHJfVqfoDrzsky9EEAAA=';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for africa/eswatini.110m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get africaEswatini110m {
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
