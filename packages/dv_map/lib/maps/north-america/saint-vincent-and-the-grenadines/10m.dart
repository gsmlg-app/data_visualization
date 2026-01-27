// Generated from: assets/north-america/saint-vincent-and-the-grenadines.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for north-america/saint-vincent-and-the-grenadines.10m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE7VZTWscRxC9768Y9uws9f3hWzAkp4RAgi/BhEWa2AvSrFiND8Lov4deWcKWugOpoD0sO9Mzb2qrX796XfNlM03b9e5m3r6dtj/N+/XzaX53vLqaL9bDcdm+acN/P5y+3b6d/txM0zR9OX+/vPF8+Xng5nS8mU/r4XzT4+XTtF321+cbft8flnV6f1gu5mWd9svltH6ap59P87K/PCzz7RPSNG0Pt8e/9tTuev/uxXl+OP/HtwMXx2U9LPOytrFfj6f10/Tj9Xw6XOy3Xy+6fwr043y8ntfT3fdhPv6vXz5frYffjld3H7/m4ukJx9PlYdmv3yTl4fPt7+dHL4+n6QfDHSZnZrx5MYi8A7ZQ5GdDH55fOwIOYrQ+sABRWBU4DXWAyxZONVwCAKNRwM4QXgVGCRukWBFdqhEjIwkNIsZA1SKwQKoNgEmIXarASep9XDQWLgdsBDoIGJHQqsCc6jSIGDgUiywmTkOWDjDtMtWzGrARY/SWR8NF1owisDsh4ijgRMdXAI4Qh2rEpoYySHGEo2QRWFWiqxQN2NrfqdLYVXpC0XAJicu4JDTIsItnVBPB0u4fBUyiVWX7l4D/Fy6ZULfaNRIzKlQzDME00glisiqJC/V5Mzr67pEls2DO4v1gUAysqt/IAQh9/cawRCsWHCQRzP68kFh6NWDiZOxpC+8YglSqtonZPQbASm5ZBRYA6a5V3rE5e9HdoAgwDQJ2gYSiuKAisfSNHru5lznhxtETF95xgJsUNQDDkbhPYg4QjirZMpEGBpLdgaBqQpCAdJBiiwiqApOkDXBF3csBM4YMNhWMllauN8zpfVxKYa8WSAd27XONEhDKvtRUmfu4AYRR9kyUFH2qkZuwVGfOzaJb0psQZ4JUd1eebKOpQ43wsuFFVuwLJoYplC06AuZA2LCVK6x6hVBCGETMpMhVjf/vdf/1TIgIcmrffRt4lEVAJBh7a6rhZjIUsyfaPn3TaeAQVCxkoq0K9vd6BiLsxcUqKmYwSjG4VxsLoi3k7AJrmoaUU5FB0Z88TRStdixENalX02mnYRBWtGMiTGT9rZOGokI1xUxO0Z87DQ+ucoLMqFvKzhkOqzpeoWTtWukz2SSrZqEgFK+nWowpMJhvZ/bEIkGZrG+/z7goUMVlZfU+8528dWHLwCFd00k7RxcuB8zp3JdZh9Dy5pQ5yXgQMGA6FgsDK5gOOGGZylBcUqwM2d3iNGATr/beWQRhtKSSwaprlZkjBzS2ZI0y2yhYB/1Qy5RqD5BJtd+xOLMN06tzh2nZfb/Rlgdn2YEzCtugz+oEkdXNHqM17IEEAUh191TQzNcTcEx0w768hLV3XeXdPYyayaEaVlUXDDccEKmpYVb9LLYVxX0ihRGAVjs+LqndPgftItCj/C4yGL37PqsBs2RVaAukGDN08/zX/ebx+8PmfvMPuUH/nC4fAAA=';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for north-america/saint-vincent-and-the-grenadines.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get northAmericaSaintVincentAndTheGrenadines10m {
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
