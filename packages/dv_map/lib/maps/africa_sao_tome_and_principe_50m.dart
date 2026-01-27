// Generated from: assets/africa/sao-tome-and-principe.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for africa/sao-tome-and-principe.50m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "S\u00e3o Tom\u00e9 and Principe",
        "iso_a2": "ST",
        "iso_a3": "STP",
        "continent": "Africa"
      },
      "geometry": {
        "type": "MultiPolygon",
        "coordinates": [
          [
            [
              [
                7.4238281,
                1.5677246
              ],
              [
                7.4523438,
                1.6311035
              ],
              [
                7.4503906,
                1.6619629
              ],
              [
                7.4370117,
                1.6830566
              ],
              [
                7.4144531,
                1.6991211
              ],
              [
                7.3875977,
                1.6801758
              ],
              [
                7.3306641,
                1.6033691
              ],
              [
                7.3423828,
                1.5635742
              ],
              [
                7.3866211,
                1.5415527
              ],
              [
                7.4238281,
                1.5677246
              ]
            ]
          ],
          [
            [
              [
                6.6599609,
                0.1206543
              ],
              [
                6.75,
                0.243457
              ],
              [
                6.7498047,
                0.3256348
              ],
              [
                6.6869141,
                0.4043945
              ],
              [
                6.6258789,
                0.4002441
              ],
              [
                6.5243164,
                0.3402832
              ],
              [
                6.4775391,
                0.280127
              ],
              [
                6.4681641,
                0.2273437
              ],
              [
                6.4969727,
                0.1173828
              ],
              [
                6.5197266,
                0.0663086
              ],
              [
                6.5568359,
                0.0473633
              ],
              [
                6.6599609,
                0.1206543
              ]
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for africa/sao-tome-and-principe.50m.json
GeoJsonFeatureCollection get africaSaoTomeAndPrincipe50m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
