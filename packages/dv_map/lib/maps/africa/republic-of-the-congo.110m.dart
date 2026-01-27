// Generated from: assets/africa/republic-of-the-congo.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for africa/republic-of-the-congo.110m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE5VXS2sjRxC+61cMOltFvR97C4bkmJBrWILjjB2BV2O02oNZ/N+DtGuzdk8CpcPQ6ur+qOdX1V8307Q9PT3O2w/T9uf55vTlOF8vDw/z7Wm/HLZXZ/Hdt+3P2w/TH5tpmqavl+948XL8Ing8Lo/z8bS/XHo5Pk3bw82ny4Xf58cvfz3sb6flbjr9M0/Xy+F+eb0+Tdv95+XPGz4fvf5l2JfL/q9vBLfL4bQ/zIfTWfbT3XF/e7P9Ln1+Vet+Xj7Np+PTW6VerPhteXi6/270K+py/Ht/uDn9YP2334/r9/+miRLUBN346p1EwFAlrd7sf7z6f7iAxCpEWYFzpHJtwpEIKusIF5xUbi04B5NASxrhqJJNowmHxGmjdgzs4VI9OINSLMp8D0cQHB7sTThSFx0CS1CuSJotNAWRSGJbsZUjo+k6AQxL/g/XYQV14VCIxEdjUzDLpQnHyS40GEsgpJTSM1YB2d0zVuDKPKJXFAoczm41wlF5cfUiK5AqwjikHQJKhkUv7RSEXCkH3+0QzNg5ejWroGxqNqi3IxARRe8Gg6uYcKiLHUFVcljPXoEqVoyB8XYMGpioPQYVICxfYYEzHmco9nKZwcI4dYwHQWkaETfxtCyQ1/STIs/s6UeQjOVj6e4YjJScevlCoJEoq/4LN6deOAjSjJiG2t0JKHsG9tKFAEsiVtwnUJHJ3sUr0vIx+wxQorJZHQxC6RhjNBQcnQW72eKMYTW6T0ElkaXHfQxVZhRj9SpEEqH09BNgS9YVNlDI5LImWwk4no0aw6tgiCTZ5XpSLfNhYjnjESJml50ZC0WH3nH2XwkW9xqvgiU7ypq9FciSvXIzoMCqlXJTEBXD6MXXIExMcfSfXArbm+zsgOicNbKpgImRcHvmC06UMf8YgliKe2zqoBhYNMaXIBSrqZ5D+vl5sNZ8mS2pOVgFGEvQCl0hhEpKs7kFuKSrjnSFoKwp1CuPAHcx4zH9ENASm9UbkOy2wi4InFncJKuACKWV4OI5l92yF9yArEyxlSk3zkNuT7kELOUY5zQGcQtutvEEKYlaeyAUomqzb3SfuZu19cvqefPy/bh53vwLF2OnbJoQAAA=';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for africa/republic-of-the-congo.110m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get africaRepublicOfTheCongo110m {
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
