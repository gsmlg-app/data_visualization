// Generated from: assets/oceania/niue.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for oceania/niue.10m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Niue",
        "iso_a2": "NU",
        "iso_a3": "NIU",
        "continent": "Oceania"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              -169.851145,
              -18.9651018
            ],
            [
              -169.8637182,
              -18.9640439
            ],
            [
              -169.8958227,
              -18.9651018
            ],
            [
              -169.916005,
              -19.0031064
            ],
            [
              -169.9218237,
              -19.0070126
            ],
            [
              -169.926381,
              -19.0074195
            ],
            [
              -169.9302465,
              -19.0083961
            ],
            [
              -169.9337052,
              -19.0136044
            ],
            [
              -169.9343969,
              -19.0209286
            ],
            [
              -169.9315893,
              -19.0265439
            ],
            [
              -169.9279679,
              -19.0318336
            ],
            [
              -169.9262589,
              -19.0375302
            ],
            [
              -169.9477026,
              -19.0694312
            ],
            [
              -169.9504288,
              -19.0873349
            ],
            [
              -169.9262589,
              -19.0949033
            ],
            [
              -169.9240617,
              -19.0993792
            ],
            [
              -169.919423,
              -19.1159807
            ],
            [
              -169.9247941,
              -19.1193173
            ],
            [
              -169.9279679,
              -19.1228167
            ],
            [
              -169.9305314,
              -19.1263974
            ],
            [
              -169.9337052,
              -19.1296526
            ],
            [
              -169.9210913,
              -19.128025
            ],
            [
              -169.9099829,
              -19.1285947
            ],
            [
              -169.9020483,
              -19.1329892
            ],
            [
              -169.8989152,
              -19.1427548
            ],
            [
              -169.8809708,
              -19.1290829
            ],
            [
              -169.8729956,
              -19.1259091
            ],
            [
              -169.8654272,
              -19.1296526
            ],
            [
              -169.8238419,
              -19.1023089
            ],
            [
              -169.805979,
              -19.0819638
            ],
            [
              -169.7968644,
              -19.0739072
            ],
            [
              -169.7829077,
              -19.068943
            ],
            [
              -169.7942602,
              -19.0471331
            ],
            [
              -169.8226212,
              -18.9725888
            ],
            [
              -169.8253068,
              -18.9679501
            ],
            [
              -169.851145,
              -18.9651018
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for oceania/niue.10m.json
GeoJsonFeatureCollection get oceaniaNiue10m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
