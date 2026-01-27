// Generated from: assets/africa/western-sahara.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for africa/western-sahara.110m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE62WTWscMQyG7/srzJxToS9bUm6ltPRYyKGHEsqQTtKFzU6YTA8h5L+XnWRDEg8Ul8zBeCz7QbJeCd9vUurmu5uhO03dl6Gf/0zDp3G3Gy7m7bjvTg7my8fl2+40/diklNL9MtYHl+2L4WYab4Zp3i6HjttT6vb99XLg+3A7D9M+nfW/+6l/PpdSt70df/Z82PP5a7Uuy/rZK8PFuJ+3+2E/H2wfL6ftRd89WR+e/bkaxuthnu5ee3N0/9u4u7t6ivaZOk6/tvt+fhH24/dy/vYvpQ8OpeTsUU7eWNig5KKc45Xh/ORfPCdzdnk3noW66wqOGEsUacIFKAmK5RUeuqsVauSZZFGp/SvgBUPVmniEQB7Kyu8HzJm4cJ3gAhHoaKUNSCDBOWuseeiirK08I2cKX+ERKgY1RsyAgpZ9DYiCXgq3AjNiFLYKqGCGRI0iJAEPIsJaNQIlCLGtRkiBmahYHTGDEFKRNlWTQhF0WYmYFhVKeCvQMkbWWoV0uNyC2OihASJHoTpkAmU00cYkGyCj8kqnOQBZCBuTbIBFlKWuZISIsMyNIRdwzRSylhQREZbcquvgIKS6kgmEDQ0bW4MAkVvW+g4ZzIgZmyvPTZmplo0Au7pwY1IIQoxZ6/4vIKY5WmVDECWUvL7DDCEimdsqxaG48VqSM7gT5sbmdeCpxEp3NZDIptqmwuW9QGsXaJA91OI/eC3vj83a/Dh72BzH883D5i8wEOZxLQoAAA==';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for africa/western-sahara.110m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get africaWesternSahara110m {
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
