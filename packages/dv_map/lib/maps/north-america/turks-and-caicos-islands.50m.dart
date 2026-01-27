// Generated from: assets/north-america/turks-and-caicos-islands.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for north-america/turks-and-caicos-islands.50m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Turks and Caicos Islands",
        "iso_a2": "TC",
        "iso_a3": "TCA",
        "continent": "North America"
      },
      "geometry": {
        "type": "MultiPolygon",
        "coordinates": [
          [
            [
              [
                -71.6614258,
                21.7652344
              ],
              [
                -71.6369141,
                21.7875488
              ],
              [
                -71.6683594,
                21.8334473
              ],
              [
                -71.8061523,
                21.8520996
              ],
              [
                -71.8476562,
                21.843457
              ],
              [
                -71.8304199,
                21.790625
              ],
              [
                -71.7217773,
                21.7902344
              ],
              [
                -71.6653809,
                21.751709
              ],
              [
                -71.6614258,
                21.7652344
              ]
            ]
          ],
          [
            [
              [
                -71.8799316,
                21.8404297
              ],
              [
                -71.8996094,
                21.8625
              ],
              [
                -71.931543,
                21.9519043
              ],
              [
                -72.0106445,
                21.9504395
              ],
              [
                -72.019043,
                21.9182617
              ],
              [
                -71.9845215,
                21.8934082
              ],
              [
                -71.9637695,
                21.892041
              ],
              [
                -71.9554687,
                21.8644043
              ],
              [
                -71.8974609,
                21.8298828
              ],
              [
                -71.8799316,
                21.8404297
              ]
            ]
          ],
          [
            [
              [
                -72.3328125,
                21.8513672
              ],
              [
                -72.3423828,
                21.7953125
              ],
              [
                -72.3354492,
                21.7580078
              ],
              [
                -72.3008789,
                21.7552246
              ],
              [
                -72.1906738,
                21.7697754
              ],
              [
                -72.181543,
                21.7800293
              ],
              [
                -72.1443359,
                21.7927246
              ],
              [
                -72.1498047,
                21.8044922
              ],
              [
                -72.2186523,
                21.7962891
              ],
              [
                -72.3328125,
                21.8513672
              ]
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for north-america/turks-and-caicos-islands.50m.json
GeoJsonFeatureCollection get northAmericaTurksAndCaicosIslands50m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
