// Generated from: assets/oceania/norfolk-island.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for oceania/norfolk-island.10m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE62VTWvcMBCG7/4VwuftMppPKddCoATa3ksoZuMEU8devM5hCfvfy3qzyyaRKTL1QcgazcM7fuXRa+FcOe63dXnjytu6Gl+G+mvftvVmbPquXB3Dj6flXXnjfhXOOfc6jZ8Tp+1TYDv023oYmynpvN25squep4Tv/fDYt3/ct11bdQ+XPOfKZtf/rnDac/tpnU7rd9eBTd+NTVd34zH2Y1NXXVOVb+HDRdBT3T/X47B/L+es/2ff7p/eyr1g++Gh6arxqu7Tcz3/+OacV1vHwJ69rD6EvmBcg7dAiu8i96t/E1UCQUwTffDss4ksokZJIngk1mwiqiAniGEdo3H0+Ro9epypWcVTvkIWmyFCMPT5NROI9zO+oKe44CvGyJj2xUdWCvlEJKO0RgzGS3wJBJwmklKEmK8RvKkmiSwCIgu8JrQkUESiLjnezJguWpUo5BtDqGjhvxKjgaU1iphEziYKsIBPE1WMFrQyMOB00aKg+RJVlTltdQDwYAuIHNJtwsQs5B9vtciadtoQSPKLNgCdOd8aIuf3RiMOMANcdhiDAOnMLxhRQr4vx/4X0/cqo5jka4xKHNJEFOUFGjPv/iI1P88OxXm8Lw7FX7imTOGsCQAA';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for oceania/norfolk-island.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get oceaniaNorfolkIsland10m {
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
