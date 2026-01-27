// Generated from: assets/north-america/belize.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for north-america/belize.110m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE5WUS2vcQAyA7/4Vg89bo9dImtzaQk+l9NwSitk6qWHXXhz3sA3738s62TQbD5TxYdDo8SGNZD1WIdTz8dDVN6H+1LXz76n7OO523Xbux6HenM13T+qH+iZ8r0II4XE514GL+2I4TOOhm+Z+Cbq4h1AP7X4J+NDt+j///EOo+4fxR0uL7dtKz4v+85VhOw5zP3TDfLZ9Gaf5V3i/76Z+29bPTqeXdO67cd/N0/E6mUv2X8fd8f652Bf4OP3sh3Z+VfXT91p+ewvhnacGhcFBNm9MaI2DM6Yr/e3m/7wIDprBAcZoaqU8ooSEtgLGxl0Tm5YBvUkMiuRZoJFxLAUakzCvS9aGmJXFS4ExopPEHFCjqEkpkGMUcsoAI4OZUCmQOEVcP6E1wAqq5QkCqUAOiIyauLjJmMxVc0DxJBaLMySPHNctsUZFULg4P2IxX8+MN2CqJoW/iTcI6kgpA2RxtfIXpKTMup6Z8zQxGRVPNQMAI2aAklJyKh5CSYCULVlcnaG4ZBdn4TXQGj9vQsfS3QWUPBrnugwYEQvHZlmuCVJuWad43gyFJZdu/yonX6RTdTlvq1P1F5tv/yqqBwAA';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for north-america/belize.110m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get northAmericaBelize110m {
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
