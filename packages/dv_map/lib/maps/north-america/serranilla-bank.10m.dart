// Generated from: assets/north-america/serranilla-bank.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for north-america/serranilla-bank.10m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE5WPzWrDMBCE73qKRWcnOJZjWbm1hR5LoccSinA3qagsmY16MMHvXqzEJj8u1DqIlb6ZYefIAHhoG+Qb4M+oww/hk7cWq2C840mPd6fvA9/AOwMAOMb73hjlETTkG6RgommQA3Cn62h4QyLtjLUaHrX7Ho0A3Bz8h8560UKpOyAmQOVdMA5d6NmLp/AFDzWSqTQ/i7pxsT36GgO112sNPV69bffn2mO4p0/jdLjofzqX8+0LYCHLZSFkKnOR3KDVelkWWVpKcQW2yT8Ci1KmajJQZmpdzA7M03z1R6BQSsn5G86qzKbmYerYcG9Zx34BCBzCFKoCAAA=';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for north-america/serranilla-bank.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get northAmericaSerranillaBank10m {
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
