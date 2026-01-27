// Generated from: assets/oceania/wallis-and-futuna.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for oceania/wallis-and-futuna.10m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Wallis and Futuna",
        "iso_a2": "WF",
        "iso_a3": "WLF",
        "continent": "Oceania"
      },
      "geometry": {
        "type": "MultiPolygon",
        "coordinates": [
          [
            [
              [
                -178.1423234,
                -14.2435849
              ],
              [
                -178.1780493,
                -14.2325986
              ],
              [
                -178.1857397,
                -14.2482236
              ],
              [
                -178.1752417,
                -14.2770322
              ],
              [
                -178.1566056,
                -14.3051083
              ],
              [
                -178.1469214,
                -14.3101539
              ],
              [
                -178.1214493,
                -14.3138974
              ],
              [
                -178.1088354,
                -14.3194312
              ],
              [
                -178.1000464,
                -14.3160133
              ],
              [
                -178.0467423,
                -14.3194312
              ],
              [
                -178.0467423,
                -14.3125953
              ],
              [
                -178.092478,
                -14.288995
              ],
              [
                -178.1050919,
                -14.2852516
              ],
              [
                -178.1081437,
                -14.2789853
              ],
              [
                -178.1423234,
                -14.2435849
              ]
            ]
          ],
          [
            [
              [
                -176.1554663,
                -13.2089169
              ],
              [
                -176.1703995,
                -13.2214495
              ],
              [
                -176.1840307,
                -13.2378883
              ],
              [
                -176.1901749,
                -13.2570126
              ],
              [
                -176.18281,
                -13.2779273
              ],
              [
                -176.1995743,
                -13.2906227
              ],
              [
                -176.1947729,
                -13.3067359
              ],
              [
                -176.1839087,
                -13.3238258
              ],
              [
                -176.18281,
                -13.339288
              ],
              [
                -176.1732072,
                -13.3464495
              ],
              [
                -176.1594946,
                -13.3502743
              ],
              [
                -176.1471655,
                -13.3477516
              ],
              [
                -176.1418351,
                -13.33587
              ],
              [
                -176.1476538,
                -13.3104794
              ],
              [
                -176.1444799,
                -13.3008766
              ],
              [
                -176.1281632,
                -13.2982724
              ],
              [
                -176.1305639,
                -13.2911923
              ],
              [
                -176.1321508,
                -13.2885068
              ],
              [
                -176.1356095,
                -13.2847633
              ],
              [
                -176.1255997,
                -13.2640927
              ],
              [
                -176.1305639,
                -13.2476539
              ],
              [
                -176.1430151,
                -13.2307268
              ],
              [
                -176.1554663,
                -13.2089169
              ]
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for oceania/wallis-and-futuna.10m.json
GeoJsonFeatureCollection get oceaniaWallisAndFutuna10m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
