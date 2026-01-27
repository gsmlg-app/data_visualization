// Generated from: assets/oceania/samoa.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for oceania/samoa.50m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE52VwWrcQAyG736KwefUSBpJI+Va6C20kEMPJRSTusGwscPGOSxh373sJhuSjedQ+WA8o5nPv6XR7+cmpXbZPQztZWq/Df3ytB2+zpvNcLuM89ReHMJ/X6Yf28v0q0kppefj/fPG4/Jj4GE7PwzbZTxuOi1PqZ36++OG6/5+7t+Wp9SOj/Pvng6hn9ef5vPL/NX7wO08LeM0TMsh9v126Kexb1/D+zcdd8N8Pyzb3UcVJ9lXT5tl/DFvdnevn/rGnrd/xqlf3n3zy/X++Xz0eZzSFyzU5ZzZFS9WorljFcrMZ7Gb88UVtCCYWamgjQxJgmhVVzJfRwvlAzyILsUERSto1OLqUTQzOFoFXawgRNEqVswrZVRmI6ZoGbOoZ15HF0d1j6LZWAhlHW0A6JKD6JzBxGuqCxcoQTIRuyDVRDPFDwgWNZFKPtRY1cKiUXKuiBZxKRDP9P87SFMbfXhpwNCwY2EEXO1f7oCVLWho2DG7KKyWhzsgYg32L3asmEvFKr0UzRo7rtgJqBlXTMfZHShWeexEhclrqjmDajTVCtlBa01WHKOmg52JoXCu9W9BsmgV3dg019DEjBz9LQGLuVX8zCSumjogg1LLtYNalnBCEB151Ru4A0BVCJdRc1GvNSMQCMTMErtCRkSr5/pgIYVUNNrnAXeqm2Vz/rRvTvebZt/8A8+Lg+ZACwAA';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for oceania/samoa.50m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get oceaniaSamoa50m {
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
