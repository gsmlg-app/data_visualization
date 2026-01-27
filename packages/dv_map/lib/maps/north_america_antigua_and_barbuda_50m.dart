// Generated from: assets/north-america/antigua-and-barbuda.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for north-america/antigua-and-barbuda.50m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Antigua and Barbuda",
        "iso_a2": "AG",
        "iso_a3": "ATG",
        "continent": "North America"
      },
      "geometry": {
        "type": "MultiPolygon",
        "coordinates": [
          [
            [
              [
                -61.7160645,
                17.0370117
              ],
              [
                -61.6949707,
                17.0489258
              ],
              [
                -61.6864746,
                17.0698242
              ],
              [
                -61.6860352,
                17.0984375
              ],
              [
                -61.7082031,
                17.1050781
              ],
              [
                -61.7385742,
                17.1384766
              ],
              [
                -61.8172852,
                17.1689453
              ],
              [
                -61.8871094,
                17.0981445
              ],
              [
                -61.8820312,
                17.0631348
              ],
              [
                -61.859668,
                17.0133301
              ],
              [
                -61.7481445,
                16.997168
              ],
              [
                -61.7160645,
                17.0370117
              ]
            ]
          ],
          [
            [
              [
                -61.7471191,
                17.5749512
              ],
              [
                -61.7496094,
                17.6613281
              ],
              [
                -61.7767578,
                17.6904785
              ],
              [
                -61.8199219,
                17.696875
              ],
              [
                -61.8524414,
                17.7140625
              ],
              [
                -61.8661621,
                17.7042969
              ],
              [
                -61.86875,
                17.6854492
              ],
              [
                -61.8437988,
                17.5961426
              ],
              [
                -61.7620117,
                17.5486816
              ],
              [
                -61.7471191,
                17.5749512
              ]
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for north-america/antigua-and-barbuda.50m.json
GeoJsonFeatureCollection get northAmericaAntiguaAndBarbuda50m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
