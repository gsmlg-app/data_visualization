// Generated from: assets/africa/gambia.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for africa/gambia.110m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE5WUTWvbQBCG7/oVi86OmNnZ+cqtDaSnQO4lFNVVgsCWjKIeTPB/D5Fj4yRbyuqwzM678zCvZtmXKoR63u+6+jrUt107/526m3Gz6dZzPw716k1+PKaf6+vwswohhJdl/Vq4HF+E3TTuumnul6LT8RDqod0uBT/a7e++PZ8Poe6fx19tXLS7L3k65r9fCutxmPuhG+Y37dvj1K/b+l09nPt46sZtN0/7j12c2r4fN/und5dn6jj96Yd2vrB7/C7jz7sQrlAaRdJotvokITXsydnkg/Cw+i/QEnJMkgEiIzl5GZAbJ4zOngMSREtYChRHAOAMMCoQUzGQEQ1jHmgsXvgPucGEKES5oYAzYiEwNYoRXWOuQ7cIoqXAqKqAuWsTDdi4jEeNpeT/csyQyh1DEveYMkD1BKKF1zA1pKJIOccSWQxiKVBMgSALJCAuHAk3YKjEOcemkhytFEhuqpCbiQmQWDFQYmKXHFAisSmVvjWFj1eVi0/RoTqtD9WhegWLfQsiYwYAAA==';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for africa/gambia.110m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get africaGambia110m {
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
