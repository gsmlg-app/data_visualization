// Generated from: assets/oceania/northern-mariana-islands.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for oceania/northern-mariana-islands.50m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Northern Mariana Islands",
        "iso_a2": "MP",
        "iso_a3": "MNP",
        "continent": "Oceania"
      },
      "geometry": {
        "type": "MultiPolygon",
        "coordinates": [
          [
            [
              [
                145.7083984,
                18.7625
              ],
              [
                145.7066406,
                18.7904785
              ],
              [
                145.6901367,
                18.8016113
              ],
              [
                145.6455078,
                18.8067871
              ],
              [
                145.6525391,
                18.7526367
              ],
              [
                145.678125,
                18.7252441
              ],
              [
                145.7083984,
                18.7625
              ]
            ]
          ],
          [
            [
              [
                145.7121094,
                16.3391113
              ],
              [
                145.7195313,
                16.3597656
              ],
              [
                145.6955078,
                16.3796387
              ],
              [
                145.6310547,
                16.3779785
              ],
              [
                145.6360352,
                16.3515137
              ],
              [
                145.6583008,
                16.335791
              ],
              [
                145.6902344,
                16.3321289
              ],
              [
                145.7121094,
                16.3391113
              ]
            ]
          ],
          [
            [
              [
                145.2648438,
                14.1581055
              ],
              [
                145.2654297,
                14.1802246
              ],
              [
                145.2324219,
                14.1894531
              ],
              [
                145.1521484,
                14.163623
              ],
              [
                145.1574219,
                14.1369141
              ],
              [
                145.1795898,
                14.1209961
              ],
              [
                145.215332,
                14.1113281
              ],
              [
                145.2648438,
                14.1581055
              ]
            ]
          ],
          [
            [
              [
                145.7775391,
                18.0789551
              ],
              [
                145.8354492,
                18.1367676
              ],
              [
                145.8074219,
                18.1726563
              ],
              [
                145.7892578,
                18.1554199
              ],
              [
                145.7291016,
                18.0569336
              ],
              [
                145.7775391,
                18.0789551
              ]
            ]
          ],
          [
            [
              [
                145.7519531,
                15.1331543
              ],
              [
                145.7823242,
                15.1746094
              ],
              [
                145.7885742,
                15.2226562
              ],
              [
                145.821875,
                15.2653809
              ],
              [
                145.7863281,
                15.2568848
              ],
              [
                145.7131836,
                15.2152832
              ],
              [
                145.6842773,
                15.1250977
              ],
              [
                145.6982422,
                15.1135254
              ],
              [
                145.7492188,
                15.1072266
              ],
              [
                145.7519531,
                15.1331543
              ]
            ]
          ],
          [
            [
              [
                145.6623047,
                14.9705078
              ],
              [
                145.6473633,
                15.0594727
              ],
              [
                145.6248047,
                15.0601562
              ],
              [
                145.5867188,
                15.0308105
              ],
              [
                145.5916016,
                14.9988281
              ],
              [
                145.6209961,
                14.9195312
              ],
              [
                145.6623047,
                14.9705078
              ]
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for oceania/northern-mariana-islands.50m.json
GeoJsonFeatureCollection get oceaniaNorthernMarianaIslands50m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
