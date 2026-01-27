// Generated from: assets/africa/zimbabwe.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for africa/zimbabwe.110m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE52WTWsUQRCG7/srhj3Hor4/vIno2ZugiKxxlYVkN6wrEiT/XWZjNDqNUM5h6Omafni7uqq6vq+maX26vdmun07rl9vN6etx+/xwdbW9PO0O+/XFbP50P/1l/XR6u5qmafp+fi8Xnn8/G26Oh5vt8bQ7L3r4fZrW+831ecGb3fWHzYdvv1dM03r35fB+w2fr68W83M+/eGy4POxPu/12f5ptzz4dd5eb9U/r3S8ln7eH6+3pePunjgfhrw5Xt59/7vMX9XD8uNtvTo82fP88Hv/9NU1CQEWKRRd/WZ4wAxsZVvxheXfxbyADq1YmL4EERK6Z1gQappcMFCJIGRdLE+hWoSJDICoXUhMYwYG54FFBkFlxl+dEVboUSAVKJcnZ3vHs91gCEzwYs6oJTK10rCUwoKLQonsmqeGSAx86BIlUdn0onCwDgQ5SjKE9HkEao6IPgVRKvTQhcHGtQZqQAwZVITeBFIKuS57BfFIqPYEIIlmmg5gxyMSU6nkQgUPZbHDEBoYR2RLIBUaeMsoSA1f1iFaWcEJpqMvAhQ6ogkbaBCZb+jioJSs0vQlUj0JflkJyUE/FXtBwgFWyjrYcwIUp2FMYgKrKMVAYUJLI3lPoEOgRg2I9A52Ys1W6ePY8ldgQmOqo3FNowK7Mo+IaEOIm1YvDOXqLhnGYYOLI1tuyQRpKkY2AQarEXR+Sa9So/BdwCaZ1w4bLDXWZKec7nox6FxQHBGtoDO94rULrdSFnYDDHUGEaJVJPYQIySeCgrSHQtIqewIQodfNh3+VSar3iVaDClDnwIAMWCfWaEC5IKRRfBg0zEDKT9xpDBGHOHPVxDBzkRL02CefGMN2WiTcrNDLvncl/NNer0fhhdLd6eL9b3a1+AGDBqDIFDQAA';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for africa/zimbabwe.110m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get africaZimbabwe110m {
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
