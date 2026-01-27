// Generated from: assets/seven-seas-open-ocean/british-indian-ocean-territory.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for seven-seas-open-ocean/british-indian-ocean-territory.10m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE7Wa32sbRxDH3/VXHHpqIT3m9488tlDIQ0mheSuhCOeaChzJyErBBP/vZZXEOPaug4fKD0Knvfvc3Mzsd2f2/Gk1TevjzdWyfjmtf102x4+H5Zf95eVycdzud+sXbfjvzz9fr19Of66maZo+nT4fX3g6/TRwddhfLYfj9nTR19Onab3bfDhd8PNhe9xe/zO92r3bbnbT64tls5veLIfD9rg/3Nxxpmm9vd7/taF2zavXj37nz7+/uT9wsd8dt7tld2xjfyz/LrvpetlcTz/sr5bdtG93+nH95fTbO4PfL/sPy/Fw8625X5/vt4+Xx+3v+8ub9198cnev/eHddrc53nPO57/73x8ePT6eJqdZzJUzXzwa+8lnDo4QeTD09uG5fa4wgVOXK2jCpjUuUzj27RVSjuAiN9JV+34QIBP73+1lNEjxGpcA3azPBY7wmr3skIJ9LjlgGtW46jaylyyYpJYP7ElC0uemBXiRG4Ep/fxlIAUp+iHN1H3AlbAiVzBFRvaiM2pxHpMBD9KMKBnOMC3EvBg1IUvGgeoAZ2hVHZ5QHSaiatREEAbZKyQZWIyak5kN3JuZ6UXVCTAhHHBBtRq3EBQcqG+QAmSVa5TR57omJBa5jCYD/zpQctVeYBypuol5FKebu+Mgz9gp0Ir54OJBAzVzU4PivHBU8kE+eEJQ0b/Pr3ZWo6Nv7lipvEKIqG8LeZBWn1FBFPpzlFhQJIoamA4+sJfMOYuxVvMcrIikilKd++5Nl0f+FdTiXApTGGkVkBAV/evgyIO5xIxRrJDEAigGlYGAJhQ10EEsB1olEVmOm6SMKnE1lWrJ4QkoA65hIlY1UFlH2qrk6VX/CuXIXrFkr+YZB9gwH4CgWnMkD7xAjF7tcyI1eaDYkEFRtDbFOPvepTTUan/6fFU/0wqDMysMMtNmU9JapL/HZclKqBsWnbXnuoZVS6kU742rxNpL+MY1llJTgDMbgXebjZN7k7xq77PDdrYUIkMB7hXQ1lpkg9L2UONKEI64mhiVxaNxXSN6i2jjkpfW0IaNgOyHhD0QrOoGZ5HeGtq4ANWpREYcMLKXs1T6NCxkdtvKkxuAqt59dpKdTzNbG9BdF2zG1EirrOY4s4hzdz/UZgIJ8VrCsyKE9H1HAJSlaqlxzaHbRdiMEc6l/dAmmqDU7ZxtRvfWnxTtZYruzkTjBmcWxVgcUPv+xaju/DQuUQ65AcFF/z4/f882l9yZuiKkswhgZk0u3AUDeo+obRu/7Dp30fCBvaxOZS46Zy81G5fZuOiHocg37qmWKnLFdGxvKFYaj0o6nCkzaSZCkW4PpDOTB3Ktq2ilP/Y9x9Sev0gddZgnLAnXeiuiGGhm40oA1XbLiSHNe1WNzoxJFrXeqhC182kb+6D415lCSbEoFhwp3f6xcSWpiBVigxGWkbVWaLqoKHOf6+GCtXLJxSFG9lqmUpH7/LCdL4WsvVbur2PEplF61XpaFxy6fXTjelqxqXATSRvEmrP4cqJxG7gvb8SJWdymcAs1Hdlb3Qgvxe1sOZTWtqpGvhNPrT3j01x0KC2Qjeug3X8v0LmtnVFsV9LahsIA6+JFNU4j5xiEmiyDa11FGtqohCUG8HLYnrCXkVBrspkmhjDwLxNrcRuokL7jqbR6+O129fXz7ep29R/i/w9IdSYAAA==';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for seven-seas-open-ocean/british-indian-ocean-territory.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get sevenSeasOpenOceanBritishIndianOceanTerritory10m {
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
