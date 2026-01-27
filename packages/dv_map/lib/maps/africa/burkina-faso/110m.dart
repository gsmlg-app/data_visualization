// Generated from: assets/africa/burkina-faso.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for africa/burkina-faso.110m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE5WWy2obSxBA9/qKQWunqPcjuyTgdfYhBOGrBBFHY2RlYYL/PYwcGyc9XCgthlZX96He1b8207Q9P9ztt2+n7fV+d/552n+Yb2/3N+fDfNxeLeKvT9v327fTp800TdOvy3e8eDl+Edyd5rv96Xy4XHo+Pk3b4+7H5cL7n6fvh+Nuut7dzy+3pml7uJ+/7Phy4nrYl6f9d68FN/PxfDjuj+dF9u7r6XCz2/6RPr5o820//9ifTw9/6/Ks/Mf59uHbH1tfqPPpv8Nxd35l9NPv9frff9P0xkBRRcmv/pEQggSGeP4l+Hz1/zyFMnUTWeGRcZBUkxdRmTLoV5BMldpVTwRZY6Q5YYr2lBOoRNXiFeWcRZWaOCPKqpFWiMLOLRpDcmj5EIkCV1bHnucYyiXLB1uXRCkTaUaCoRQVay1RytkLpcUjYBSxGEJLBIiVVD33IYSThQ3RWPQTLy5v8lQykGxNv0rp5QoCsiTyKo3Sk6KHyyobU2WxtUKktEMjYBX1WgsFERr1Uo9ANShyzDwC04hmZAlKrNLWXOdKZNjCMZCphqzhSpEMW4FloAjCyAHH4GxI0fQdshLK6DuGNEq2Zp5UCaqNkRVYik97RYGgXMUxDp+ls2ZIqwUgcJmr60BTUFVudvdl/mkWj65TKM7C7DYUdmeLscgWngr2Zg+CkaXpmHcGREvrakX2DQG6i6/ksUKFJFmzvSMSitEKzqwQs9feGagoecVcBVZXiq5+5eG1whOISrLm+BEglEAf61bAlNib7ygBY07k9UoLd+qNHwVEl8I1/TRY03r+U+BExTX3MaeqdHHKQe5jujCYsqv1zDVgxlIapzdBkKT1is2AKlJ5bFQEEkZqvegaaKC5rj4ujNirzeu94jdr6+fV4+b5+3nzuPkNyAIEmXENAAA=';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for africa/burkina-faso.110m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get africaBurkinaFaso110m {
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
