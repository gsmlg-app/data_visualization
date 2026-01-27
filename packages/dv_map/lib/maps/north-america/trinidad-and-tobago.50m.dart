// Generated from: assets/north-america/trinidad-and-tobago.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for north-america/trinidad-and-tobago.50m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Trinidad and Tobago",
        "iso_a2": "TT",
        "iso_a3": "TTO",
        "continent": "North America"
      },
      "geometry": {
        "type": "MultiPolygon",
        "coordinates": [
          [
            [
              [
                -60.7562988,
                11.1785156
              ],
              [
                -60.5464844,
                11.2637207
              ],
              [
                -60.5254883,
                11.3253906
              ],
              [
                -60.562793,
                11.3235352
              ],
              [
                -60.7089355,
                11.2772461
              ],
              [
                -60.8042969,
                11.2083984
              ],
              [
                -60.8106445,
                11.1686035
              ],
              [
                -60.7562988,
                11.1785156
              ]
            ]
          ],
          [
            [
              [
                -61.0121094,
                10.1343262
              ],
              [
                -61.0041016,
                10.1678223
              ],
              [
                -60.9996094,
                10.2614746
              ],
              [
                -60.968457,
                10.3233887
              ],
              [
                -61.0164062,
                10.386377
              ],
              [
                -61.0375,
                10.4822754
              ],
              [
                -61.0193359,
                10.5581055
              ],
              [
                -61.0337402,
                10.669873
              ],
              [
                -60.9967285,
                10.7161621
              ],
              [
                -60.917627,
                10.8402344
              ],
              [
                -61.0785156,
                10.8319336
              ],
              [
                -61.1737305,
                10.8033203
              ],
              [
                -61.3700195,
                10.7968262
              ],
              [
                -61.4648438,
                10.7644531
              ],
              [
                -61.5918457,
                10.7479492
              ],
              [
                -61.6511719,
                10.7180664
              ],
              [
                -61.6353027,
                10.6993652
              ],
              [
                -61.540918,
                10.6644531
              ],
              [
                -61.4988281,
                10.6388672
              ],
              [
                -61.4782715,
                10.6033691
              ],
              [
                -61.4647461,
                10.5389648
              ],
              [
                -61.4993164,
                10.2685547
              ],
              [
                -61.5288574,
                10.253125
              ],
              [
                -61.6327148,
                10.2434082
              ],
              [
                -61.6614746,
                10.1916992
              ],
              [
                -61.9061035,
                10.0691406
              ],
              [
                -61.7716797,
                10.0850586
              ],
              [
                -61.5966797,
                10.0646484
              ],
              [
                -61.1742676,
                10.0780273
              ],
              [
                -61.0121094,
                10.1343262
              ]
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for north-america/trinidad-and-tobago.50m.json
GeoJsonFeatureCollection get northAmericaTrinidadAndTobago50m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
