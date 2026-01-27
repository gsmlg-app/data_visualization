// Generated from: assets/north-america/us-naval-base-guantanamo-bay.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for north-america/us-naval-base-guantanamo-bay.10m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE51Wy2ocVxDdz1dcZm2bej+8iwPJKiYQsgomNHLHGRhNi1ErIIz+PczYErY0tXD1ounbde/p6lOnHp83Y2zX+5t5+3Zsf5mn9e44/7zs9/PVulsO21cn8z9fXt9u346/NmOM8fl8f3nwvP1suDkuN/Nx3Z0PPW4fY3uYrs8H/vxjvJ/+m/bj3XQ7j1/vpsM6HabrZbyb7p9Qxtjubpe/JzqdeJ35wsAXDFfLYd0d5sN6sr1fjuu/46fr+bi7mrZfNz08eflpXq7n9Xj/vY+PP/Xb3X7d/b7s7z99JeLpC8vx4+4wrd8w8uX69vn56uV6jNeubyAVQOPVCyPmm0gnsmeWD8+3VriSCnwRNx012HvAyA5cOHwCVmh6jJzGXgCbZHapQOYAtcvAGuAiTWDKMMwCWA3bHqO5RhE8c1ChJjCIAVHhcbJGdIERBLUAZpRsAwtHFMBCrs5djj0EClWIQHA3eETGXqhCTgHoZp6YOBcJQizQpkLdjAtVYDi05WbC7l4As2N2PTalNKyqJiB1U9owMS+rIhJRqEsFu5BcVkUkqbbrMbgZllRoUpPjH+9Mm2r13Rc7XRINMEmKpgMm3eriEUaXyUsHZ2wCE0VaFhWcXQS0CcwUGkV1AQDFpkCJEawqtACigU1gcEkuqAB1t26hTYSymYExWlcVSYSF2CBPce0yoa5QxA5RuasJ9FoTmKLZDR1GUVmSBECbJYtQFKBqZEaBbalFajWFUJJ4l2FgjqioCFZsSwJNpJhCiEK12yHTgCvcU+Y0mcBkJKuAHVKbscPgVC0oZtZsDyFOGFlkB6u7dz1Wc+aiTnBEZrelG0uZHwoc/XaHhFzMY+ran5qClQqKzbTfn3+479czyOb508Pm8f5h87D5H96MhtsKEQAA';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for north-america/us-naval-base-guantanamo-bay.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get northAmericaUsNavalBaseGuantanamoBay10m {
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
