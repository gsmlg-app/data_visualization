// Generated from: assets/europe/luxembourg.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for europe/luxembourg.110m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE5WRTWvDMAyG7/kVwucQbPm717GddthlMBhlZJ0bAm0cUgdWSv/7iNOUtA0D+yBkvX4fS+iUAZBwbB1ZAXlxZeg79+R3O7cJtW9IPsjbsXwgK/jMAABOMT4a4/MotJ1vXRfqaJqeA5Cm3EfDa//r9t++76qrB4DUB/9VYtTfH+p8rH/MhY1vQt24Jgzacz98Si7q+dpL5fzehe5428nU+pvfHavLpFeq737qpgyzkcczz+9vAKqgglPNRX4nSFowNFQyfSOs839xstAGBdNLOGopR23TcEoLKvGeJmwh0QrDZRrNWK2lXcIJgUpploJTBTOKI32YdcApbiiaNBwK1JKxBZyliCiTNpG82Gwpn7JzNsV1ds7+ANbK1W6BAwAA';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for europe/luxembourg.110m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get europeLuxembourg110m {
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
