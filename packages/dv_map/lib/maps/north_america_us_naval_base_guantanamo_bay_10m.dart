// Generated from: assets/north-america/us-naval-base-guantanamo-bay.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for north-america/us-naval-base-guantanamo-bay.10m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "US Naval Base Guantanamo Bay",
        "iso_a2": "-99",
        "iso_a3": "-99",
        "continent": "North America"
      },
      "geometry": {
        "type": "MultiPolygon",
        "coordinates": [
          [
            [
              [
                -75.0950058,
                19.897226
              ],
              [
                -75.0949503,
                19.9715837
              ],
              [
                -75.1370358,
                19.9715506
              ],
              [
                -75.1396378,
                19.9649926
              ],
              [
                -75.1338056,
                19.9580744
              ],
              [
                -75.1298619,
                19.9556126
              ],
              [
                -75.1167583,
                19.9670542
              ],
              [
                -75.1046022,
                19.9593588
              ],
              [
                -75.1010415,
                19.9531498
              ],
              [
                -75.1043885,
                19.9427573
              ],
              [
                -75.1178406,
                19.9440836
              ],
              [
                -75.1226379,
                19.9404607
              ],
              [
                -75.1464738,
                19.9234073
              ],
              [
                -75.1576632,
                19.9187042
              ],
              [
                -75.1643777,
                19.9137193
              ],
              [
                -75.1652961,
                19.8970124
              ],
              [
                -75.1619196,
                19.8911422
              ],
              [
                -75.1374249,
                19.8925537
              ],
              [
                -75.1076611,
                19.8975923
              ],
              [
                -75.0950058,
                19.897226
              ]
            ]
          ],
          [
            [
              [
                -75.1601924,
                19.970648
              ],
              [
                -75.1788621,
                19.9707318
              ],
              [
                -75.2289693,
                19.9374405
              ],
              [
                -75.2328589,
                19.9000512
              ],
              [
                -75.2310685,
                19.9004581
              ],
              [
                -75.2074933,
                19.9057766
              ],
              [
                -75.1910022,
                19.9063168
              ],
              [
                -75.192214,
                19.9099693
              ],
              [
                -75.2057509,
                19.911535
              ],
              [
                -75.2178589,
                19.9194591
              ],
              [
                -75.21811,
                19.9240057
              ],
              [
                -75.2145008,
                19.9262811
              ],
              [
                -75.2089515,
                19.9292475
              ],
              [
                -75.2033881,
                19.9283513
              ],
              [
                -75.2016446,
                19.9228553
              ],
              [
                -75.196036,
                19.9219105
              ],
              [
                -75.1931266,
                19.9270951
              ],
              [
                -75.1839551,
                19.9335942
              ],
              [
                -75.1721899,
                19.9357771
              ],
              [
                -75.1567334,
                19.9388997
              ],
              [
                -75.1634008,
                19.9503848
              ],
              [
                -75.1712137,
                19.957524
              ],
              [
                -75.1683529,
                19.9665648
              ],
              [
                -75.1601924,
                19.970648
              ]
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for north-america/us-naval-base-guantanamo-bay.10m.json
GeoJsonFeatureCollection get northAmericaUsNavalBaseGuantanamoBay10m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
