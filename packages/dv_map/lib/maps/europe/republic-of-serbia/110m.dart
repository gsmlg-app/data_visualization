// Generated from: assets/europe/republic-of-serbia.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for europe/republic-of-serbia.110m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE52XS2sbSRCA7/oVg86mqHdV55iwew72cQmL4h0HgaMxinwwxv89jPzASfcu1OowzExNf6p3Vz9upml7eribtx+m7Z/z7nR/nD8tt7fz9Wm/HLYXq/jm+fWP7Yfpr800TdPj+dovPH9+Ftwdl7v5eNqfF71+Pk3bw+77ecHlfHf/9XZ/PS0309V8/Lrfva2dpu3+x/L3js/fXXXvZX1/dfnxveB6OZz2h/lwWmV/3K9/vn2RPr3p9G1evs+n48OvGr2a8Hm5ffj2YvEbdTn+sz/sTu9Mf/69v//9aZooIbkla178JlGDhpnB+ovgy8V/8xpgcHgb4IzJiKiIk4YaFgMeixuZV9VD01TveArpyKL2f3j/Rqva6okyZFVJROE0ICkLRpFlrcXIXyipVZaadiQB86ymBVMaj1AsWc1YTck+YQXEmFuR5X38BJgksghqloOsFyB0LBnICCKtT1GGbGlcRLGFDVnEUSodRtDm0fudIVO95HdGcDHs9Vpd71HKLUZI0kFJC3AwVm1s5tYXogAJtloYCUhFmg1g6OlZ04yAQ7nXjKFhs5r3CVTS+xbBkM5W1ctFsK9sBo+gUrthggjD3mEMnlxFuXMbqaXSuFZEBKYiI5YwctVdFu4y8j2rMWs1xxrFoI4YBMVrLAZJNB52i7OhrWYqg6kh0YinTuK1KKyRc2va91gGSxSmKs9RE2mUbmujpSztAMzQ0pFyVO9MRF7WzxDJfLSnuPLa86r+I1T1fj9XQEx0qYbXLUhbr58Ci7baMLWqF4qYI/UUG3OUBkdmCLRg68OhYJGIXA2vWkPm0bgXyEZRDS+pYQ72UwWNVC76j8CckXkUjvBsGlWephh73/YMKIkCq5NIhgrx6Nyi5BJWHZLCmUJHB5cQtZDqFMGM1LjPFwfiKA445yncUXWICwputfny+dgn2Q8AL8e+qE325WPkZnT/eve0eb1+2TxtfgJ3EFoB+A8AAA==';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for europe/republic-of-serbia.110m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get europeRepublicOfSerbia110m {
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
