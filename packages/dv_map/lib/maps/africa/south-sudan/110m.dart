// Generated from: assets/africa/south-sudan.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for africa/south-sudan.110m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE61YS2sbSRC+61cMOpui3o/cll1yDvi4hEU4SlbgaIwiH0zwf19GXgfbPSyUWR2GUff0x1ddXz26f26maXt+uNtvP0zbj/vd+f60/32+vd3fnA/zcXu1TH99Gv6x/TD9uZmmafp5eY4LL59fJu5O893+dD5cFj1/Pk3b4+77ZcH1fH/+e7q+/7I7/lo0TdvDj/mvHV8+uB7G5Wn8j5cTN/PxfDjuj+dl7revp8PNbvvv7OMvMt/28/f9+fTwmsoz90/z7cO3+fgadT59ORx35xc2P/1evr/9N02CkCJprFdvZ8CwKMhfjX+++m84AlYzH8EiqZpImaS2QsuSowXF4OnKK6SKhVtQAlJrOC0QBcTBMAXWytQulDNSuYxwqUHc3CkDrkQMegtnYNhTgkJg4LDpDlbKvU1XYENZgUp27BmogGGDdQHMVtZUgnnyIIaAIBFt6rNMKVegUqtnnwCXDkgJYmrZREq2QaUJEtXMCQIVWiukPNXaUC5SPIAVqCundaM5WctlMLNAU9GxvWXKJDiIoqCSirRrbDCV1SB8QhA2dqauNtBLcpA/IQQjUduvmB7uw+4RgSqRkvxP/BgoSiR7eAyhojR4gxhYlyzX8y6Dh4bWaC4DsqY0CxwDhmTR2vZViHB1+Qkpi8YKnidpai/BMSgupWAo5kSAic7ewyNIwyAb+SGYEAd28cQ4ffRvQRKyYs8dSyMUqTjQq6WQsXgrEXNBlbusqAWBC4ujJWYucMqyGAo9IWBqUbbM5QIjK5Mh2AqiBENazuACRCxZc4ajsnAPLqHcrWJIfQVSydyqrxxQgZk1KPmdaClihito7zE1gIiNV/zgkubRqmjsEMaIvrJx6p7VdKuDRgjnCpwZh2BPxAblLGOIEQKJa6+esUEUushaSCgRVjMkDNDLUdbocUi0qiMrRGnxmO7elZ5YwSSUbPBEQlFYnx2VosfALiE4vXq5nQUyvWKMsASnCu51sYuxHuJDMklgLsrecYsNiLSEh1QcS4tLqF3ZEetalxdgiNjsQS8qdh97doeKErKerQ5MopTDcd7B1B2lF7AO6lY4VjGDUg+Kbupc2GGtHS8Ny5rZKUBCmX0FjkVKtV8mqmIsOgqKqdQ71XGCclbJ4FkFziDrnQY4wcs9xohVUDOMZqEoICuMUSgKksXebk+CrMpW7iEcMVFbvezSPZkYjtcHCrQkhn5r17nj2qy9P789bp6fnzePm38AaZgjyI0UAAA=';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for africa/south-sudan.110m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get africaSouthSudan110m {
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
