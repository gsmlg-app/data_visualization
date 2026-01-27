// Generated from: assets/north-america/saint-martin.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for north-america/saint-martin.10m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Saint Martin",
        "iso_a2": "MF",
        "iso_a3": "MAF",
        "continent": "North America"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              -63.0175686,
              18.0333915
            ],
            [
              -63.0107316,
              18.0408389
            ],
            [
              -63.0110978,
              18.0707462
            ],
            [
              -63.0179337,
              18.1005313
            ],
            [
              -63.0176489,
              18.1221378
            ],
            [
              -63.0314021,
              18.1218936
            ],
            [
              -63.0521134,
              18.116848
            ],
            [
              -63.0708715,
              18.1100121
            ],
            [
              -63.0790909,
              18.1041934
            ],
            [
              -63.083811,
              18.0879581
            ],
            [
              -63.0960994,
              18.0788028
            ],
            [
              -63.1137589,
              18.0746524
            ],
            [
              -63.1436255,
              18.0741641
            ],
            [
              -63.14684,
              18.0702986
            ],
            [
              -63.1438696,
              18.0646833
            ],
            [
              -63.1343481,
              18.059475
            ],
            [
              -63.1305232,
              18.0602481
            ],
            [
              -63.1153051,
              18.0653751
            ],
            [
              -63.1070044,
              18.066962
            ],
            [
              -63.1070044,
              18.0621199
            ],
            [
              -63.0858862,
              18.0585113
            ],
            [
              -63.0175686,
              18.0333915
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for north-america/saint-martin.10m.json
GeoJsonFeatureCollection get northAmericaSaintMartin10m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
