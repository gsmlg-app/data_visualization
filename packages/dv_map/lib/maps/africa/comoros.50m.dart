// Generated from: assets/africa/comoros.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for africa/comoros.50m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Comoros",
        "iso_a2": "KM",
        "iso_a3": "COM",
        "continent": "Africa"
      },
      "geometry": {
        "type": "MultiPolygon",
        "coordinates": [
          [
            [
              [
                44.4763672,
                -12.081543
              ],
              [
                44.4518555,
                -12.0713867
              ],
              [
                44.4125977,
                -12.0929688
              ],
              [
                44.4070313,
                -12.1201172
              ],
              [
                44.3791016,
                -12.165625
              ],
              [
                44.3344727,
                -12.1730469
              ],
              [
                44.2922852,
                -12.1647461
              ],
              [
                44.2201172,
                -12.1713867
              ],
              [
                44.3774414,
                -12.2522461
              ],
              [
                44.4601563,
                -12.3351563
              ],
              [
                44.5049805,
                -12.356543
              ],
              [
                44.5262695,
                -12.3235352
              ],
              [
                44.5267578,
                -12.2195313
              ],
              [
                44.4763672,
                -12.081543
              ]
            ]
          ],
          [
            [
              [
                43.7886719,
                -12.3070313
              ],
              [
                43.7042969,
                -12.255957
              ],
              [
                43.6313477,
                -12.2470703
              ],
              [
                43.6329102,
                -12.2876953
              ],
              [
                43.6636719,
                -12.3428711
              ],
              [
                43.8589844,
                -12.3682617
              ],
              [
                43.7886719,
                -12.3070313
              ]
            ]
          ],
          [
            [
              [
                43.4658203,
                -11.9012695
              ],
              [
                43.4915039,
                -11.8621094
              ],
              [
                43.4476563,
                -11.7525391
              ],
              [
                43.3793945,
                -11.6141602
              ],
              [
                43.3929688,
                -11.4085938
              ],
              [
                43.3415039,
                -11.368457
              ],
              [
                43.2990234,
                -11.3745117
              ],
              [
                43.2806641,
                -11.3912109
              ],
              [
                43.2560547,
                -11.4321289
              ],
              [
                43.2266602,
                -11.7518555
              ],
              [
                43.3033203,
                -11.844043
              ],
              [
                43.3554688,
                -11.8575195
              ],
              [
                43.4467773,
                -11.9145508
              ],
              [
                43.4658203,
                -11.9012695
              ]
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for africa/comoros.50m.json
GeoJsonFeatureCollection get africaComoros50m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
