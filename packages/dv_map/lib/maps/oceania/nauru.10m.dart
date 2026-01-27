// Generated from: assets/oceania/nauru.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for oceania/nauru.10m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE62STWvDMAyG7/kVwuesxN92r4MdtzHYaZRhOq8YUjukziGU/PeRpAlp6zEC80HIeqUHSfY5A0CxrSzaAnqyJja1fQxlaffRBY/yXv4ewye0hY8MAOA82PvCIX0QqjpUto5uKJrSAZA3x6Hg2TR1M6cDIHcKn4YM0ttdnI7x96WwDz46b33stZe9Nd4ZdJG7uY+DDUcb6/a6i6nt11C2h8uUMzbUX86buBh3PEv/9gaAhdhoqhQmMr+RHooN0wXDGF8Ju/xvIKaMEJwA8qLAUsjVwEJoTVM8whRlen2DgnKsUkAmOVuN+3WBnGPF6foFckwZJykg1ZhLtR6oiCAiBezfg64fmXMu019Gaqn/cYXJP5il/Mnrssnusi77AVUOV1cqBAAA';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for oceania/nauru.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get oceaniaNauru10m {
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
