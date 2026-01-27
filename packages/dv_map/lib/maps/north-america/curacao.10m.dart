// Generated from: assets/north-america/curacao.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for north-america/curacao.10m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE52XTWsUQRCG7/srhj3Hob4/vIngUbyIBxVZ4hgXkp2wTg5B8t9lVhOMlkhlD0NvV/dDdVV1v93fN8OwXW6vp+3zYftq2i03x+nlfHk5nS/7+bA9W81ffnZ/2z4f3m+GYRi+n75/TzwNPxmuj/P1dFz2p0n3w4dhe9hdnSa8vDnuPtwATL6bH2YNw3b/bf60o9OId3/186n/7SPD+XxY9ofpsKy21/Nx+Tq8uJqO+/Pd9teguwenLqb5alqOt49dul/Dm/ny9uLXkh/g8/Hz/rBbflv7z9/v7T//DcMzi9EDXBHP/jAhjZAeoPjI8PHsv8AAAdIogIgOCNEGIgYHV0BK5sw+UALCK6CkAVsbSOAJVAGNmLMPZCWvY+gI4twFpq2xqrJMgGwoPWCOAALoVQyJ0EybWc4RBNwgK6AaSDSzvAIz1aoYkhtCNgs7RzAQlCrLTKTu1AY6KpFVQEH2ZtXkCJEaVQRZLbwdQAR3d6145kHS9g8VjOoAhjpFs6pXoBGnVMAEQ2ynGA0JuMxIrt73PTRD8mrfcXiI9D10dKHqMGSPSHqChxxQbmQ2jOB+2RimWwkUCoEnAIWyzAlYKrW3HWoqaxXCVU4MvQ2UQMCqDClEoCtQOSILR9RHlzNl+3BFInMoj39LoP7ZmphQSjJhhmtfTjwMqJQTEFLoA40irbw0ZAj3kwzCBllqfJpF//AnJyzvXZgACU8AAmkp8Wjpon0guLDW16RAz2ZOYsxVT0q9QxL1bHoYY4o4U5kTUMOugsYYyVLyIEEJ+zxBdK0kGVQlvB3Cf19dQRi1K6ExeopLVCIPgkzdS02MbhliZQyFEruKF6NLmFhVNSAOxO33hHM6a7lkZehea1YHlShKB41IsP0+aT7JNlX7vnW3uf9+3NxtfgCHIwMxRg8AAA==';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for north-america/curacao.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get northAmericaCuracao10m {
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
