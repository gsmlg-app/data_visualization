// Generated from: assets/europe/guernsey.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for europe/guernsey.10m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE7VYyWobQRC96ysGnR1T++JrSHwK5BqCCcaZGIEsGXl8MMb/HiQveFEFXMQ6DDNT3a9rql69rtbtbBjm083lOD8a5l/H0+l6M35eL5fj2bRYr+YHW/Of+9dX86Ph52wYhuF2d307cTd8Z7jcrC/HzbTYTXocPgzz1enFbsLx9bhZXY03TzOGYb64Wv86pZ31+M17vn//47nhbL2aFqtxNW1tX663S84frHdPnpyP64tx2ty89OPR8W/Xy2nxfb28OX/42Cfo9eb3YnU6Pfvq+9/z+9dPb5+H4RMdagAx8MEbm+ShJGu6vzKdvB67F9dIjJj245o6aQ+WPSmigOVQ5h6uAqlnhWsJTX/V1KTA1RSMJiyGVLCihE49XKNULtgg7NmMroObFlnj8Iimu86iWLjLLBnSDEOyoBW4ECm9OKgzQur/xzUJSdmPS6kIPZqphoMWRUyOib2qUCVw8gLXHLjHBxXM+Ii8sUB44S8bkfREUpk8tPI3EqEZB6aUKPggFNqUByVzoqKONSSoi0tIUuB6plmTZ6BuXsQhPZOafAC0LOKrYKbZjAMGYezng6IqZZdngVnEQSGDGZt1nKpZ1EUmczNt7+9JZtXTixUb/REbu0a101qI9KSVzRBLXHWxHoXYMozK0oeQXqrZyajaYjhAtUdNdhUvpVVF0bq4EVJuBQJdWEb0ApaErNnQsUuQFbiY6NorJfaAwEJZkVyaysrOSlJ0MojaVWw2MRUscD2cex0dqwhA2ckEdPOmxnXDDOzaLLf3y86HSSD6dsX93HRGTuiVPnpYJYHOkEC9XGNKIBf+knhGtnAJxKE4bTgJQrOrIgzJost2DEvtxYHIiGy/ZDt4MPa4SWhhhQY6MHS7FAII1v1bgYM6ai++GB5pRd4QjKPLX2CMIm/EhE13/wkbLtqTqkYZf5ikiLJV55PA8F6BiiqYF5uSKzRPf6KyPSwU/w0ZMnbdZdYo3DVC6forSgRVGES7eiLiQVK0asGp0iP8u8lQ03L2+u5u9ng9md3N/gKLf9FQURYAAA==';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for europe/guernsey.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get europeGuernsey10m {
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
