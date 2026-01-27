// Generated from: assets/europe/belarus.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for europe/belarus.110m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE5WXS4sbRxCA7/oVg85LUe+HjwnxyYeQWwgmCEcxgrW0aLWHxex/D6N9sHY3gZrD0NM1/U11vbrm+2ZZtpfHu/32w7L9uN9dHs77X0+3t/svl8PpuL1Zxf8+T99vPyx/bZZlWb5f7+PC6+tXwd35dLc/Xw7XRa+vL8v2uPt2XfDL/nZ3frh/W7As28P96e8dX4V/DvNynf/0x3vBl9Pxcjjuj5dV9tvD+sXti/TpTZGv+9O3/eX8+KMar3r/frp9/PqyzTfq6fzP4bi7vNvv8/V+/PPTsnAChQeW3vwkMQfyIvlh+vPN/9MCCFmtcqAZRIqQRIvnoKUiZBOekxF6NXmWyVE84ZEHhXmLZxCeKhwDTyHVy7nLM3ExGe2nwMnKoi2eghp6ig88gUILZG7xBDSVOKY8Yq3o+VfAOExs3K+ABhJTz34CiVqiNeFhVgj17CcQVVQ56sfgRVjV5VGV1sS/DJpeEV2eYSLyGM8MyOLqXfsZBwaO+hFYpJpSM/4QDSNmPKdQ7YazmRC6THCZqd7TzkA4ImPMXoIi9GYxcBCJshyTgyCFObOXHAFqiu6jcwmsWLBZDBJYySe1dPUtM0fPerl60GlS+wiUI0h6tTmhilNs5lxHxm6wFLCtqTYzn3iy9HiCQBbiMt0vOUl2eWZGFFP9qAzFmjynUtPxJCdI5sRedghCcawWnNUWZbFe+AlBpFXxqB8DIXlEK91eeKM3nmnZZJkiUs72Gspo3OqDhEDQGHF2TmJIlbVyQwi0wkfLydq1aE83BkE1qrEOCJBwcDNO1pNQXEfTCYiRMvZcwaBoVpMqKuCUqNYOOyEOnrUYUYrcO8JXXpGyjmkrUKEu2Q1jSdXg0X66Fhw075aVsDCZtpBJFIG90EOooFkHaYBJptFzL0KGFBZNeGZY4a2qxwVZzjWpeusfR6lLr8MtkCALGjtIAw/Ewl5TUMBcRjLTryhFtadf839tMxu/jp42r/fPm6fNfyteACNUDwAA';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for europe/belarus.110m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get europeBelarus110m {
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
