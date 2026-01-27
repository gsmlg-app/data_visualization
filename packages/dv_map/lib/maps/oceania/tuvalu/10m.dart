// Generated from: assets/oceania/tuvalu.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for oceania/tuvalu.10m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE7WYTYsbRxCG7/oVg85OU99d5WvAN5McklyCCWKjGIEsLbI2sJj976HH3sW7WxNQGekgNNMzj6qr3n7748tqmtbn+9vt+u20frfdnO9O25+P+/325rw7HtZvRvM/X29/Xr+d/lxN0zR9mb9fvzg/Pjfcno6329N5N7/0+Pg0rQ+bT/MLv939u9nfPT0/Tevd5+NfG5rb/nh1n+f7vz9ruDkezrvD9nAebb/cbDeH3Wb9rfnhKZCP2+On7fl0/zyMx7jf3+3Pu1+P+/uP3/r6xD6e/t4dNufvOv318/3vl1evr6cJezQMJBV886rxJ28qBN71RdOHl8/mYILo1CUHU4ShF8HYlSMWwGDAWAWrgi5EjMik1YihE4ilYAkX670KNg7wHNwFlK0GxggOylUhBkYaVXBXgjzH4qgC5Ygdck1IdEcrZ5iYMM+wQlg4VcGCSLQgNo+u5XEHILwAplCVcukudorV0tWzv7zctryxg4poGgx0AIBSL71xgLHmYxXIVLgKdkbxBTAHcZSU5I27SniufVADrxV8gJkBFyK2ABKupuLi4l1LSb2hkoZnwfThVmw1Jf0/mAAoalY3wMycmt2IOFCxVJcZDPkEOMBaHVQDDNC152B3tJLXzVwBzLxuBAxsVBpTc+1YZTkTTuUUX6y2a0nfGqMwZIZujYFYUCqdtMZEwpk+rVEohJeEP3ODOudgd+daVUYiAp2zWX6Ay95cyfD1jI5FwC0PBgmBrKhpVqNIVxzWEL1LbXk7gw09s40BFsXaKnSkwh1sKWJQ8moquKN5LiQER6stFwfYUVJrHhEjlC2UOTx3uh/O8cVyu57TIStZuuLQZkEOtY2SNRQX8ayX2jpYxyhpf4CBAxci9o7uRXNGCg/OCq7NeleQotchKalk2h/gQK5t+EvFu5aSogVYl3S1HY0jWKy4gQ1ASusdjb2Hcqne0TzcMF0tDrA5SvG4JEDAOJuNowmAePWMIIYBpxvNaEJgRROdawfR81QIujEXTwkKorieQt26S2STWzQWxqht22awCOUFZxHm6mmTd+yaTm7RWAGjGnC3MM7WD9HYKKxmzgPsQulefoChd6oO1sUt90ixuVoVfLkorqVQb+bUA7Je9iaBYsUDCwsUtHxjLOHGUFokDbAgUL4dlGCncsCcyrM3cS4eLc5pgMBsnPYmXVm1JPtRN2da2BVLF+7VIywzJVzKrwpwbY4a4B49FsDGVjP8ioKXR9Pq5a+H1eP3h9XD6j/wMhufBRsAAA==';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for oceania/tuvalu.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get oceaniaTuvalu10m {
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
