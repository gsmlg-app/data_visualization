// Generated from: assets/north-america/cayman-islands.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for north-america/cayman-islands.10m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE7VYTYsbRxC961cMOjtDfX/4FgyBEBxyNcEEsVYcgVZatPJhMfvfQ8veZb07ZUiZ6DBoprvf1Lyqel3Vn1fTtD7f3WzXr6f1L9vN+dNp++a432+vzrvjYf1qDP/95fHt+vX052qapunz5fpy4WX6ZeDmdLzZns67y6KH6dO0PmyuLwvebO6uN4fp19v95vDh9nHdNK13t8e/NjTm/PbuxXO+rH339unA1fFw3h22h/MY+/14Ov8z/Xy9Pe2uNuuvk+4fzfq4PV5vz6e7b416+Iq3n/bn3R/H/d3Hr1/++Ibj6cPusDk/oeDL7+n/53cv76fpp8AZ2SA9Xr0YxJxZJULp2dD753MLYHUPtQJYQTx7wIQYRLgMLAGSTYuJUdUqKlAlrAlsgey0DGxGHtIEDqPQAjfE1bu44IoFxWpkbSbcE6ikOFywC8wMUgD/UFC4Z0jhOxEw7FNhmVwAI3sbVwm9wOVQawfb9yhmYXfuAqcySMWEB3WVwiUSvbBYyUnbVAhZFsAEGd3E+x7H5BrUzY8YKV1FBbJZ13nJgVTI/I9EBQOSRsExgVFXKhhY0ouogASVpvOYSDgKqQAihWa4DXvRCyqAEKULbAIiBTBmSncDYQMtYAUQmgrEFplRlRQJQU3NZA8NLRTINdC7BLs6YZHPERncBU5B4iKIU9y6sSYQLFYIRQIhNfNZUIijAA5iiabKC5pWG7QDUHcjFdDAKILCmC2j6ztgKitjIoOuZIYqcEEFR2g0iyAOFbKi0CRh7EpxjByohM0VrGtwkgAsBxulUXaFIjWp2J8pUg27gpmeXEgbuaB2DQ6XsOWQIOMwbktmrWzkRCFd16lH0HKskQtk22JB8qIaJGdopx25sVrhO5Pgpk6QmViRHWQG2q4yJYKK9o48Ia1bcDOLFqUVRRJ3g4JQFLKwOMm8m3eYjIlFtKUhdqtMtFTgIj8y1bhZBCErAhQZnTC0ogkMZl6cUlAqY7eShzANKzZSyOG+LnAqeNV7KKc0pQIyFb3qSJ3RmimN6CpcHayQWzY5bhzjraq7b175388UYQYePfuyMQ4CrK2vhBmMIAp9cQCLXuzDDIEqvFwvWGhStmQAZshQLdpjcwvtSS3MiOO0clm4RroZtKQWZnBPK+p0UwHqdW8wA3BiEaKWQA4djj3ndE8uujdLF9UusAVaVuHGmK3zowuwkPGy8xwkATscD+BAoIJjR2GAlnAN54VzoeEOnC2Ke1LxP+mW5xyOEbm8AzqIsTUDKZJdi27dPM2p45YBrAoABXBCYmtr9ZzdObLQLUdma9VFA3hUtVTkFDv06qIBzKhoy1vrOBJv6eHAFY3MIlfVjVspNYBtNL8FE0rA1lSXAAr2wmKm6NVbvfyok3X1/N/96uH6fnW/+heMPEDCCh4AAA==';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for north-america/cayman-islands.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get northAmericaCaymanIslands10m {
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
