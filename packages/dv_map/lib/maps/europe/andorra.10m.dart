// Generated from: assets/europe/andorra.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for europe/andorra.10m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE5WXy44TWQyG93mKUtYt5MvvG7vRXJYj9gihCDIoUpNqhbBooX53lEC3aDAaOYtSpZzzxfb5bZ/6slmW7fn+br99uWz/2e/On0/7P9fb2/2782E9bm8u5v++Pf60fbm83izLsny5Xn9deP351XB3Wu/2p/Phuujx58uyPe4+Xhf8cXy/nk67pwXLsj18Wt/u5Gr865fnen3+7zPDu/V4Phz3x/PF9vfnyz9uv1sfnhz5sF8/7s+n++duPPr9ar29//A9zCfqenp/OO7OP8T77fPj/c/floVfBAWR281PBsgLI4lke2Z4c/N/OCYXzQ4nEWAZ4oQ9xTsc0th4iNOqaGnODqohzY2K2lhdNWTqnDNTcIsLh09TZ+KZ6HDhHpnTnShoS0shYkxlosptqFk2D1W4qlWJU6UNJeyUSugqwjlZVGc4q1BUF6sLl0wLzKCU2YnOUeocQ5xE/CZ1SFMMSwKVAHUycZCAhqKDezJ6HMNsqBMYg9HmjoSMp8FKSYV2Ki7TNJ/iLhmXvijUbag7cElIW2OXHZepd5ykXG13qlQeB+ugvp+4OWy8Fa5Efe/kqKlzVOHaTx1yyjHOYd7qREq0pkUhWdnLThk+VjHcrMdxZfqwswNVHq1OCBQ6xSmJRNeMUWoW0w4gMGinE5RgTKOwaisW6eE83Vh1SEaHM0XK1Lvf40BlNFUxoqg97UDh8OFpxyjh1tUYJD1iOhbZXanViZQRpkNbUqh1TiEq0yGrMO6d0yqOaeo007jrnYC56VAnBkClxRldamx6fApE9Cp2SExxWsYtzS+0YercSL09jKEUNC0xN61sX55QbjIdFH4dpW2wl4FU09RZRaBtT+XJMmxP7qLW1n9psAwrzAOCdsaiyCinuHRV68YOipynx2KvQPWxAj497AzfsTfd/ePdw+bx+mbzsPkKRtjk9AkRAAA=';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for europe/andorra.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get europeAndorra10m {
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
