// Generated from: assets/oceania/tonga.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for oceania/tonga.50m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Tonga",
        "iso_a2": "TO",
        "iso_a3": "TON",
        "continent": "Oceania"
      },
      "geometry": {
        "type": "MultiPolygon",
        "coordinates": [
          [
            [
              [
                -175.1619141,
                -21.1693359
              ],
              [
                -175.1997559,
                -21.1556641
              ],
              [
                -175.1580078,
                -21.1464844
              ],
              [
                -175.2253906,
                -21.11875
              ],
              [
                -175.3004395,
                -21.1133789
              ],
              [
                -175.3226074,
                -21.0993164
              ],
              [
                -175.3180664,
                -21.0682617
              ],
              [
                -175.3623535,
                -21.1068359
              ],
              [
                -175.3354492,
                -21.1577148
              ],
              [
                -175.2023438,
                -21.2234375
              ],
              [
                -175.1565918,
                -21.2636719
              ],
              [
                -175.084082,
                -21.1607422
              ],
              [
                -175.0781738,
                -21.1290039
              ],
              [
                -175.1319336,
                -21.1397461
              ],
              [
                -175.1476563,
                -21.1694336
              ],
              [
                -175.1619141,
                -21.1693359
              ]
            ]
          ],
          [
            [
              [
                -173.9535156,
                -18.6393555
              ],
              [
                -173.9239746,
                -18.6084961
              ],
              [
                -173.921875,
                -18.5885742
              ],
              [
                -173.9680664,
                -18.565332
              ],
              [
                -174.0024414,
                -18.5707031
              ],
              [
                -174.0691406,
                -18.6402344
              ],
              [
                -174.053125,
                -18.6633789
              ],
              [
                -174.0093262,
                -18.6977539
              ],
              [
                -173.9913086,
                -18.6986328
              ],
              [
                -173.9535156,
                -18.6393555
              ]
            ]
          ],
          [
            [
              [
                -174.9131348,
                -21.3004883
              ],
              [
                -174.9234863,
                -21.303418
              ],
              [
                -174.9729492,
                -21.3498047
              ],
              [
                -174.9675293,
                -21.3817383
              ],
              [
                -174.9186523,
                -21.4505859
              ],
              [
                -174.9131348,
                -21.3004883
              ]
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for oceania/tonga.50m.json
GeoJsonFeatureCollection get oceaniaTonga50m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
