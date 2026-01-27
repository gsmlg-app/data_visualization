// Generated from: assets/europe/san-marino.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for europe/san-marino.10m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE5WUwWrkMAyG73kKk/NQZMmypV5LeyuU7nEpS+hmS2AaD2l6GMq8+zKZzjBtVYpyMLZ/68svW/ZbE0I7bzd9exnam76bX6f+qq7X/eM81LFd7eV/h+mX9jL8bkII4W1pvwYuyxdhM9VNP83DEnRcHkI7ds9LwK9uDLfdNIz1FBNCO7zUPx0u+u2XeTrM358Lj3Wch7Ef5712/br/afuu7k5envr63M/T9qOTo/W7ut4+vWd6otbp7zB281nKh++8/3kUQsSLhJoY0uqTkuhCFIGZPwgPqx95GRJnNHmMrG5eEZQsBk9jASrq5pWkpBYPATj67QGa6SoSxpzcPOWS2eSxAKCXJxgzkMkrGt27JwSabHuKkNw8BUI2t480smQ3D0nRTJdziuKuPtEoYvIKRXexfH8YgpyzeHlMhMms5aLA6OZhJBHzruWCUdynGyMkKeZpaM7e7SPlzNZLpUkSSPHihDPa7jAxJe9VI1WWaPoDwljctex7mRurf+ztmmP70Oya/3eZGrpDBwAA';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for europe/san-marino.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get europeSanMarino10m {
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
