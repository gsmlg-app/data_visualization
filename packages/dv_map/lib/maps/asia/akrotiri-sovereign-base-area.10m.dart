// Generated from: assets/asia/akrotiri-sovereign-base-area.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for asia/akrotiri-sovereign-base-area.10m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Akrotiri Sovereign Base Area",
        "iso_a2": "-99",
        "iso_a3": "-99",
        "continent": "Asia"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              33.0156346,
              34.6344245
            ],
            [
              32.99073,
              34.6344245
            ],
            [
              32.9695427,
              34.6320474
            ],
            [
              32.9625147,
              34.6250194
            ],
            [
              32.95559,
              34.6288952
            ],
            [
              32.9540398,
              34.6429512
            ],
            [
              32.9656153,
              34.6515811
            ],
            [
              32.9702662,
              34.6461034
            ],
            [
              32.9897998,
              34.6461034
            ],
            [
              32.9875261,
              34.6733886
            ],
            [
              32.9547115,
              34.677316
            ],
            [
              32.9422575,
              34.6671357
            ],
            [
              32.9360564,
              34.6577306
            ],
            [
              32.9297518,
              34.6624848
            ],
            [
              32.9172461,
              34.6671357
            ],
            [
              32.9136666,
              34.6602799
            ],
            [
              32.8845036,
              34.6666069
            ],
            [
              32.8656131,
              34.6787355
            ],
            [
              32.8604301,
              34.6876206
            ],
            [
              32.8596896,
              34.7005781
            ],
            [
              32.8537662,
              34.6994674
            ],
            [
              32.8459918,
              34.6994674
            ],
            [
              32.8408088,
              34.6994674
            ],
            [
              32.8356258,
              34.6998377
            ],
            [
              32.8322939,
              34.7009483
            ],
            [
              32.8274811,
              34.6965057
            ],
            [
              32.8226683,
              34.6913227
            ],
            [
              32.8193364,
              34.6876206
            ],
            [
              32.8060087,
              34.6857695
            ],
            [
              32.7986044,
              34.670961
            ],
            [
              32.7786129,
              34.6731823
            ],
            [
              32.7667661,
              34.676144
            ],
            [
              32.7601023,
              34.66911
            ],
            [
              32.7606714,
              34.653225
            ],
            [
              32.8128361,
              34.6686466
            ],
            [
              32.8343205,
              34.6709659
            ],
            [
              32.8574325,
              34.6690128
            ],
            [
              32.9135848,
              34.6566837
            ],
            [
              32.9158635,
              34.6393904
            ],
            [
              32.9446721,
              34.5936954
            ],
            [
              32.9409286,
              34.5747745
            ],
            [
              32.9409286,
              34.5685489
            ],
            [
              33.0302841,
              34.5685489
            ],
            [
              33.0302841,
              34.5747745
            ],
            [
              33.0091252,
              34.5973982
            ],
            [
              33.009939,
              34.6249047
            ],
            [
              33.0156346,
              34.6344245
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for asia/akrotiri-sovereign-base-area.10m.json
GeoJsonFeatureCollection get asiaAkrotiriSovereignBaseArea10m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
