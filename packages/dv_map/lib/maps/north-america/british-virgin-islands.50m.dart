// Generated from: assets/north-america/british-virgin-islands.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for north-america/british-virgin-islands.50m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "British Virgin Islands",
        "iso_a2": "VG",
        "iso_a3": "VGB",
        "continent": "North America"
      },
      "geometry": {
        "type": "MultiPolygon",
        "coordinates": [
          [
            [
              [
                -64.3952148,
                18.4645996
              ],
              [
                -64.3246582,
                18.5174805
              ],
              [
                -64.4260742,
                18.5130859
              ],
              [
                -64.44375,
                18.4733887
              ],
              [
                -64.4380371,
                18.4589844
              ],
              [
                -64.4211426,
                18.4574219
              ],
              [
                -64.3952148,
                18.4645996
              ]
            ]
          ],
          [
            [
              [
                -64.5936523,
                18.402832
              ],
              [
                -64.545166,
                18.4381348
              ],
              [
                -64.5691406,
                18.4462891
              ],
              [
                -64.6509766,
                18.4425293
              ],
              [
                -64.6951172,
                18.4116699
              ],
              [
                -64.6718262,
                18.3991211
              ],
              [
                -64.5936523,
                18.402832
              ]
            ]
          ],
          [
            [
              [
                -64.2878906,
                18.7405762
              ],
              [
                -64.3230957,
                18.7526855
              ],
              [
                -64.4114258,
                18.7511719
              ],
              [
                -64.4014648,
                18.7385742
              ],
              [
                -64.3833984,
                18.7326172
              ],
              [
                -64.3394531,
                18.7307129
              ],
              [
                -64.2823242,
                18.7077148
              ],
              [
                -64.273584,
                18.7071289
              ],
              [
                -64.2878906,
                18.7405762
              ]
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for north-america/british-virgin-islands.50m.json
GeoJsonFeatureCollection get northAmericaBritishVirginIslands50m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
