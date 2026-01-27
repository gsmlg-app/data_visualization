// Generated from: assets/oceania/pitcairn-islands.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for oceania/pitcairn-islands.10m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE7WWTWvkMAyG7/MrTM7dIFkflnstLOxhd3tfyhKmaQlMkzKTHkrpf1+SaUs7E7NUZeYQYst+RpJfKX5ahVCNj/dtdR6q720zPmzbi2GzaddjN/TV2WS+2U/vqvPwZxVCCE/z83jjvHw23G+H+3Y7dvOm1+UhVH1zN2+47MZ102378GO3afrr3dvOEKpuN/xt4rzq19E8zfMXHwzroR+7vu3HyfZ73TZ911Qv5uc3l27b4a4dt48fHXqN4OfDZuwuh83j7UvUb+xhe931zfgu/P3v/fvh6HgcwjckqDECCaSzY2uUGtRixnxguzpcXEIjaUpSQCeyKOZFgxApltCaRMSJhiyZtJSQlMDQSzaNErlEFozJm2rIBOVDTFmV3ZlG5NIZKpNJcssDWOkkZIemV6XRhz/9fIlFrpMpasxL7nCtyqLsinRGC1m2IpqNyI0GMVs8nwmtknP0opOlstOWUFwltieDihbQKYqrDPbgHGGx4Uw+J8YT5ZmV1Z0NE0EsJppydjXJvaQl5mI6vkLOCcEWG86caLD0Bac/XYcnawtWEwFaLmiVIhOy7+CtJoHIpQojxsjoRnPETLGATpjEfM3MaoqgagVRMYCyHw2AWMo1I6k6BWt1zIACBcFSNvL6HDMYx0JjIBUV8TXgKR2UAEpoYuXsa2c+VZ+qyAjqxBI1L0ZKdY7MiN5bRmIDWr7ATOhEjN5LVxIwpsVONaMxmbrRBLb8TZjQWV2a+q/PxKri9pk1p+VP5ISOKZP34pw4QpbF6p0zbTH79YGktNjOvi69z6u6XGSrw7fn1evzavW8+gcEmZ52kQ8AAA==';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for oceania/pitcairn-islands.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get oceaniaPitcairnIslands10m {
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
