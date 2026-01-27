// Generated from: assets/oceania/new-caledonia.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for oceania/new-caledonia.110m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE5WTTWvDMAyG7/kVJucuSP6S1Wthp7HtPsoInVcCaVxSj1FK//tI2pR+GIZzMIpe6eFVrBwKIcq43/pyLspnX8ef3i9C2/pVbEJXzgb5+5TelXPxUQghxGE8HxvH8lHY9mHr+9iMTVO5EGVXb8aGV/8rFnXrv0LX1Jc2IcpmFz5rOZYsHvLqlH+5Flahi03nuzhobytfD8CzfLz4Wfuw8bHf37qZ7L+Hdr8+T3vBhv6r6ep4NfbpuY7v34RAayoiZsc8u5OeJFbgAMDcCMvZv0BtAYD1IxCqgScl5hJBAigrU0RtmBkziXpss4QpIkoARM4lgmQLhpJEMFYbl0tES8wmPbXWpK3NJTrJDo1KXTVqdsiZHk2lSSsyibvGyhJbyPVoK3RMSiY8ygolEziVSyQNoLRNERUzk83cHjqvSGJqWeGwj0C5HocuRpP6jgQA6LJvJvO3LlLxFB2L6VwWx+IPbJJ63YUFAAA=';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for oceania/new-caledonia.110m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get oceaniaNewCaledonia110m {
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
