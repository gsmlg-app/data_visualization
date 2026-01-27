// Generated from: assets/north-america/grenada.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for north-america/grenada.50m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE52STWsCMRCG7/srhpytZPK56620tLdSei1Sgka74CZLTA8i/vdidMXVQElzGCbzzvswQ7KvAEjc9ZbMgLxYE3+CffKbjV3E1jsyOcqrU3lLZvBZAQDsU7w3pvYk9MH3NsQ2mYZ2AOJMlwyvwTqzNBcDAGm3/suwJD7f1Xmqf4yEhXexddbFo/bmQ/yGx86GdmHIuelwmWdtfWdj2I2nGcZ/95vd+rztBe7DsnUmXq19Otf57Q3gQeFUo5RM88mNhGxKkSmh5EiYT/4EKqZR1CIHlLyREouBVFOOLANkjLOmnKeoEE2WxzVF1KVAjaJpaA6ItUSpWDEw8XJvgrQWQvNioJRaoc69iZBCNsW8mqHWWd4/Byz7hVUuH7JDNcR5dah+AQ48cWY0BAAA';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for north-america/grenada.50m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get northAmericaGrenada50m {
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
