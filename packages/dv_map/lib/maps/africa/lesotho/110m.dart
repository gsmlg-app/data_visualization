// Generated from: assets/africa/lesotho.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for africa/lesotho.110m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE5WTTWsDIRCG7/srxHMq48c4mlsp9FRooccSypKadCFZw8YeQsh/L7vJhqQrFD3IOK/z8A6jx4oxng67wOeMP4c6/XThKW42YZma2PJZL6/O6T2fs4+KMcaOwz4tHK4Pwq6Lu9ClZigarzPG23o7FLyEfUzf8VrAGG/28bNWg/g+yetz/vVWWMY2NW1oU689rrpmWfOLeroaWYe4Dak73NsYfb/FzWF9afNKjd1X09bppt/zuo3/nhhTTnhyyio7+6M89BIiemvvlMXsPyAaSQAyB7SGECQVAoGM1s7kgA6lsa7MIQnUCmXGoBfKKJLgi3hWeO+VlT4HdIQedRmQBBmvPU14GoQ1KAHLeE5IIAVmOmMNAg2SVrIQqLwE66cj0SCUskra0hk747TPtwwEgFA2Yy9AOiNR5WZCRpPFUmD/ZqzF7KtB0q6049J/V+XiMTpV476oTtUvveumMB8FAAA=';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for africa/lesotho.110m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get africaLesotho110m {
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
