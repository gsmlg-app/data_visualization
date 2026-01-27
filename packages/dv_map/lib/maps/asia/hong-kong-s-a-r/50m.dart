// Generated from: assets/asia/hong-kong-s-a-r.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for asia/hong-kong-s-a-r.50m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE7WXTWvbQBCG7/4VQucgdr5ncguFthAKpT2WUEyqGoNjBUc5hJD/Xqx8kNjaQ6bEh0W7s/todvTuzPp+0TTteHfdt6dN+7lfjre7/tOw2fSX43rYtid789/H4Zv2tPm1aJqmuZ/a44XT9MlwvRuu+924nhY9T2+adru8mhZ8Hbar5nzf/OzOuh/dy8qmadc3w+8lTrPOj8bpcfzLa8PlsB3X23477m1nN+tl+2R7ePFn1Q9X/bi7e+vNs/vfbjfj+vuwuVs9bfkFPOz+rLfL8dXeH3+vnw97x/2mAeCugDCGnRwZETsBCGA4MF0czq2Aixo5zYLZuRBhBkydh7Izz4PRwchz4CgoFDALptASZEkwGRWejzEpR5RUKLgrhA4o82ATN48cGCiK1sDsTCY5MKqFus+CMURENQneb7bovMcoGJTkRhG0eRmTkVkWTCR7udXUhpwVBaFASOXgkXHBbCicxUoFLKZgSY8xAIAq4AhWTMoYNRR9PsZCampZtakWkHm1CZdQTeUg7hAdESvpWChEkukY3MGp4vH/5CBAdIEPAJewOlgANZI5qEihWqrYF0P15Mcr4KhQq6XMQtla+v4ivaj13rwyc2NAwkIwf1oRirBmTyuTSKVMIpEwp8HqNl/MUEmMs9L3KZtWipkqlXT5ZbZKFsBAJE2mcCA3jVoonCQ4GeJiiDp/piAE0mX9/WL7KOVTF2FWK9kIhSObN/aX4UphxemV2bzBFFy5ChARhac+N3XuIFxx2AsaZbnkrobzYAaNyP5pEJDahRaxsKROKnVuRkyV+ywU5qzD79daXfeLw6eHxXN7sXhY/AMObFGMbg8AAA==';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for asia/hong-kong-s-a-r.50m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get asiaHongKongSAR50m {
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
