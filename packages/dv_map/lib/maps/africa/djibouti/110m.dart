// Generated from: assets/africa/djibouti.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for africa/djibouti.110m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE5WUTWvDMAyG7/kVJudiLMnyR29jY7Cddh9lZF1aMtq4pO6hlP730bQp7WLYnIOR9VoPr5CdQyFEGfebupyK8rmu4q6rH8NqVc9jE9pycpIX5/S2nIr3QgghDv06LuyP98KmC5u6i01fNBwXomyrdV/w9N18hl1srhVClM02fFTYq6+jPJ3zL7fCPLSxaes2nrSHRdfMq/KiHq9OlnVY17Hb3/sYjL+F1X556fNKDd1X01bxpuHzdxv/3gmhURIDm8mvPKBkjUh36dnkL5ZKcCCLAdIYsGM/IA0BZqIsefYJFDFDri3LzDbBUqx8HgslgQadYpHOaxEls/aUQIHKbRGltcYxuBFNSY/GWWeyeCRBMyk95oHUBhV5m+sP2FlKDcESG61y/aEz5IATPG+1R5d3+0kSWMc4HixK8gq005k85QAx9TSN94Yyx3Earzc6aU8za2CXe4v//+MoUvEQHYthnRXH4gdUpHch3AUAAA==';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for africa/djibouti.110m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get africaDjibouti110m {
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
