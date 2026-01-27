// Generated from: assets/seven-seas-open-ocean/heard-island-and-mcdonald-islands.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for seven-seas-open-ocean/heard-island-and-mcdonald-islands.10m.json
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
              73.735118,
              -53.1124
            ],
            [
              73.6994735,
              -53.100844
            ],
            [
              73.6889755,
              -53.0902646
            ],
            [
              73.6633407,
              -53.0714658
            ],
            [
              73.6556096,
              -53.0679664
            ],
            [
              73.6401473,
              -53.0507138
            ],
            [
              73.632579,
              -53.044122
            ],
            [
              73.6209416,
              -53.0396461
            ],
            [
              73.5984807,
              -53.0338681
            ],
            [
              73.5875757,
              -53.026788
            ],
            [
              73.5642196,
              -53.0167783
            ],
            [
              73.5076604,
              -53.0153134
            ],
            [
              73.4879663,
              -53.0093727
            ],
            [
              73.4702255,
              -53.0215797
            ],
            [
              73.4470321,
              -53.0280901
            ],
            [
              73.4256291,
              -53.0253232
            ],
            [
              73.4128524,
              -53.0093727
            ],
            [
              73.4265243,
              -53.0031878
            ],
            [
              73.4129338,
              -52.9928525
            ],
            [
              73.3995874,
              -52.9909807
            ],
            [
              73.3891708,
              -52.9978167
            ],
            [
              73.384939,
              -53.0131161
            ],
            [
              73.377452,
              -53.0170224
            ],
            [
              73.3610946,
              -53.0092099
            ],
            [
              73.3445744,
              -52.9965146
            ],
            [
              73.3371688,
              -52.9857724
            ],
            [
              73.3309025,
              -52.9847958
            ],
            [
              73.2968856,
              -52.9616025
            ],
            [
              73.2693791,
              -52.9752743
            ],
            [
              73.2360132,
              -52.9820289
            ],
            [
              73.2417098,
              -53.0022112
            ],
            [
              73.2536727,
              -53.0150693
            ],
            [
              73.2710067,
              -53.0217424
            ],
            [
              73.328868,
              -53.025079
            ],
            [
              73.3447372,
              -53.0292294
            ],
            [
              73.3644312,
              -53.0372861
            ],
            [
              73.3541773,
              -53.0442034
            ],
            [
              73.3532821,
              -53.0516904
            ],
            [
              73.3597111,
              -53.0588518
            ],
            [
              73.3712671,
              -53.0646298
            ],
            [
              73.3637801,
              -53.0748023
            ],
            [
              73.3709416,
              -53.0905087
            ],
            [
              73.4041447,
              -53.1393368
            ],
            [
              73.4304305,
              -53.1652971
            ],
            [
              73.4401962,
              -53.1732724
            ],
            [
              73.4733993,
              -53.1892229
            ],
            [
              73.5073348,
              -53.1925595
            ],
            [
              73.5808212,
              -53.1875953
            ],
            [
              73.6095484,
              -53.1798642
            ],
            [
              73.6616317,
              -53.1466611
            ],
            [
              73.8121851,
              -53.1185035
            ],
            [
              73.7890731,
              -53.120538
            ],
            [
              73.7618921,
              -53.1189104
            ],
            [
              73.735118,
              -53.1124
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for seven-seas-open-ocean/heard-island-and-mcdonald-islands.10m.json
GeoJsonFeatureCollection get sevenSeasOpenOceanHeardIslandAndMcdonaldIslands10m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
