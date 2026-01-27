// Generated from: assets/south-america/uruguay.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for south-america/uruguay.110m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE5WVTYvbMBCG7/4VwudUzPdIeyuFnktLD6UsxaRuGkji4HUOYcl/L/FuwmYjKPJByHo1DzOeDz83IbTTcd+3D6H93HfTYew/DZtNv5zWw65dnOU/L8dP7UP42YQQwvO83hvO12dhPw77fpzWs9HlegjtrtvOBt/Hw+rQHa8GIbTrp+FXR7P44+6c5/OvN8Jy2E3rXb+bztq34TD9DR+3/bhedu3rpdPVn1U/bPtpPN56c3H/y7A5rl6jvcKH8fd6101vwn553u7fv4XwQT0aKTLL4r3EEAmNsuQb5XHxX2Jyyex8T8QIaKqGdcQUUUgECj5SBBEF9moik4n7PZEjCKhZZdQpsmRDpBKRjDFVA4UcXLAEzJBFRaoTg54MCkFLFCMV51oicrakRSCDqFEd0CKhUi56mDQn1spEazQXSGWiK5mmVEeUmFmTWSEvErOSiVkdkWMCE7IS8Px5sbYDObKzGRar2y2xe2XQHE1BpdCAHAkIQCpb+myWNeVSRzu5We2M4OjJs2LhK55nhJOQ1iZanUSxUN0YJYsiVjagRgNUhMKMgJiUk6fq8s7OJFKIGmJKDK6VtWMxuwFpKhERsiWrHju1f5imtL/sTs1lfWxOzT/N3C1vEQgAAA==';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for south-america/uruguay.110m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get southAmericaUruguay110m {
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
