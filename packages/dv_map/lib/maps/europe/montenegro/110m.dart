// Generated from: assets/europe/montenegro.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for europe/montenegro.110m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE5WUzWrrMBCF934K4XUQ86ORRt1eenct3ZdSQqsbDKkVXHURSt69xG1CUwt65YUYz2g+z5EPeu+M6ct+l/or0/9N6/I2pT95u01PZchjvzqW/32mX/src98ZY8z7vC4b5+1zYTflXZrKMDedthvTj+uXueEmjyWNaTPlc48x/fCaH9c0168XeZ7ztxeFpzyWYUxjOdau344f7b+qh/Msm5RfUpn2l5OcRr/L2/3mS+mZmqfnYVyXb5I/n+/xzzdjCCwECKsfaUdWVD1fpB9Wv6FIgmiFpUhBGlnMsYqKKtSCwmijqCwlskXw4BpZnisgQg7aCHLKGissFqLYyCJUoQpLiLVVIDB6qbAckzT5AdUG8G75E9kSAGIjS3zFDb7JVajWCQD65bmTdSHGSG3WUqtK6Co0UpQ2hdGiJ7cUiTaKQKvlOWDwuvQEWg1BBEIrD5xTjxWlGCW4Zq2BFaR6cl6VXGh1rQJ65BpPACBy6+3z/5diV4tP0aE7rQ/dofsAGdJWrLkGAAA=';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for europe/montenegro.110m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get europeMontenegro110m {
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
