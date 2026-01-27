// Generated from: assets/africa/uganda.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for africa/uganda.110m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Uganda",
        "iso_a2": "UG",
        "iso_a3": "UGA",
        "continent": "Africa"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              33.9037112,
              -0.95
            ],
            [
              33.893569,
              0.1098135
            ],
            [
              34.18,
              0.515
            ],
            [
              34.6721,
              1.17694
            ],
            [
              35.03599,
              1.90584
            ],
            [
              34.59607,
              3.05374
            ],
            [
              34.47913,
              3.5556
            ],
            [
              34.005,
              4.2498849
            ],
            [
              33.39,
              3.79
            ],
            [
              32.68642,
              3.79232
            ],
            [
              31.88145,
              3.55827
            ],
            [
              31.24556,
              3.7819
            ],
            [
              30.8338524,
              3.5091716
            ],
            [
              30.8338599,
              3.509166
            ],
            [
              30.7733468,
              2.3398833
            ],
            [
              31.1741492,
              2.2044652
            ],
            [
              30.8526701,
              1.8493965
            ],
            [
              30.4685075,
              1.5838054
            ],
            [
              30.0861536,
              1.0623127
            ],
            [
              29.8757788,
              0.5973799
            ],
            [
              29.8195032,
              -0.2053102
            ],
            [
              29.5878378,
              -0.5874057
            ],
            [
              29.5794662,
              -1.3413132
            ],
            [
              29.8215186,
              -1.4433224
            ],
            [
              30.4191049,
              -1.1346591
            ],
            [
              30.76986,
              -1.01455
            ],
            [
              31.86617,
              -1.02736
            ],
            [
              33.9037112,
              -0.95
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for africa/uganda.110m.json
GeoJsonFeatureCollection get africaUganda110m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
