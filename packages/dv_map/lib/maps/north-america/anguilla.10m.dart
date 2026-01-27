// Generated from: assets/north-america/anguilla.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for north-america/anguilla.10m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE7WYTWvbaBDH7/4UwueumPeX3sJCoYdd9r6UxWTdrMGxg6scQsl3X+Q0IU00h0yJD8LSI/00muc//2ek76thWE93N9v1x2H9abuZbk/b34/7/fZy2h0P6w/z8NeHw9/WH4e/V8MwDN/P29cXnk8/D9ycjjfb07Q7X/R4+jCsD5vr8wUXh6vb3X6/ebpiGNa7b8d/NnQe/fzqOD8cv3g+cHk8TLvD9jDNY38eT9N/w8X19rS73Kx/nHT/FNDV9ni9nU53P4fzGP8ft/tp99dxf3f145mf7nA8/bs7bKZnD//we/7/5d7r/WH4zXgEcE798GoMYyRnQPMXQ19enltwOTBdlsHmTl2uKgTHMleFObMJNndPXAaziXcDDg3RIsPojhFNcDpxeAEmsWyCkciTikxAgCs3wSwsUYEFwq0JFgJPWgRjBoo1RYHmwbYcMVoyRzcVCgpFjtESUrCbYwuGIhXOAt6NGDkEeBkcGWLdiCGRqohDQaRZeQjEpssFggECTbVBpmJhbeiGLtT1TDeLwjORUqOZYkBU0QJMIKJdMIBqFlxnI+lwacykhFwWG7FFcKugaUyniCyWD0tybs3dGWyiViykGqZNbnBmLFcHuQlLV8VvXvhX1d5Pd+w0IUKe5ss60qQQaPq3EKvzsvANAKRphkIRRBUXybjpWY1MvNe00JgaBFJoOlIIW9qbwQZpResSJKldsAEgFkbnbu7dMlSzjMLpXNh6DkpjirNxAQ7g6PWdM1hSpXC6YAfoRswEYIUjhTP2tE9jklpQYUmRTtRqaOeIObBYTFJUoMsVNyviTae2JBTMrYqXkLEb79vr+f08n5SAoaooyqaBEhtwKXvK7HkWjyRqUPU6wYS9epoTwepUmaH1G2syMobSZaFXTjMXxaXQpxuJNVfVN0vi/dSJIfObR9EnBoi3OtsZbMJY1KCFcHdWMAGSi1mxJOi2JJhEWIIjsP0OHOlQ9DpkLpbN9ygMByibfGXpg1mlqihT1F6XzyN6SnKxlJgp9Bqilo7fsahcqJpuUW/ryAXSK4ESOHW//jhyFp+VZhNM6daqBWP1smgYAV2BWkJULckvKd+RwCodqXY/eaATG1Wl+muieJvWatmvXv67Xz1uv6zuV/8D2yRJ4a4YAAA=';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for north-america/anguilla.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get northAmericaAnguilla10m {
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
