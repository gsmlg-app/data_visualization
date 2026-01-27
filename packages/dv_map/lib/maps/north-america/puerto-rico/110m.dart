// Generated from: assets/north-america/puerto-rico.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for north-america/puerto-rico.110m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE5VSTWsCMRC9768YcrYhmXx7K4VCL0W8FinLNtqAbiTGg4j/vbi6ou5CSQ7DZN68x5tJjhUAyYetJ1Mg777O++Tf4nrtmxxiSyZneHkp78gUvioAgGMXh8SuvQO2KW59yqEj9e0ApK03HWG29ylHmIcm3kgAJOzid41dw3xQF5f6xz3QxDaH1rf5jH3GlH/hdeNTaGpybTrdPK183PicDo+O+hFmcX1YXSe+icf0E9o6341+Off58w3gRWuKFqWQavIEcUsVl0Zz8wAsJv8IGsoZ08bxMUFkmnFeKogSJZoxh8JIqRkWO7SSa5QDQUOd1EoJVSaoqXLOje3QUGe5RdRlgopaabgWbkzQKMdU4aMoqhxnTNiRHSJaVjqxosZwwXBo0FKJWhtX+CbF37Aay/vsVPVxUZ2qP95z9cA5BAAA';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for north-america/puerto-rico.110m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get northAmericaPuertoRico110m {
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
