// Generated from: assets/asia/pakistan.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for asia/pakistan.110m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE5VYTWubRxC+61e86GyG+f7ILRR66SX3EopI1SDqSMZWDyb4v5dV6hBnl8L4IF69o308s/M8szP7dbdt++vzw3H/btv/ejxc/3k8/nK5vz9+up4u5/3dMP/17fXT/t32+27btu3r7XNeePv5zfDweHk4Pl5Pt0WvP9+2/fnw5bbgw+Hv09P1cP6+Ytv2p6fLHwe+WX+b3svt/fs3hk+X8/V0Pp6vw/b+6XTY/2d7+e7H5+Ply/H6+PzWi1e3P1zunz9fzm8xL49/ns6H6w/hfvv78fnnb9sWASmhhnn3k0UMtBSx7I3h493/4zlQcWrKAi8rFUVbeGOVZ4VOeA7unujUxCNL5JjjDSARFKwWnoKFZfEKDxlTqRevAnqYUSziTXEK8xYeQzEiay3wghExWnAEqc5FKzjDKmVp4rGzrOjigKGS0aMfgVaGx+yfgRuaS9c/J8FwXuCRCXfpTEBkSDnTRSFEiK2bDzKPkHn/FESzqEk/hExKnOEEKjPNWurwghI0lXn7dKiDGHvqRRAWK53xBMTShFvq8ALPII1VvISm1Q2XnY1n7xgMqVRb0XqBUIQrTXgEhaTUE5snFLuHz+IgcEbK6vmXYOa1SC5BkEgPLCCKPWuFZskl2GKyB3iKlPgCT1DIlFt4DiWZRSv/BLWIuniSpBazfwgx/lO18dQ1eMLjgswo7VUqN0D1nAsfF2gwZe/gcAUxVMrpXOMCc0TBnnIVSBNx1hoXiGJSc/sEzJAdJ22MeAeTMFt4DKaV5lOhH/5RWnDrYHOEDGVNW6WXi6VXqQjES3CZDkHh8F5pIYig9JxKFSd4lYh0ty84UnBq+ziBrVy1Fy9DmCnbHG+ARBY31SHAIlmxwmMK1J46BITcZe762CHMTZpsocEWypjZ4sBSFc3tG21ViPOsDgOMZOmFy1BogTiHa8CUitVjn4IJKi6yYcASKNnzz0GCk+fazAbKRtobEjyA1FTnrpkV3MW7Z0eAqrj77J9AqaY285FA4a42q1fAi8p77EtIZauauioep0CRSG+GIUAVVpxr/cBz43aPq+or9wb7jLCVjEDg5Iy5DWKDYGbukS8QaLRBi+Q6aFEGdXtcI5VaaNehFMubIweCk2stOoOAysGW7ogVEe42xxtQJJTNfDCMerSYoDmhnKyoF6+AGrosT94a3bn0RlQFZZKc2SwIFZWkraNy4KEt0jua+mKX5gWOAVu60jyhMnAQobXDNTKb1SYM4ZpVvWKgQKhcMl+QCKiOWa5HP4HQKs35gknH+OWV3QuhUamQZ/8UQjOb1cAgLNDnEVDBUIt7A284ZFAwzVOHgpuY9kpp+/Zwt3p+fXrZvX5+3L3s/gVpwcgF4xUAAA==';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for asia/pakistan.110m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get asiaPakistan110m {
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
