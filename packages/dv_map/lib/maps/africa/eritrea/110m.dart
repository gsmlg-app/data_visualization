// Generated from: assets/africa/eritrea.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for africa/eritrea.110m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE5WWS2vcMBCA7/srhM9h0DylyS2UFnorvZZQltQJhmS9OO5hCfnvZTfZkESiMD4IeUbzMQ/N2E+blIb1sB+HyzR8G7fr32X8Mt/fjzfrNO+Gi6P69kX8OFymX5uUUno6ra3h6fhJsV/m/bis08nofDylYbd9OBl8XaZ1GbdvBikN0+P8e0sn5c9Gzi/y7+8VN/NunXbjbj3qrm6X6WY7vGqf3xy5G+eHcV0OH904+/1jvj/cvYb5Rp2XP9Nuu76L9+V5v//8lhIbCLnixSc5CggR4gfx9cX/WQXUuZQOi5CjKM+WeyhXFw6xKiiSa4elWaWEWA7ZXTqoItkkiGLJ1su8MqpGWJIhk1E3RHT1IKu6WQeFWGMhCgKqUoNiKIU5VERBUK/ausUgSjkWIUHOXtpsEVTTSkEWK3b8IlAhisVIUIqbUHu/CERVUGuIx5ArEvWcM3fjakH3tLoWaxPHkHMWwmi4VKxyp8sZWNg9VgmEwuKKvTvihJktdksQsDgV8d5sdMzFQ+ljh4pCzm24CsJqUmJjzYHMEHM7QRScqBCHZghXcM9G3OAMqmQji03wCoI5t8kr4H4semxYHr8HbVsUECoaJaEVaYtQgIwxxjKoStrLmKvFRjgbFOXa5suAHGOdygZMTO3gFahEEmqD2A/Cprc/75435/V687z5B1I4mX3DCQAA';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for africa/eritrea.110m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get africaEritrea110m {
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
