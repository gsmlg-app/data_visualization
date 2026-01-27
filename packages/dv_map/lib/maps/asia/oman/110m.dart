// Generated from: assets/asia/oman.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for asia/oman.110m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE51Xy24bVwzd6ysGWgcE34/sigLdpe2+CAohVQMBtmTYysII/O/FyHHgB70oZzGYubxz5lySh5f3+2ZZtuf7m/3247L9bb87f7vd/3q6utp/OR9Ox+2H1fzv4/Dd9uPy12ZZluX75f72w8v0i+Hm9nSzvz0fLh89TV+W7XF3ffngj+vd8efsZdke7k5/7/hi+fRmXB7Hf39u+HI6ng/H/fG82n65O+y2P2wPPzl83Z+u9+fb+5cMnih/+nZ1Pvx5urr/ejq+BD7d/nM47s7P1vt4PX9+/fb2fVnMgDFFiT68sTFDYIq8Mnx+PbNFdXe30hYV14togKtQVZUUb3GpLrbSAewPSpUt7MUmM9xIplRpcANEK5Qn7hUgTAv2BtfBjdBG7hWwQMPs+DoEhjvHKGwsxda7AVUr0UewUYTI3NItQy+vUfZyaCH2fJlTTCfpYMBeJZ0qKMCFBWsStlVtpNWqIiBTiXOSZg7rUhmrxw1H9xzhGjFldXFLwAyiUdVxcCy3lm+ChbLHxL8BLMrehS2hNGoUtQAvlXqHbakG1kQVAZEZiB3dAvSwwIl3A9wtvFVbQYgj2gg22SXYmq0CgVUQeSK2BBQVyh5Xk1RiwjdBMyqtCduKy7naRrjpRErdlklApCg64VvAyYrRFAcmUJFMm4i4QJWpqEkHJghS01E+FCQ6abcHMYMQGuuMb2Kid0WdGUzEiWduMMRq3cvgjhw4SYcCSjTsajozVLGUTVScEFxM1MlCwNzcY+LeBBJfa2GLGxoloz0+4JL4XavDAhlpNZKFQ6qRdlWSFVjJQyZV3UHKU6PHLdYQnuSZQaaztGVyxcWc+dcgUYmyyzNd+xVHnfGtJCZpWmpWIEFTnvVmxulCfT6UiOOsNTO27I9BAmvJ8ZodhFhUsz0ICRBh1aijHhzbNu+9vfjf/z5AOrATaluobN0HHH0SkVVIpExdvTbIsiqceM5B0zy65pMd1g6cYpKYDuKM1Ap/XYuVjA4NDhiYjJ2QHNBMfSTQUdzez6HN66eHzdP98+Zh8x+QNnTGwxEAAA==';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for asia/oman.110m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get asiaOman110m {
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
