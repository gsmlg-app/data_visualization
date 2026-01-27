// Generated from: assets/north-america/aruba.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for north-america/aruba.10m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Aruba",
        "iso_a2": "AW",
        "iso_a3": "ABW",
        "continent": "North America"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              -69.9969376,
              12.5775821
            ],
            [
              -70.0071508,
              12.5855167
            ],
            [
              -70.0487361,
              12.6321475
            ],
            [
              -70.0611059,
              12.625393
            ],
            [
              -70.0596411,
              12.6142439
            ],
            [
              -70.0526424,
              12.6000023
            ],
            [
              -70.0487361,
              12.5837263
            ],
            [
              -70.0510962,
              12.5740421
            ],
            [
              -70.0603735,
              12.5569522
            ],
            [
              -70.062408,
              12.5468204
            ],
            [
              -70.0580949,
              12.5371768
            ],
            [
              -70.0480851,
              12.5311547
            ],
            [
              -70.0276587,
              12.5229353
            ],
            [
              -69.9585669,
              12.4632022
            ],
            [
              -69.924672,
              12.447211
            ],
            [
              -69.924672,
              12.4403751
            ],
            [
              -69.9451391,
              12.4403751
            ],
            [
              -69.9305314,
              12.4259708
            ],
            [
              -69.9088029,
              12.4177921
            ],
            [
              -69.8880916,
              12.41767
            ],
            [
              -69.8768204,
              12.4273949
            ],
            [
              -69.8801977,
              12.4535587
            ],
            [
              -69.9157609,
              12.4970157
            ],
            [
              -69.924672,
              12.5192325
            ],
            [
              -69.9363908,
              12.5317244
            ],
            [
              -69.9969376,
              12.5775821
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for north-america/aruba.10m.json
GeoJsonFeatureCollection get northAmericaAruba10m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
