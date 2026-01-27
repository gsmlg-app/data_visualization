// Generated from: assets/south-america/falkland-islands.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for south-america/falkland-islands.110m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE62SwWrEIBCG7z7F4DmVxK1NsrdSKJT2UOixLEWydis1Gox7CEvevcRswmYjtEI96PjPzMc/JicEgF3XCLwF/Ci4O1rxYJQSlZNG42RIf45yi7fwjgAATn5fN/pyn2isaYR10jdN5QBY83ps4Opbcb2Hp3Y42rkTAMvWfHDqq55X+sbrL4tEZbSTWmg35N7M0X3BfS2srDg+F/WzsYMwtXC2W9qa5ng1qjucx57hxu6l5u5i/nFdxtc3gJu7jNDkWmQZKdhC3CW/YFKSrzGUbKIorCQF+wc3rCS3ITc0jlKQNOimjMPkJA9iWORQBWFBThb7NlnYTuwHT0MUGon54++HQvEU9Wjad6hHPyK6D3IsBAAA';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for south-america/falkland-islands.110m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get southAmericaFalklandIslands110m {
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
