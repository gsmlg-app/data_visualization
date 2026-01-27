// Generated from: assets/africa/united-republic-of-tanzania.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for africa/united-republic-of-tanzania.110m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "United Republic of Tanzania",
        "iso_a2": "TZ",
        "iso_a3": "TZA",
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
              31.86617,
              -1.02736
            ],
            [
              30.76986,
              -1.01455
            ],
            [
              30.4191049,
              -1.1346591
            ],
            [
              30.8161349,
              -1.6989141
            ],
            [
              30.758309,
              -2.2872503
            ],
            [
              30.46967,
              -2.41383
            ],
            [
              30.4696736,
              -2.4138548
            ],
            [
              30.52766,
              -2.80762
            ],
            [
              30.74301,
              -3.03431
            ],
            [
              30.75224,
              -3.35931
            ],
            [
              30.50554,
              -3.56858
            ],
            [
              30.11632,
              -4.09012
            ],
            [
              29.7535124,
              -4.4523894
            ],
            [
              29.3399976,
              -4.4999834
            ],
            [
              29.5199866,
              -5.4199789
            ],
            [
              29.4199927,
              -5.9399989
            ],
            [
              29.6200322,
              -6.5200152
            ],
            [
              30.1999968,
              -7.079981
            ],
            [
              30.7400155,
              -8.3400074
            ],
            [
              30.7400097,
              -8.3400059
            ],
            [
              31.1577513,
              -8.5945787
            ],
            [
              31.5563481,
              -8.7620488
            ],
            [
              32.1918649,
              -8.930359
            ],
            [
              32.7593754,
              -9.2305991
            ],
            [
              33.73972,
              -9.41715
            ],
            [
              33.9408377,
              -9.6936738
            ],
            [
              34.28,
              -10.16
            ],
            [
              34.559989,
              -11.52002
            ],
            [
              35.3123979,
              -11.4391464
            ],
            [
              36.5140817,
              -11.720938
            ],
            [
              36.775151,
              -11.5945374
            ],
            [
              37.47129,
              -11.56876
            ],
            [
              37.82764,
              -11.26879
            ],
            [
              38.4275566,
              -11.2852023
            ],
            [
              39.521,
              -10.89688
            ],
            [
              40.31659,
              -10.3171
            ],
            [
              40.3165862,
              -10.3170978
            ],
            [
              39.9496,
              -10.0984
            ],
            [
              39.53574,
              -9.11237
            ],
            [
              39.18652,
              -8.48551
            ],
            [
              39.25203,
              -8.00781
            ],
            [
              39.19469,
              -7.7039
            ],
            [
              39.47,
              -7.1
            ],
            [
              39.44,
              -6.84
            ],
            [
              38.79977,
              -6.47566
            ],
            [
              38.74054,
              -5.90895
            ],
            [
              39.20222,
              -4.67677
            ],
            [
              37.7669,
              -3.67712
            ],
            [
              37.69869,
              -3.09699
            ],
            [
              34.07262,
              -1.05982
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

/// Parses the GeoJSON for africa/united-republic-of-tanzania.110m.json
GeoJsonFeatureCollection get africaUnitedRepublicOfTanzania110m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
