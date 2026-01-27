// Generated from: assets/africa/eswatini.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for africa/eswatini.50m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE52WXWsUSxCG7/dXDHsdm/r+8O5wwGvBC8GDHJY4ykLcDeuIBMl/l9mYYEwFKfdi6O2afqaq6+3q+r6Zpu1ycz1vX07bV/Nu+Xqa/z1eXc2Xy/542F6s5o9301+2L6f/NtM0Td/Pz6cLz6+fDden4/V8WvbnRfevT9P2sPt8XjC/+bZb9of9w4pp2u6/HP/f0Wp98+7JPJ/n3z4yXB4Py/4wH5bV9s/H0/5yt/1pvX3w5NN8/Dwvp5vHftw7/vp4dfPpZ5wP1OPpw/6wW34J+O736/j3f9PEOFKChOjiN8sL0pHqhk6PLO8v/ggkNE8vgRauTVw4SoiUuEATsCbQBIRq/8KcQrsBCyqylUAX0+jyOGjd9ppHaRFdICuqcQlUVTNpAgmcSUoPQ5g1u0CIgNCskwxmgl0gMwPEU6ANSHflbAFhpCihlEDCrqphBDATFCmxIcji1lM1DI8EIy2BqtIVzQr0kmar1rG7fZ5nXVRANyH1rnsB5hzlBnoo9RMc8axiPImDuh4mP6NpG4kaBNzVtDF7FEAfiMQg3j3GLkBclFYfxLF+q1sJLZWxSIoPSlVoZhnXeqceWAEZMg26HqYGZ5QhM2j0K1eKQXIhGx/obNyUDY40x2eOXhqYSPcCzRQnswoY6BLQA9IAkgAp7rsViNgNmQbc3eMl8O5bTSAireWwBHKKcu86oYGgqWXESgCY7S10z7IHsSGSfxExSDBnWb1YHK2dEkGBqmWwQYHUjlfPh7W+PRU4uwkBixAvNxAR1m6nDQQVKz0EjL9oadJCKsnoSCcy7bat3T59U43vR7eb++f7ze3mB0j3BFJQDQAA';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for africa/eswatini.50m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get africaEswatini50m {
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
