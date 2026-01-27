// Generated from: assets/europe/slovenia.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for europe/slovenia.110m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE5WUTWvcMBCG7/4VwudFzGg0H8q1tNBLKRR6KaGY1AmGjbU4TmEJ+9+LneyyiQVFPghJr+bxOx6PXhrn2vl46Nsb137pu/l56j/l/b6/m4c8trtFvn/dfmpv3K/GOede1nEbuB5fhcOUD/00D2vQ+bhz7dg9rgE/9vlvPw7dJcK5dnjKv7uwql83+7Tu//x2LdzlcR7GfpwX7fPz8sr2TT1dnDz0+bGfp+N7H2fj3/P++PCW54Wapz/D2M1XCb8+1/OPK+eQvIFEZd59UKJ4hkQg+E643f2PJ8kQCzRAUbVaWiIVgrDhseeEgJwqeYoMnKzEA6BAVsWLPiImsZK/KILCWsnjxAhpWw32QjFFqMs3+kQcIpXyjYqSuK4e7CmoaJQSjwOhxGoeJaZU4CmhWuBKnihySCV/RhGZpJKnYkph6098IEOwUMUTzxINLBa7jZQr6yueFBhKzWsRKWitvQAhpMLvLN44kNV9vaXnUaRQXfFiJAh13cEeSSFhkcemEGq7TSgsbVDgRUJDpcrbpfIubUrz8+zUnMfb5tT8A5nG/vTzBgAA';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for europe/slovenia.110m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get europeSlovenia110m {
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
