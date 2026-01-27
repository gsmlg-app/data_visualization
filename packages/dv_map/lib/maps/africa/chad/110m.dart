// Generated from: assets/africa/chad.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for africa/chad.110m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE5VYy2obWRDd6ysarU1R70d2wWHWs5jdEIJwlETgSEbRLEzwvw9XiU2c2wRKAtG6t/tw6nWqbn/fLMv28viw375Ztn/td5f/zvvb0/39/u5yOB23N2P704/lb9s3y7+bZVmW79ff+cHr7deNh/PpYX++HK4PPd++LNvj7uv1gdsvu48vdy/L9vDt9GHHY+efd9O6XNdvX23cnY6Xw3F/vIy9t5/Oh7vd9ufu0wuLz/vT1/3l/PiawzPpv0/3j59/2viCejp/PBx3l1+M/fH59fr3f8vCAinhfvPbOhVYosar5fc3f8SigtTiCYsJtAyrhWWQjmkTloBiBbewFNJIJiiGdC5r0sLyzFgzUjCNMpt4GoRraKipXW6aQZo0oSGEoFIbr1BYPVbwJMMpuyH1tNDZWiooC0qkJp4gqtJkLwUUR2l1+bFGCPGE5+AcgtaLrUAF0+S9qx9UeqUlYIpSMhUEKYgHSRuvzL0yJzyBKveiXokNPNXwNTwxUW3WhYKVRc5VO/AElb0XWx0SFBk64TGklZRLV1JKZM5kBqbCXp0plCMZzb4jMDML7cKxmGtNcAhZJGy90BqoRwZP9AoqWcR7madQWGIy0SuoYuLqWuscjLOoFBRjUXXjSkHqPmsKAjJJZA/vWhdMOeVdgWmNb7csVNXnfp1QbunUtbaiqmwFLsoJtZspxJhuk0glSDIZthNPHGtW0AAvTuJephiMnuA4sQtQpuJmd3QgdJY1dlqBGb3IOnChOU2hCAhTwaYIOKg5pa4YGzK6XK9oHQKtck7jAMMUjp7vAsq1uFaMzcKinq0ju8psFrwEThIUb8IVEfIsxwkumNUcihOSGLGmPMkhn9UdygqwFHFFjDE0tdcWGQGtPOeKLUDiwJbnxtCKmL4mdhpW2Ws8TBA8dGPusgjmgWY9egwsRFzzfIdQQZnZiuz1/KC0IndEQMpS1ppnB144z+wIJNW7WIbp8whA4FG9gmAeguYzLwZ27InwiEEmzt2VwYc0N/OjxOfTDjFYJrXmTWZACZv9xTCUpZ1noxmvTa7B0qsBBkrhmZdApGvXRiPGOY4KWNL2l6DY7HsFYc+ujeZRayebUuWeoAkg60ocx5kLe68NxquR9FzFIsxe3rdes2zWrp+vnjbPv+83T5v/AawTRdQGEwAA';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for africa/chad.110m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get africaChad110m {
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
