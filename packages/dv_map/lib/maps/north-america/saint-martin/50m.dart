// Generated from: assets/north-america/saint-martin.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for north-america/saint-martin.50m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE52RTWvDMAyG7/4Vwues+CuJ3VsZ9NYx2HGUYTK3MyR2cL1DKPnvI+5SmjYwMh+ErFfvg2SfEQCOXWvwGvDW6PgdzLOva1NF6x3OBvlwKZ/wGt4RAMA5xUdjak9CG3xrQrTJNLYDYKebZHjT1kXY6RCtu7oAsD35D82Gjt32oc5TfTMRKu+idcbFQXvxIX7BpjHBVhr/NvXXoY7GNyaGbjrSuMOrr7ujd1O4D5/W6Xiz++Xc5vc3gKeCrwilVNIiu5OoXJFCKpHzibDP/gYSJRiXM0BKBFOFWgxkQhJRzgEpJzJfDiySbRaYc86W8igVShE294SKlIyVi4GME1HMDfjfP1n2yWguH7MejXGPevQDv+UwXZgDAAA=';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for north-america/saint-martin.50m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get northAmericaSaintMartin50m {
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
