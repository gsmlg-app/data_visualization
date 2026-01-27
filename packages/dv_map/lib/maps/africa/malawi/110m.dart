// Generated from: assets/africa/malawi.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for africa/malawi.110m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE5WWTWvcMBCG7/srjM/pMB+ar9xKodBDobceSihL6gTDZh02LiWE/PeyTjYksVqQD0LWKz280oxHfth0XT/f3w79edd/Hrbz78Pwadrthst5nPb92VG+ehq+68+7H5uu67qHpV0vXKYvwu1huh0O87gsOk3vun6/vVkWfN3utn/Gl/ld1493088tL9r31bg8jX95LVxO+3ncD/v5qH28OoyX2/5ZfXzxcT1MN8N8uH/r4mT727S7v37e5Qt1Ovwa99v51Xafntf9929dJwyuKa7l7J3yIYEFNZPeCBdn/+cJsJBEVHDm5kzeiCuhFu4rHiEoq2pEI1BIhVBrQE9TbcQRFY7kNY7A0CmDW/2hFeYKkKGIukdbQBgyya2sA0wMHhKObVtmsAgylTVQwIlDvTUkTAW5VGIskE5hjTiPdERa4woUpRBsy8ECaCVYKylTQDSz7fyOJtJEKgEpYCSIzUAlN7M1TwFJHBsPsICgc1IlwArFwwq1GpQgTso10IBCVLMtIgooEoQVhwaBxNkMFEk0rjtELwWlEehOibWcVoi0aK1bChYWpfbVHbOGsGgrkM1TrVJoBCI8pLRVrgKJTlpLGwE1LVyyNa81MyoxEVDPTG/9jjkQ0SqFgReJtS3I/zZIoIzYen68vjUJgVrLXxYMqdyYCZZiLq3V2SV9nSUJhbyxEDT/bGxq/VPvcXNqLzaPm7/t8gzXEgoAAA==';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for africa/malawi.110m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get africaMalawi110m {
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
