// Generated from: assets/asia/singapore.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for asia/singapore.10m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE62XTWvbQBCG7/4VQucQ5nNnJrdSaK+BHksoJlWDILGMox5CyH8vcuLgJFPKmPog1jvah3d3Z99ZPa66rp8ftkN/0fVfhvX8ezd8nm5vh+t5nDb92RL+9dx9319031dd13WP++fHgfvX94HtbtoOu3ncDzq83nX9Zn23H/Bt3Nyst9PRkK7rx/vpx5r24a8f+vm5//I4cD1t5nEzbOYl9ul+XPcvsadXITfDdDfMu4e3Mg66L6fbh5uXab4yp93PcbOej+b7/Dtuv//XdQh8Hg3MVc7eh845ECLkTf/V2b95TNL0I04AEQKrOFdDd0547AbNyzxGVW4JTwzco8wDCaFMn3hjpSrPAkDCMp6QI5d5jQgtmy9DmFqZx2HaMn3kSFbXhxbS/P/pA2fhyPQFu5d5LRQsxSEzldO5Obt4ejzCw8vp0szdJUk/jiC28ultJmpICc+BsWmZtxwrSdKPF2CcwAMOTNaPiUixvr1ijdP1Axe0+v42XfIs4wkCl+3FwE0h5SkJ1+2FATXXR0En6FNFzuyFwhBOsD9T90j2l9zUuW4HLsKSVDcydsO6Pg9tmPGWkxhlfQ7YQBM7pSYWdTt1aoBZ+aC2GGq9WrqbJelCrVGr25+LgDfMeK4AJ/Ba/GV7MbB+OVAypBRn5CdcXtwMNKkeDEiqrXy3AiO2zJ3BTajOY/RI736I0ry8fqHC2jI3RUeoX17CxJsk6cIsovViHoFulFUjlSAtzlfOAVjIM54JGtXnG6GUXSZPrL7h2twSN2DXxRfLvNK3wiprH1pPq8PzavW0+gNLd9TB0g0AAA==';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for asia/singapore.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get asiaSingapore10m {
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
