// Generated from: assets/seven-seas-open-ocean/saint-helena.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for seven-seas-open-ocean/saint-helena.50m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE52UTWvbMBjH7/4UwqcNOqO3563XQullY7DjKMOkWjG4UnDUQSj57iNOE9LEOlQ+CD1vP0l/PfJbo1Sbt+vQ3qr2PvT5dQp3aRzDKg8ptjf78N+De9Peqt+NUkq9zeN14Zw+B9ZTWocpD3PRMV2pNvYvc8GvfohZPYQxxP5UpVQ7bNKf3s4ZD1d+d/D/OA+sUsxDDDHPsfAvRLUJ/UZ9SesQVVqFPn5t39N3p+09h/QS8rT9uLnjab6/jnn4mcbt87sCp7XS9DTEPp9JcfjO55fWta3UN+hQrHFMN9cxA50IETi5iD1eJi+DQcggF8CkWdjXgdFCgWosiauCkiZG4wpcjQZsJZhAey7JAEiOK8FswciiEthp7bWuvbiKjmhK1oclP92exncOvQNYOiZ1Qt4ZrOmiPdggCcoyGGovfA/WFpyYZbAD78VWgi0zkF8GGwtCVAnGfbssg5lBHEElmB16iwWwRUO1UggDF5TQQGgqlfDGizcFsK/WwWtGKWGRPOtagYWRzbLAQkBsapv488+u/A9oLme75jg+NrvmP2l1/ez8BwAA';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for seven-seas-open-ocean/saint-helena.50m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get sevenSeasOpenOceanSaintHelena50m {
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
