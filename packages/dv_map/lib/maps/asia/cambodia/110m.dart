// Generated from: assets/asia/cambodia.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for asia/cambodia.110m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE5WUTWvbQBCG7/oVi85m2PnancmtBEqgFHovoaiJEgS2ZGTlYIL/e7EdGycSlNVhGc278/DOzkrvVQj1tN+29V2ov7fN9Da298N63T5N3dDXq6P8ck7v6rvwuwohhPfTOi88bT8J23HYtuPUnYou20Oo+2ZzKrhvNn+H5665VoRQd7vhT0NH9cfDLM/n/M9b4Wnop65v++mofdt1Tf2hHa4+Xtth007j/rOLi+1fw3r/+tHllTmMz13fTDftnp/b+OtbCBgJ1MSZdPVVIkBL6vop/7j6D48hekzmecZDQOWUYioFimfK7jNghMSkqlIGFGAWZrEFoFhS4VwGVEB3x/kJRjBzjm5lvAQknuYHGMETGmIhTsEwKvHSRDTlhFLYbwZxlMgLN4Y5U1Qv5SUUXZgHg7Iqx2J/bJQpzwciQJFEYqHBBOKJM887FtAc1bh4wlHYJdFCy2YYHUtHTGg5p/k3IkCZqfjOCJChoOECUDBl4UKHBG4mREtAIs2ExUAWi+6ycITsQpK5FFj2I6yW4kt0qC7rY3Wo/gHsV+fkrgYAAA==';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for asia/cambodia.110m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get asiaCambodia110m {
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
