// Generated from: assets/seven-seas-open-ocean/clipperton-island.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for seven-seas-open-ocean/clipperton-island.10m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Clipperton Island",
        "iso_a2": "-99",
        "iso_a3": "-99",
        "continent": "Seven seas (open ocean)"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              -109.2120255,
              10.3026798
            ],
            [
              -109.2259415,
              10.3110212
            ],
            [
              -109.2342423,
              10.3079288
            ],
            [
              -109.2280167,
              10.292141
            ],
            [
              -109.2185766,
              10.2815616
            ],
            [
              -109.2103572,
              10.288723
            ],
            [
              -109.2120255,
              10.3026798
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for seven-seas-open-ocean/clipperton-island.10m.json
GeoJsonFeatureCollection get sevenSeasOpenOceanClippertonIsland10m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
