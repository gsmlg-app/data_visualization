// Generated from: assets/europe/ireland.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for europe/ireland.110m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE62TTWvDMAyG7/kVJufOWLIly72ODgY7jF1HGaHzSiBNSpoeSul/H00/aJvAMMwHI+u1Hr9G9j5TKu9265hPVf4Si27bxuemquKiK5s6nxzln1N6k0/VZ6aUUvt+Hhb223th3Tbr2HZlX3TZrlReF6u+4LWNVVF/XwuUystN81VgL84GedvnP95uhUVTd2Ud6+6ozbbHE/OzergaWcZmFbt2d2/j4vu9qXbL8zWv1Kb9Luuiu7nvadzGjyulnlhD8CIuTB4UslrYE9Ndfj75CxfIemtwgHPaeOsN2iSe1+QR2A/tOW0oBGKXyLPMxhoe4VEgcfBP9kiDBUbEJJ5oiz6IdyP2mB2BhCRe0CxC6GisuwKWkRN5wIyCQx5qYccoksgL3hshP+CBFjSOXBpPNDEw8LC9oJmDNZD2/Fh7EaERHmpkA+DT+sHaWAxCw/5aDWSBXdp7Sf292Vh8iQ7ZZZ5nh+wXaCoEFGMFAAA=';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for europe/ireland.110m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get europeIreland110m {
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
