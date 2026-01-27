// Generated from: assets/europe/vatican.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for europe/vatican.50m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE62RvWrDMBSFdz3FRbMJsmT9ZQulmTOULiUU4apB4EjGUQYT/O7Fch3sxFAM1XC5up/O0RG6IQAc29riLeC9NfHa2JdQVbaMLnic9fh7GF/wFj4QAMAt1WdhOp5A3YTaNtEl0XgcAHtzToJ3E11p/F0AgN0lfBqa4O5pzob52xSUwUfnrY89e732N+Jf2t2DnGw429i08xhj7kOo2lPwc9fQfDlv4uS9w5r2jzuAnG4KpnNBaPZAinyjtGJKyRk4Zn/7KSaVXvDTRFCS09V+hAtRLPrxQqzPRyVnOl/0I5LR4t/yKS05V2K136r/QEv92HVorEfUoR9tTIFUNgMAAA==';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for europe/vatican.50m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get europeVatican50m {
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
