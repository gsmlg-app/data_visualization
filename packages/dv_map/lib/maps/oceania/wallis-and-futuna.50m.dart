// Generated from: assets/oceania/wallis-and-futuna.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for oceania/wallis-and-futuna.50m.json
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
                -176.1605957,
                -13.3328125
              ],
              [
                -176.1280762,
                -13.2681641
              ],
              [
                -176.1479492,
                -13.2216797
              ],
              [
                -176.1711914,
                -13.2425781
              ],
              [
                -176.1953613,
                -13.3016602
              ],
              [
                -176.1769043,
                -13.340918
              ],
              [
                -176.1605957,
                -13.3328125
              ]
            ]
          ],
          [
            [
              [
                -178.0466797,
                -14.3183594
              ],
              [
                -178.0436523,
                -14.3032227
              ],
              [
                -178.1050293,
                -14.2841797
              ],
              [
                -178.1422363,
                -14.2425781
              ],
              [
                -178.1780273,
                -14.2316406
              ],
              [
                -178.1943848,
                -14.2554688
              ],
              [
                -178.1585937,
                -14.3119141
              ],
              [
                -178.1033203,
                -14.3249023
              ],
              [
                -178.0466797,
                -14.3183594
              ]
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for oceania/wallis-and-futuna.50m.json
GeoJsonFeatureCollection get oceaniaWallisAndFutuna50m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
