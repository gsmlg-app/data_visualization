// Generated from: assets/asia/indian-ocean-territories.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for asia/indian-ocean-territories.50m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Indian Ocean Territories",
        "iso_a2": "-99",
        "iso_a3": "-99",
        "continent": "Asia"
      },
      "geometry": {
        "type": "MultiPolygon",
        "coordinates": [
          [
            [
              [
                105.7253906,
                -10.4929688
              ],
              [
                105.7054688,
                -10.4306641
              ],
              [
                105.6698242,
                -10.4494141
              ],
              [
                105.6455078,
                -10.4522461
              ],
              [
                105.5957031,
                -10.459668
              ],
              [
                105.584082,
                -10.5125
              ],
              [
                105.6443359,
                -10.525
              ],
              [
                105.696875,
                -10.5641602
              ],
              [
                105.7253906,
                -10.4929688
              ]
            ]
          ],
          [
            [
              [
                96.8404297,
                -12.1818359
              ],
              [
                96.8356445,
                -12.1712891
              ],
              [
                96.8394531,
                -12.1602539
              ],
              [
                96.8341797,
                -12.1441406
              ],
              [
                96.8326172,
                -12.1360352
              ],
              [
                96.8326172,
                -12.1261719
              ],
              [
                96.8258789,
                -12.1261719
              ],
              [
                96.8277344,
                -12.1506836
              ],
              [
                96.8348633,
                -12.1796875
              ],
              [
                96.8495117,
                -12.1973633
              ],
              [
                96.8736328,
                -12.1876953
              ],
              [
                96.8673828,
                -12.1814453
              ],
              [
                96.8519531,
                -12.1868164
              ],
              [
                96.8404297,
                -12.1818359
              ]
            ]
          ],
          [
            [
              [
                96.9182617,
                -12.1941406
              ],
              [
                96.9243164,
                -12.184668
              ],
              [
                96.925293,
                -12.1732422
              ],
              [
                96.9205078,
                -12.1615234
              ],
              [
                96.9189453,
                -12.1733398
              ],
              [
                96.9133789,
                -12.1818359
              ],
              [
                96.9043945,
                -12.1865234
              ],
              [
                96.8929688,
                -12.187207
              ],
              [
                96.8939453,
                -12.1925781
              ],
              [
                96.8967773,
                -12.1955078
              ],
              [
                96.906543,
                -12.1998047
              ],
              [
                96.9182617,
                -12.1941406
              ]
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for asia/indian-ocean-territories.50m.json
GeoJsonFeatureCollection get asiaIndianOceanTerritories50m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
