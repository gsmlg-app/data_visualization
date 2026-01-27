// Generated from: assets/south-america/southern-patagonian-ice-field.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for south-america/southern-patagonian-ice-field.10m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE52XS0skQQzH7/MpijmrJKk8vS0Lwt6EPS6yDNrrDmi3jO1BxO++zPjAR2TJ9KGp7lT9JpV/OpV5WLS2nO9vhuVxW54Mq/luM3yfrq6G83k9jcuDrfnP0+vb5XH7tWittYfd/fPC3fSd4WYz3Qybeb1b9DK9teW4ut4t+DndzX+HzdhOV/PqchrXq7H9OB/ayXq4unjFtLZc306/V7RdchjxydATw/k0zutxGOfX32nfrofN+ny1fJ70+Orm5TBdD/Pm/r2TL7s6na7uL5+D8AqfNhfrcTW/icbT9Xb88am1Q+tHrAJhevDRxHFkEiHxznB28F8ghhpHClQnpk5lYu+CmhMJAVmrRJAwZsuIIhwGXicaU5eMyCaBUY4jOPcuPSUSKUo5jOgqmLrYg5gMy0TwIImUiCDoZSKEE+dSk5FJL0uNHZQtlZrMjes+IiNFx5ToIhpcJwpg9zSO0FW07COLuVKuDJi6ltORDRHtC60NQ3qdCGyUApkI1MpAJWBPpe7bkhTl5GFVI+GU6LaNcZno3YHzOgFgwOXkESKyvIAzqhGXk0cYmDGVmsnMqZw8IojdcyIzQJSTRwSMJI+jdup7+Mjcuadas22PwjqQxDUHBkLnPcIowZzWCQEHr9cycRXPhRGKCK/76A5dch8ZhKFONBFJ81skiK1cJ0QJv2h5xNCk17/BTsGebzp6GNfzmxCRU2EUPBTKx//2OA5Jjy0l5+ByXybkEJhWcGVm3MNHBiPNfZTYA6fdOW8cTff6pnsIYnrEaJCa7iE0m/dUaAMF8HIryqGkudBG0us6c2zbzbQTNTLH+qaLfzoW2fhl9Lh4uZ8tHhf/AEPiVAc6DgAA';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for south-america/southern-patagonian-ice-field.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get southAmericaSouthernPatagonianIceField10m {
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
