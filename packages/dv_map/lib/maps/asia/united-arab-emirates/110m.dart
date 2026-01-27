// Generated from: assets/asia/united-arab-emirates.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for asia/united-arab-emirates.110m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE5WVTWvcMBCG7/4VwudFzJc0mtxCSc+l0FMJxU3cYNi1F697WML+92InXrqxSpEPRtZoHt7xOx6/Vs7V0/nY1neu/tw20++x/TTs9+3T1A19vZvDv962T/Wd+14559zrct8mLseXwHEcju04dUvSety5um8OS8K3vpvaZ3c/Nj/dw6Ebm6k9XbOdq7vT8KOh+eT9w2afl/2vN4GnoZ+6vu2nJXbqmvo9drlqemmHQzuN51tFawlfhv355b3iK3MYn7t+0baW/nb9vf745FxAH9QCJt19iJB4kiCmeBN43P2PF1EVNGZ4gEJoXMQjDwDKzBseewDEIKGIFzxATLDFkReLJlqKI0gsiBmeQuKyYoMnFkkmmWIRwYy0kBcopJw69oEkxUIzZl6KjFtz2RtzBCnEWUJCTpleQYYgZIW8BIL/6OVoEYRKeSkSU8jwbPYdYhEveraYRLf2zjxRpjJ90VNEENzWG7yiRIhlfkQPColg60f0EILE4vcnbECS0ydsKKGMJz4aA3HOXzVNRmX1igdIAGC5/iPUoGX9x15A5vGS4wVkjKlw9gVVSJDrP1QVLvx80asJJ9sOv3k2W6JY5gd6DSoCuVlPJqCl8gp/RVVuva4u1Xp/rC7VH/nPeVU8CAAA';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for asia/united-arab-emirates.110m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get asiaUnitedArabEmirates110m {
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
