// Generated from: assets/seven-seas-open-ocean/heard-island-and-mcdonald-islands.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for seven-seas-open-ocean/heard-island-and-mcdonald-islands.50m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Heard Island and McDonald Islands",
        "iso_a2": "HM",
        "iso_a3": "HMD",
        "continent": "Seven seas (open ocean)"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              73.7074219,
              -53.1371094
            ],
            [
              73.7951172,
              -53.1298828
            ],
            [
              73.837793,
              -53.112793
            ],
            [
              73.73125,
              -53.0912109
            ],
            [
              73.5857422,
              -53.0271484
            ],
            [
              73.3880859,
              -52.9999023
            ],
            [
              73.3052734,
              -52.9663086
            ],
            [
              73.2511719,
              -52.9757813
            ],
            [
              73.2539062,
              -52.9893555
            ],
            [
              73.2854492,
              -53.0214844
            ],
            [
              73.3363281,
              -53.0298828
            ],
            [
              73.4132813,
              -53.1467773
            ],
            [
              73.4651367,
              -53.1841797
            ],
            [
              73.5879883,
              -53.1845703
            ],
            [
              73.7074219,
              -53.1371094
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for seven-seas-open-ocean/heard-island-and-mcdonald-islands.50m.json
GeoJsonFeatureCollection get sevenSeasOpenOceanHeardIslandAndMcdonaldIslands50m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
