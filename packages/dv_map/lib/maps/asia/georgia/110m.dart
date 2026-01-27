// Generated from: assets/asia/georgia.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for asia/georgia.110m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE5WVTYvbMBCG7/kVwucwzLekvZXS9tjey1LM1g2GrB0c9xCW/PcSZxN216IgH4SsV3p4pZmRXjYhNPPp0DUPofnatfPfqfs87vfd09yPQ7O9yH+uw8fmIfzchBDCy9KuFy7TF+EwjYdumvtl0W16CM3QPi8LvnXjtOvb+4IQmv44/mp5Eb+sxuU6/v2t8DQOcz90w3zRPh37tnnVzncbu2587ubp9N7EzfWPcX/avW7yzhyn3/3Qzm92e/3e9j/+hSAZshli8u0HRQVUNOcY3wmP2//yFEGYJKsVeMTJRXIlL0VTz1zgIYlzqsIRqIlGpBWOwdWIRSt5EYUiro+PIDtnrfZnpph07Y/AxNycq3gMTtk0pRIvCUWuC6+AJY5qJR5mJhWp4inkyJoK8SBgTZeMqeIZMEVl1wJPidSoLv3sEkVHXKczAbGkyHX+HAzJJZb8oauq1sXDwSVmTOvyIKBEXhtfB1JToVJ8I3NCrqsPB0XNhiVecvRodflsEGMhuHxJPq2zZqARORZuFgZDjgnrjk7BJDpzLvAiUc7VpZaFuHRRmWmuSzuBaJaLzhRTXckySNZ1CASYsY6EkJlp7UpAEpNVsjB69tKzYyaEWpVn9c/iptS/9c6bW/u4OW/+AY94oCW7CAAA';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for asia/georgia.110m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get asiaGeorgia110m {
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
