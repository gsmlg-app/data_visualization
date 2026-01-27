// Generated from: assets/north-america/nicaragua.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for north-america/nicaragua.110m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE51YS2sjRxC+61cMOjtFvR97CwuBXELuYQnCURyBLRmt9mAW//cw8tp4txtCRYehp6v7o6q+eo2+bpZle3l63G8/LNtf9rvLl/P+4+n+fn97OZyO25tV/PfL9ufth+WPzbIsy9frc7x4PX4VPJ5Pj/vz5XC99Hp8WbbH3cP1wm+H2915d/dl93ZlWbaHz6c/d3wV/zrsy8v+x/eC29Pxcjjuj5er7HS+/LP8/LA/H25322+Hnt80utufHvaX89P3+rwa8Pvp/unum71v4KfzX4fj7vLO8Jff+/WPb8vyUwq4mRPFzQ8iQijJcKXvBJ9u/hMwMUtsBCQgFFSxNqCZBsoEUEKESLqAbpgWNgF0LhRumxxUTjMFs4RY2xY7O6GOCjIIYxq2LdYQYaEJoFJhBrcBK41MJ4DpxcVtDc2YMXgAFCAONO0DUqVQTQDNw6v6PiQeGRGoQIzILholE/voQAUhjD7DnEpOo4IKHu4sbQV5jRidKZhV6d42WIMndChUWXL1I3BVI3MANEBy9n5IO6flzIGZiKFduAoLppn/QkvFqgeowJyi5FPA/1GoFVRLxGaUOJNTN+UUXFcqxyqj4O6J1gZMRhQfOVZIKkuPLmCxGuLYmxSiUIubpBigcWTMWLa1PjY5MSDNMJyRbI5U3kxjA3ITn7QSBTEVr2YeGxipTnqdAkYhUZMSA1+LiY2AAuWIkc3EM0gkLh05FkhxtGYzdsBydpkFIUpSdiuDgxCTTtJEIILEvBk0DsYYmLPeGZFrQHUBwwzTxygUCNPUvg9DJJlGHwqwCxY3o9DXmmyTGVOATRm1WfwDEC18NiwgW5Q2OQ4QcrdJ92SoVE9r5nGAFEv6yDFDkSJls7YGmIX6lGN0NesmcoB7asnUZKxqBnUAeRhNDVZL7jrQIdSqJu2TgVTKqVn616ybjQsEiZ7h/TJjqZmzjwhFUcl2oQ5iU5xpiJmq2u515pQ2EkLAFETdCU6hUBBltBihjAWlmXTrpCs4SeLVYHbrToRrh7QSHKsWQlUxW5MSBSqkyDEGEaKk/5mYZWiT3o4Q7CndnGv/F7CZrV9Xz5vX56fN8+ZfChU2KLwRAAA=';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for north-america/nicaragua.110m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get northAmericaNicaragua110m {
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
