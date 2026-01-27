// Generated from: assets/north-america/curacao.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for north-america/curacao.50m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE5WSTWsCMRCG7/srhpyt5GOyk3grQo+ll9JDKyXY1C7oRmI8iPjfi9EVtYGSHMJk3pmHTPLuGwCWdmvPJsCevEvb6KdhufTz1IWejY7y9ym9YRN4bwAA9nn/25jLs7COYe1j6nLTUA7AerfKDdNtdB9bzj25cOkCYN0mfDqZK97+5FXOv94I89Cnrvd9OmrPIaYfeFz52M0dOxcdLpda+LDyKe5urzTM8BKWu8V55As8xK+ud+lq9tO6ju9PAA+tGZMWnFCO7iQhx1xbanV7I8xG/wKNJGVlWwAKbTSirQPaMRdKKDQFoDwKRNVAaklTCahQchS1PCEMairhSEmUspqnjTFtEWi4JIX1QGW4KX2JtAYV6do/tlYLQSXTCMyPUW0arpTkquRC1KgrPVPt6qYUD9GhGfZZc2h+AbP4U4yJBAAA';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for north-america/curacao.50m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get northAmericaCuracao50m {
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
