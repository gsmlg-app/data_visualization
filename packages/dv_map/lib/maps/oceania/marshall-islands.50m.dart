// Generated from: assets/oceania/marshall-islands.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for oceania/marshall-islands.50m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE7WXS2vbQBDH7/4UwuewzGPnsbkWSgsN7b2EIhI1NTh2sJVDCPnuZeUkJPHqkAnxQVia3Z9m//PY1f2i65bj3c2wPO2WX4d+vN0NX7br9XAxrrab5Uk1/z083i9Pu9+Lruu6++l6PHEaPhludtubYTeupklPw7tuuemvpwln/W7/r1+vu+/7db+53D/P7Lrlar/909M06tvRcz48//HScLHdjKvNsBmr7efF0G9W/fLR/PDs0tWwvR7G3d1rh55WcHa7Hle/tuu7q8dVP7O3u8vVph9fLP/we/n/7d3xfdehlqQsIK4nR0ZJzgDm+MZy/nboDNdIZriFhUCCXCNlNWpyTdRZg1zOYsDHXE2AGRUoyAXgAm0dzEDAg/oKguW2DlkQLeivkmH23MwHEUeQIBeJwJpYyhlzMB2kgJA1wibJAQtkjrormUrTXyvFIVuQ++5yW8zdvXrj+0vf6wvJuBFqSwxePOfIGj2ZSFb3JpcoK5QYV61Q0dLkshLHUrNyBYo1Yl39xUIcKlFPNs1t5GbVtyof1NfnctMSFRaJ5WYkHz4pNw2TmHHmZg5BdsoUaW+VW8hm1gioJCUSa8Okhz2iyQVDs0hMKlcKm7TdhdpJgtjCLKUtAwBmjZSSYTKGdulrKqaKGGnHlVt3dmmUfuUy5hz0V93ZvNlSgJwMo1zMlhXb3A/o8P6y+LwSRcAi3FwjshNTpL0ZJpCZE5MlnCopqB2wWKZmiaIoAgdjDUUErBkThKndxLgENBtrY2EJtkCqc7GpL6hbUAVSJsfmZvcB6tROZvqfIwoFtWXVUtq5UMMpGuyrPNetEaGagtqSzlUauBalyIEqVMGfdRjV5AWYGwFBTCgMpqHvmcot9euiDdbaakJfHprcHby1JU1g11huVrC4uzaOdxNYGUKbfgXnbKSNwj9ozBqWQnNu5lEFZ6Uc+3iOJMV8gi7e/ntYPF3PFw+L/2u0Ecl2EgAA';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for oceania/marshall-islands.50m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get oceaniaMarshallIslands50m {
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
