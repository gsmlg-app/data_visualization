// Generated from: assets/oceania/federated-states-of-micronesia.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for oceania/federated-states-of-micronesia.50m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Federated States of Micronesia",
        "iso_a2": "FM",
        "iso_a3": "FSM",
        "continent": "Oceania"
      },
      "geometry": {
        "type": "MultiPolygon",
        "coordinates": [
          [
            [
              [
                162.9832031,
                5.3257324
              ],
              [
                162.9582031,
                5.3350098
              ],
              [
                162.9210938,
                5.3179199
              ],
              [
                162.9298828,
                5.3007812
              ],
              [
                162.993457,
                5.2772461
              ],
              [
                162.9832031,
                5.3257324
              ]
            ]
          ],
          [
            [
              [
                138.1426758,
                9.5006836
              ],
              [
                138.1825195,
                9.507373
              ],
              [
                138.2135742,
                9.5472168
              ],
              [
                138.1858398,
                9.5933105
              ],
              [
                138.1469727,
                9.5835937
              ],
              [
                138.1168945,
                9.5501953
              ],
              [
                138.0850586,
                9.4945801
              ],
              [
                138.0619141,
                9.445752
              ],
              [
                138.0670898,
                9.419043
              ],
              [
                138.1426758,
                9.5006836
              ]
            ]
          ],
          [
            [
              [
                151.6477539,
                7.3461914
              ],
              [
                151.6504883,
                7.3628418
              ],
              [
                151.6432617,
                7.379248
              ],
              [
                151.6294922,
                7.3904297
              ],
              [
                151.6056641,
                7.3887207
              ],
              [
                151.5928711,
                7.379248
              ],
              [
                151.6078125,
                7.3753906
              ],
              [
                151.6042969,
                7.3572266
              ],
              [
                151.5750977,
                7.3513184
              ],
              [
                151.5697266,
                7.3455078
              ],
              [
                151.5783203,
                7.3380859
              ],
              [
                151.6394531,
                7.3330078
              ],
              [
                151.6477539,
                7.3461914
              ]
            ]
          ],
          [
            [
              [
                151.8814453,
                7.4320312
              ],
              [
                151.9125977,
                7.4538574
              ],
              [
                151.9105469,
                7.4601562
              ],
              [
                151.8818359,
                7.4670898
              ],
              [
                151.865332,
                7.4661621
              ],
              [
                151.8599609,
                7.457373
              ],
              [
                151.855957,
                7.4317871
              ],
              [
                151.8642578,
                7.4267578
              ],
              [
                151.8814453,
                7.4320312
              ]
            ]
          ],
          [
            [
              [
                158.3148438,
                6.8136719
              ],
              [
                158.309375,
                6.8546387
              ],
              [
                158.3349609,
                6.8931641
              ],
              [
                158.2946289,
                6.9510742
              ],
              [
                158.1861328,
                6.9777344
              ],
              [
                158.1347656,
                6.9448242
              ],
              [
                158.1276367,
                6.9046387
              ],
              [
                158.1608398,
                6.8828125
              ],
              [
                158.1833984,
                6.8012695
              ],
              [
                158.256543,
                6.7910156
              ],
              [
                158.3148438,
                6.8136719
              ]
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for oceania/federated-states-of-micronesia.50m.json
GeoJsonFeatureCollection get oceaniaFederatedStatesOfMicronesia50m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
