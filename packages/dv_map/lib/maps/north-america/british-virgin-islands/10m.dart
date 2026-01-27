// Generated from: assets/north-america/british-virgin-islands.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for north-america/british-virgin-islands.10m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE7VZy24bVwzd6ysGWqcB34/smgItumjRVTZFUAiO4gwgS4Y8WRiB/70YOTYce7gwA2khaHRnjihe8vCQ99tqGNbT7fV2/W5Y/77dTF+P298Ou932YhoP+/Wbefnz/dc363fDv6thGIZvp/eXD55uPy1cHw/X2+M0nh56uH0Y1vvN1emB98dxGm++DB/G4+W4H/682W32n24enx+G9Xhz+G9D870f/njxPd9///7pwsVhP4377X6a1/4+HKcvw69X2+N4sVl/v+nu0bzL7eFqOx1vfzTu4d/89XU3jf8cdreX3z3w+AuH46dxv5meuOL+9fTz86uX18Pwi8lbY0VCevNiEeOtgCqwPVv6+PzeChjYQAtgCaUuMIGj5TIwopppExgpjL0ATgXs4jInFbhEqhRNYGAOKjxBDIJNizUtU6wAhgBuAyO6VnvnntQFDmaqfIzG5NQEdgFRqYICWZqbp2acWvlYnayZH2qIVuAyq2gzPVRC0wqmECCHrsGMmljsHat5e+8I5pQugAWJm7hoIcoFblKCdA12zCw4UxIxuulhgAZF3qkgdClIkxwkCotDjZp7Z8DGhYsVDa1LxuRklb0OEdnEFXSQysOI6t4ENgzCwhMCgtoGVhPHgoCEs11HXTizSDskTu/6OEiVl4E5UyWaeecACrHMQJwBlk2LHQUpljmTwwjaIijSKJaZgkOs6QhzFffCESEI2k07TQtdDjYOnhVdN+/YzArg5JR23r1eGK+qqx9+sqPSOcCgEmQBCdTccHZMj4JdAhOz6T5WhoyCXcIJsmsxC2UWFqeDdmOfyYBzecMVMaXJASwWjMslR8ESuGmwAAnKMgcoqJs0k1VAXXF57xSCoCshBQKxAkaQaFuMkJrLKv1n9k5QZwo5Ay46U5HPiazZ1GOCoeSFvnFl6tZeEWaJSjgxWFf9CyUjFOpfJBKbDDQHW1IhptUsseljjgTyAtgRsqtNGyx/xpLDpuzLdOgk1NZE5KkMy7nqMOvDZltGDi6FUnYAs24to1AwKYBZwK3Z5DABAy43DS42e7kd+6qFoHURy3aRzLCiZ3AmiLYOCVDiKtoMpcsCjTA+X06ppYgvhz6rp3t3hOLBWrUDBhpdrtOgYKksThHqTpPipHzO4IoUsKIRZ/XA7sDO5ly1ojdSNexabADOhVRmRetOqUIZrYgJCcPuqEP9RCAFMEP7yEAdEqnollmsPUxS86jOIpidozs4UAssBoysEOnd7Hg9UZyPtZwyoBoUKc8NeO9fulBC1cqpZHSnkm4hRRyJpGm3SrnPg61qPksU3f12TY5SXWNwewDFwFyMR4Q9ulprLp1lAzNXVem6mFwpivMWych2sL0+is8oBHgemxcRmoJkTbmj7DOJFsBg1tUBnKJVgAaFtk+V2OeBTtVMzdBd4KCqqoopqnbrKptS5WKjnygmjAbViaA5kHdPfyjRqmhz49BuVFAkQTXkw+Do+pjqHlGSNKAdFa9OvJoFVs8/3a0e3j+u7lb/A7VGAILVIgAA';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for north-america/british-virgin-islands.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get northAmericaBritishVirginIslands10m {
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
