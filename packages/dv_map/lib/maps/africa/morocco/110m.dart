// Generated from: assets/africa/morocco.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for africa/morocco.110m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE52YS2scRxCA7/srhj0rRb0fvplAboGQazBBKGuzIO+I9eYgjP57mJUlZHdDKO9hmJ2a/qjqenTVfN0ty/7y+HDYv1v2vx1uL/+eD7+u9/eHu8txPe1vNvHH58df9u+Wv3bLsixfr9dx4fX1q+DhvD4czpfjddHL68uyP91+vi74fT2vd3fr64Jl2R+/rH/f8lX4fnguz8//fCu4W0+X4+lwumyy9x/Px7vb/Tfp06sinw7r58Pl/Pi9Gi96/7HeP376ZuYrdT3/czzdXt7Y+/x7e//jv2X5hYG8iiRufpCIAXlKuXwn+HDzfzxHFbSc8aKwpMcTcEU0twlPqtKshVOwIkTnGU4wiFs4AypJl5l2YUbJXV5xValMeVWZ1OI5sKrozFpSSzdt4orYVGngKRChhvd4AW5KkTrwBLwCXavFS3CLTYsJjxVZrRd8BYLoxTXwGMzVo7o8FY2S0b0MKInV3L+CJA2a7B8BRYQ0s6M2q5JoiBcuKBELiRaPcMtRKx4M5gKstLSegwmhEMuGasUJKUzazDci8MyiGi1OIE1XaSrI4JQp7hMgSlK3YJEAMTnJ4GN+zh6Npk8ESKqUhgq9ARVJI7vACEnUIUvYr5tR3MsSUlCpkpoBr+Une2lCColYPAkbAxdnb/pEIVldbaiDbEAoJuw9oAFmiUx8omCM7Nh0soGyI8oMKFYk0tawkp1wjGuBYBHL5h46CLuSjE4WQIrwPpCdiid7yLBVaqk20LJIfNSQgSxZtBmGDhXCGqOGBJkWqk0NA5BReaz/TKDMQtjMvABELp/s4QbEEG3WV4UwLNMxbAgM0RF7DQ0puGAKj6lMkI4l1axeCsxEPnEKgxCSS1NDgSzauqFJYPvWfLZPFEMsn1isEIFEzQ6dtl4Dw3K02DdJurcP0aBkqhmQULGoWb0IpNhseqJkinIz8RDMiJ3HKHSowsRoVkMEylIeG+tNQcdS7VlcEGKik0P+Z3lKghLDXMIBmKnhvaBOiNKc1JkAYvTukJiQFMk5toVbT+PKzbYwwd0sa/TvT/NCicYpcWszlTh7uAC0Yo4xgwssirnZzzigo8u0qw7Z5vletBiwMnGNYwkCIqr2vKuQVq6TGRvBkCib2baVTZwNnQhZXkZtnIZWjEMdgUtw9ZwhgJ6VOG4eQbBq8zza5gd31PH7CQOWinaLMwhGVo27x8DOmc1YJiDWrZpOeG5kTM0eBiS32WE2Euc2jnRxIaKTfkMEiiqIm+0BRPE2qE6+eBhHUfaCr/25bTe7f7l72r1cP+yedv8BCf0hwRUVAAA=';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for africa/morocco.110m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get africaMorocco110m {
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
