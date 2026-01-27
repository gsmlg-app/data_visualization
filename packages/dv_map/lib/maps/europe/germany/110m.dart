// Generated from: assets/europe/germany.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for europe/germany.110m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE5WYS28bNxDH7/oUC52NwbwfubZpr730VASFkaqBAVsyFOVgBP7uBeU4cEKiwOiwWC3F3w6H/3lQX3fbtr88PR7277b9b4fby5fz4ZfT/f3h4+XudNzfjOF/Xx5/3r/b/tpt27Z9vV7nidefXwcez6fHw/lyd530+vNt2x9vH64Tfj+cH26PT98nbNv+7vPp71seg7++n57Ly/M/3w58PB0vd8fD8TLG3n8Zb9x/G33+bsinw+nhcDk//WjGq91/nO6fPn1b5nfq6fzP3fH28ma9L5+39z9/2zZSICpPl5ufRkwgLJCLfhj4cPP/PAHXUA+aeAoYZtTDMRilKuoCp4ES6C0eQZmzsS14VK5p1uIhlJR6rFaL6SXSxRkS8bwbCuLiGC331bDOolbmWbkrN2lMhb7ai0oh7OI4GTVzgUvBdNMOLsHYmWvlunIOlZZSEiyYaGWclLl6SycJiRiiK9khY6Q1jSOmQOdF0BpHFLesCyhxlpqtEwhNLssejhCVdfadgJeUcEsnDoVGUr7AaTJ5DxeAxWiySng0Mk0vZB1SOX3hOwbmkbqaOMuS8nmxBGncTccGlemWczYeOHKy6FlH5m456w4hUYJbxjmgyoiKBY040ahpHCuH0bRWLShk5vZa04XnyqMF6pLIraBwGH7jWcVawEhl2dJJAlZx5AqHFJHSzABW4jGndk0QEaSe7ALUPazmrQhwRstWxCYIhSBNITZoJBbV2olRKNiJaoEbdYej5boCKx3ABc7Y0LJZsrMcfY7YgUscvVqzo1BkTJmSsQYIsma0ooIQTNUWURFg7lLV2loiUHalJY4l3Hs4BtKhiJVUAgVTWj0F8ZBr2NxADekFS0av/WQoYecVTkf49doAEkC2NJpq2TBPwppZgBgylZBnsSRwFmmvESABVhGLVVpRciLt8qys1Gb/JWQEBVXXf0LCcyYoEAz0Xp4ahxUmZJ3KoxaYhpL1TgMMSkaFK/vKixh77mNgRaK5QhoCu4tEl1fuKT43egiaiuG9aBMQSZJVdxEiLNrDKaA5c8ynH4RiL2oGr15FQYt+hYAo2JvuU7DAoEU3RYDIItVbrwGSV9kkl2Efuof2zt4KjoGVq/WGGmWvsg1eGrKvWmXMKo3u/qqE1eJ0O9K2jnd19RJqvAgPhkpi752qhl5MhGx1rGJNCuqlg/ZfNbvV/evd8+71+mH3vPsPnH/OtlETAAA=';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for europe/germany.110m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get europeGermany110m {
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
