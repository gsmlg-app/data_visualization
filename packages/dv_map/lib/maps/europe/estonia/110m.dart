// Generated from: assets/europe/estonia.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for europe/estonia.110m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE52UTWvcMBCG7/4VwudFaD40H7mG9FxobyUUk7rBsLEXr3NYwv73sk522cQORPVBSPNqHr+DpHmpQqinw66tb0L9rW2m57G9Hbbb9mHqhr7enOS/r+F9fRN+VSGE8DKPy8R5+yzsxmHXjlM3J523h1D3zdOccLefhr5rLgkh1N1++N3gLN4t4jTHf/y8Fh6Gfur6tp9m7fn0x/pNPV6MPLbDUzuNh/c2zr6/D9vD41uZF+ow/un6Zrqq9/W7nn9chYAa3QBQfPNByR5ZMynRO+F+8xUeMHzCM4MinkRnB8q2xuNsqdBfjiYM5mv+BCB54iIeR0mMwLTmT7JlsiIeRSJXz7zCA1PkVFYvRUbJkpb1WhRAzVRabxIAt6U/i5iVlKWQx2iOurx/FsmIodgfAZqgLHga1YmRyvzlCMLZKa/wXBNkLcRJQkuuKzhjzWhl10UiC2XC5fXTyCpkVuZPI5qB8fK5nXic0UrbgYKIrTzf03GAuZe1A42MCZaHYVGRC8/CIhCI+9rTpZQMc6m3uZV+1kj/h/X1tlytzc+zY3Ue76tj9Q8MvRyGPQcAAA==';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for europe/estonia.110m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get europeEstonia110m {
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
