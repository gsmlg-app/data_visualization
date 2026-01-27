// Generated from: assets/asia/bhutan.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for asia/bhutan.110m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE5WTwWrDMAyG73kKk3Mxlixbcm/bYMexw26jjLBlXaCNS+oeSum7j6ZLaZvAcA5G1i99SJZyKJQq035Tl3NVPtdV2nX1U1yt6s/UxLacneTvs3tbztV7oZRSh/4cJ/bhvbDp4qbuUtMnDeFKlW217hMef3apai/xSpXNNn5U2GtvI789+1+uhc/Ypqat23TSHrZNVf5px0sVyzqu69Ttb2sYin6Nq/0ytrfM2H01bZWumj1/1/b9TakA2gfvnXezOwVZMwMTyI2wmP3HQyfirIx4og0ZD2SzeEazNQ5oCucpOBsycQacoIQJHgZPVlwOT4ImdgIGJ9tFdpJVn4gWICSZGgeGYMFl86zzhFM8EyR4T5n9MpFD9iOe1wyBTO50LVtkGm+L18KOkTB3+4Ad4FR5YsST5PFQG2tJ7Pj5vBYrFkzWugTUYCwDjPtlTQ49ZE0j/+ctpuzBOhbDuSiOxS9eAjRqYAUAAA==';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for asia/bhutan.110m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get asiaBhutan110m {
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
