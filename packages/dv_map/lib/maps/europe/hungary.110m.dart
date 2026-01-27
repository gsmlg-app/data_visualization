// Generated from: assets/europe/hungary.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for europe/hungary.110m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE52WS2vbQBDH7/4UwucwzPuRa2npqfTSUwnFpGowJFZwlIMJ+e7FzoMkWgpbHcRqR/vTzH92Z/SwGob1fLgd1+fD+su4me/346fp+nq8nLfTbn12NP95mr5bnw8/V8MwDA+n+3Lh6fWT4XY/3Y77eXta9PL6MKx3m5vTgq/3u6vN/vC6YBjW27vp14ZPxh+LeXma//bWcDnt5u1u3M1H2+f74xfXz9bHV0euxulmnPeH9268+P19uj5cPYf5Sp32v7e7zfwm3qfr7fjj0zAwA6Y5pp59sGiCMrOrvDNcnP2bR5DBLN7iCVUFZhcPIZG4WjhnSVPqxGmIOTdw5pzWCWMpNG3GymEe3MOjgvDSwGjwGNmLuoKlAncSF2/x3J20OnkUKq7V4BGRRPbxEiICWbPBw6Tw7Np7lODlRrz0LyATyyS6eAFpQcJL/QLCUrkz3gDN1Gj756Huffl1qCh3b+lHLFp94ToUSphSK1zSdPNOnihaqjR5XEh98jmYKHu00qHlFL3qMTJXLmuBQxpLdkcbaGgtmpJwZy1wMNds1WUHO6YJe8XLZCNbJtdBEl2oqy5TgAuiN+q8QRmFV182EtQcnZf6GYSVZmftS8hjbhu1xaAwM1j/gye51O+ZF32HrcDKUbW1XygouHr7JDNSNfRzIA71ru3CBMhUxsuz6yDkmH3eETi7UaNzOFQpS/TxGLAqPJadMsCDVarvr4UhCE1ouZuPnYOppE8+BldMqmanNGSpruLS/5e2ao1fRo+rl/vF6nH1FxZil2lMCwAA';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for europe/hungary.110m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get europeHungary110m {
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
