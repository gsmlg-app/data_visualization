// Generated from: assets/europe/liechtenstein.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for europe/liechtenstein.10m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Liechtenstein",
        "iso_a2": "LI",
        "iso_a3": "LIE",
        "continent": "Europe"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              9.5211548,
              47.262801
            ],
            [
              9.5046184,
              47.2437324
            ],
            [
              9.4873584,
              47.2100135
            ],
            [
              9.4849813,
              47.1763463
            ],
            [
              9.4926294,
              47.1598099
            ],
            [
              9.5034815,
              47.1453922
            ],
            [
              9.5118531,
              47.1293725
            ],
            [
              9.5123698,
              47.1080301
            ],
            [
              9.5028614,
              47.0946976
            ],
            [
              9.4875651,
              47.0839489
            ],
            [
              9.4758863,
              47.073226
            ],
            [
              9.4770232,
              47.0638984
            ],
            [
              9.4995541,
              47.0593509
            ],
            [
              9.5606356,
              47.0524004
            ],
            [
              9.5812028,
              47.0568704
            ],
            [
              9.6087981,
              47.0807708
            ],
            [
              9.6157227,
              47.106764
            ],
            [
              9.6055941,
              47.1322663
            ],
            [
              9.581823,
              47.1549006
            ],
            [
              9.5520573,
              47.1668895
            ],
            [
              9.551954,
              47.1755712
            ],
            [
              9.5618759,
              47.190609
            ],
            [
              9.5629094,
              47.1977404
            ],
            [
              9.5543311,
              47.2116155
            ],
            [
              9.5448226,
              47.220323
            ],
            [
              9.5403785,
              47.229108
            ],
            [
              9.5470964,
              47.2430348
            ],
            [
              9.5302499,
              47.2536543
            ],
            [
              9.5211548,
              47.262801
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for europe/liechtenstein.10m.json
GeoJsonFeatureCollection get europeLiechtenstein10m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
