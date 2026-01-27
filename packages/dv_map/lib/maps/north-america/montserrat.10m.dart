// Generated from: assets/north-america/montserrat.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for north-america/montserrat.10m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Montserrat",
        "iso_a2": "MS",
        "iso_a3": "MSR",
        "continent": "North America"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              -62.1473689,
              16.7442895
            ],
            [
              -62.1563208,
              16.7603214
            ],
            [
              -62.1700333,
              16.7770043
            ],
            [
              -62.1793107,
              16.794501
            ],
            [
              -62.174672,
              16.8131371
            ],
            [
              -62.1829321,
              16.8127302
            ],
            [
              -62.1894425,
              16.8144392
            ],
            [
              -62.2020158,
              16.819322
            ],
            [
              -62.2188615,
              16.7763126
            ],
            [
              -62.2301326,
              16.7276065
            ],
            [
              -62.2188615,
              16.6887068
            ],
            [
              -62.1678768,
              16.6753604
            ],
            [
              -62.1578263,
              16.6773135
            ],
            [
              -62.1497697,
              16.6817895
            ],
            [
              -62.1440324,
              16.6882185
            ],
            [
              -62.140533,
              16.6964786
            ],
            [
              -62.141184,
              16.7018497
            ],
            [
              -62.1439103,
              16.7089704
            ],
            [
              -62.1475724,
              16.7158878
            ],
            [
              -62.1507869,
              16.7203637
            ],
            [
              -62.1517635,
              16.7245141
            ],
            [
              -62.1476945,
              16.7370466
            ],
            [
              -62.1473689,
              16.7442895
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for north-america/montserrat.10m.json
GeoJsonFeatureCollection get northAmericaMontserrat10m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
