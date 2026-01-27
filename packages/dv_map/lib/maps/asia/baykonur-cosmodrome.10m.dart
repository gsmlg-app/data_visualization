// Generated from: assets/asia/baykonur-cosmodrome.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for asia/baykonur-cosmodrome.10m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE61YyWobQRC96ysGnZ2mtq4ltySQc+7BBGErRsTWGFk+GON/D5KXJHY1oRvrIEaq6Ud1La+W+8U0Lfd31+vlx2n5db3a3+7WX+bLy/XZfjNvlycH8c/Hv2+WH6fvi2mapvvj99uDx9ePguvdfL3e7TfHQ8+vT9Nyu7o6Hvi8uvs1b29305f55mo+381Xfw5P03JzM/9Y0eHFDxFvBJwIzubtfrNdb/cH2aebzWr5JHt40eliPV+t97u7fzV6vsK3+fLu4unGL5jz7nyzXe3/uvrj5+/n17+mSbmwcyDrySuJ1FK1Okn9R3B68j88Ea7ilOJZaGAnXgUUs5rhmRBh9OJV40DJ8FzYlDvxFCEov284VZRePEV3xARPsSqKdeIZRAhk+ikree29r1XxcMvwFADEe/FCWTjVz1Wl13zOHMqZeoY1pDucXa1W5gxPTCN63eGhGh4ZnqMB9ZovCCnUEzxHM6Pe9AiBYM7081oNuNcfUStFpHhR0YV68VTAJcMLVlTWbjxD5sx+Yc6M/Xi5flqAQCK68Rr20wKKQtabvi3/akGA8NqtXyP+tCC7B/Tq18oPLWgSCt180MhfLQQeyt180OAXLSRg6N303KA/LWQAGL350aJnLRSq1Xvt1yofWpiAzXr5pVXetLAgiPf6o1V+tXB1Qezl01Z7oIWNSN+re9HCTiLYmx6t7uqA5xrddNrq/rRwgHN3ODMJWZa9Y+qRKktk0TxmPjqEWO6OEe9iVU+5eSz2EGqIvl9uQDXnmnHfWO4CUpBn1hvhFiphKJ6l2gj1UQlm1zSWR6iZSgCQpaVypHRQcUOgzHojlY2Ki4qlTD9Seak4qQdn7hjpDKg4UiXLom+kc6HiwJp6Y6SxOsCBCmaDwkjj11RvrC9tW2+sb257d6yvb0ff2NzRTI6xsaidu2NjW5tbxsbKJvUNDr0tYh6dyVuFY3Rn0CpsozuNRt0dXbm0uoLRlVCraxldWTWaqtGNWufGb5E9Pz89LJ6/TxcPi981K6TMoxUAAA==';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for asia/baykonur-cosmodrome.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get asiaBaykonurCosmodrome10m {
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
