// Generated from: assets/asia/singapore.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for asia/singapore.10m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Singapore",
        "iso_a2": "SG",
        "iso_a3": "SGP",
        "continent": "Asia"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              103.9607854,
              1.3910994
            ],
            [
              103.932465,
              1.4011091
            ],
            [
              103.8571883,
              1.4387068
            ],
            [
              103.8315536,
              1.4470889
            ],
            [
              103.8049423,
              1.4486352
            ],
            [
              103.7900497,
              1.4442813
            ],
            [
              103.7622176,
              1.4309757
            ],
            [
              103.7397567,
              1.4281273
            ],
            [
              103.7179468,
              1.4309757
            ],
            [
              103.7083439,
              1.4293887
            ],
            [
              103.695079,
              1.4213321
            ],
            [
              103.6838485,
              1.4098982
            ],
            [
              103.6788843,
              1.3992374
            ],
            [
              103.6745712,
              1.3803165
            ],
            [
              103.6447046,
              1.3380395
            ],
            [
              103.6403915,
              1.3222517
            ],
            [
              103.6476343,
              1.3084171
            ],
            [
              103.6652938,
              1.3041039
            ],
            [
              103.7087508,
              1.3052432
            ],
            [
              103.7301538,
              1.3029239
            ],
            [
              103.7551376,
              1.2971052
            ],
            [
              103.7758895,
              1.2875837
            ],
            [
              103.7844344,
              1.2738712
            ],
            [
              103.7895614,
              1.2678897
            ],
            [
              103.8016057,
              1.2647973
            ],
            [
              103.8260197,
              1.264309
            ],
            [
              103.8388778,
              1.2662621
            ],
            [
              103.8440861,
              1.2685001
            ],
            [
              103.8469344,
              1.271918
            ],
            [
              103.8527124,
              1.2772891
            ],
            [
              103.8877059,
              1.3012556
            ],
            [
              103.9072372,
              1.3087426
            ],
            [
              103.9318954,
              1.3114688
            ],
            [
              103.9543563,
              1.3181013
            ],
            [
              103.9748641,
              1.3344587
            ],
            [
              103.9918726,
              1.3549258
            ],
            [
              104.0034286,
              1.3741723
            ],
            [
              103.9995223,
              1.3803165
            ],
            [
              103.9856877,
              1.3854434
            ],
            [
              103.9607854,
              1.3910994
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for asia/singapore.10m.json
GeoJsonFeatureCollection get asiaSingapore10m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
