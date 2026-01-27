// Generated from: assets/oceania/tuvalu.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for oceania/tuvalu.50m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE52STWsCMRCG7/srhpy3ku9MvBZ6bQ9tL0VKsKksrImssSDify9GV/zIoekewmTemYd3MrtrAEjarjyZAnnyLm0G/xj73s9TFwNpD/L3Mb0mU/hoAAB2+bxvzOVZWA1x5YfU5aaxHIAEt8wNr5sf12/O9QCkW8dPx7P2fpcXOf92JcxjSF3wIR2057l3oXPkJO/PRhY+Ln0attc2Rt8vsd8uTmOesXH46oJLF/Mev8v49gbAjJ1wJrRhtr2RHnCiuOQM8UqYtX8Aak2ZLgGZRCn+AWSaM1YASkSKylYDqaDciBJQa0FR1wKZRSUULwENpcyqeqCx0haBiId11Y9M0WBxy4wzamW9Q2WoKC1FCWm0qn5DTqlCVXQopNW0fuS6H7spxWO0b8Zz1uybX0UvLSSABAAA';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for oceania/tuvalu.50m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get oceaniaTuvalu50m {
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
