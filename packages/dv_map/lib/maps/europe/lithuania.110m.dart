// Generated from: assets/europe/lithuania.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for europe/lithuania.110m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE5WUPW/bMBCGd/0KQrNBHO+bWYt26tChnYqgEFI1FeBIhiMPRuD/XliOjSQiClADQfHlPXpPx+NLE0I7H3d9exfaL303H/b9p2m77R/mYRrbzVn+c1l+bu/CzyaEEF6WcR24bF+E3X7a9ft5WIKu20Nox+5pCfg6zH8P3Th0t5AQ2uF5+tXhIn9frdNl/cdb4WEa52Hsx/msfT6cv9m+qqeblcd+eurn/fG9kavzb9P2+Pia6I067X8PYze/yfjyvJ1/fAsBNXJmoiSbD4pI1CQJNL8T7jf/50kUImBd8zQmAMzVPADIxFTiKQuBVfE4uoI6c4FHhoLOVTyKbo5KXuChkVqq42FESEk0l/yROSSv4qUIIg5QyhcogWmdvxTx/Pd87U9iysCe6uqBkZIYUun8QRLMrpU8EzMlW/E4uqgY19ZDJYGkdb4cxdE41dqjBNlL9ghNqLI9KCJTdlu3B0dEENW6clBk54SmKx7FnJCz1bYbC6hTkQdigFh9vShJod04oiMj1ZVXoqkzYfG4sGbFuuOnUdzRMpbaQy2Z1PIqr+emNL/OTs11vG9OzT+PZ+iFRwcAAA==';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for europe/lithuania.110m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get europeLithuania110m {
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
