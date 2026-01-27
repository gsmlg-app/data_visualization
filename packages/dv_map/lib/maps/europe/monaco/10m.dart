// Generated from: assets/europe/monaco.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for europe/monaco.10m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE5VTTWsDIRC9768QzyHojDNqrqG9lfZeQllSWxYSDRtzCCH/vWSTDfkQih5kdt7M2/dGPTRCyLzfBDkT8jW0edeHeVqtwjJ3KcrJCf45p7dyJj4bIYQ4DPtz41A+AJs+bUKfu6FpLBdCxnY9NLyl2C7TtV4I2W3TVwsDNn/K4zn/fgssU8xdDDGfsJfd6Yfygh6vOn5DWofc7+9VjLI/0mr/e3F5ZU39dxfbfGP3vG7jxy8h7NSgNWQmD3mDU2sQWdEdsJj8xwYMhnWJjsiwgUo6xZ4dl+gYSRHX0aGzhA6L6qzzzlbSWWAiKs6OHEKlWWQLDEWzaDSYyqNAJksKSnQAFhXWzk5ZgKJZ7cGirj1Zg9oXL4q2nn0tnbae2Bdnp7xCV0mH4AwV1aF3BLWvouqNNaV4jI7NuC+aY/MHLay0TwcFAAA=';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for europe/monaco.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get europeMonaco10m {
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
