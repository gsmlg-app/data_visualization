// Generated from: assets/oceania/norfolk-island.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for oceania/norfolk-island.50m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE62VTWvbQBCG7/oVi85u2Jmdj51cC4FSaHsvoQhHCaKK1sjqwQT/92I5Nk6ypqyoDmK1s/Mws/PO6KVyrp52m7a+dfVd20x/xvZz6vt2PXVpqFcH8+Nxe1vfup+Vc869zO+PjvPx2bAZ06Ydp252Oh13rh6a59nhWxofU//bfdn2zfBw9nOu7rbpV4PzmbsP++G4//XSsE7D1A3tMB1s39dtM3RN/WrenwN6atNzO427t+Gc4v+R+t3Ta7pnbBofuqGZLvI+Ppfr91/OgeiNBSMOsHpn+oR240FFOb6x3K/+TUQvnjlPDCZUTvQCjCFLxAjIxUCIzKR5IHtTLU+axBtdCZGBZQHRY8gTA8dg5dcIQl7y10gMoFhOnIPMEhljWAAkZI1ZoIABwYJSo0C+1ApRy7WDnsBjFhiXqRGFBfMNs5AYgkbLN7UiSLl0iCgEuQI0svJKM0nUa0kDRismilfCfGFMMFq5dsQLUT5Gw0XiOYo4n3UklfIxIQRyTY4cGBYQ57H/P+Wo5n2wvHpYYiiPMUZRyBM5WiQqJpontPycIPRxwbjVw13l5zehaihvGVPhfBMehq0vJxb+/Kvc+rTaV6f3fbWv/gJWsGVSrQkAAA==';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for oceania/norfolk-island.50m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get oceaniaNorfolkIsland50m {
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
