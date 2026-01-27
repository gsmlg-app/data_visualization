// Generated from: assets/oceania/palau.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for oceania/palau.50m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Palau",
        "iso_a2": "PW",
        "iso_a3": "PLW",
        "continent": "Oceania"
      },
      "geometry": {
        "type": "MultiPolygon",
        "coordinates": [
          [
            [
              [
                131.1723633,
                3.0262207
              ],
              [
                131.1863281,
                3.0420898
              ],
              [
                131.1878906,
                3.0556152
              ],
              [
                131.1723633,
                3.0605957
              ],
              [
                131.1515625,
                3.0541016
              ],
              [
                131.1367188,
                3.0394531
              ],
              [
                131.1349609,
                3.0252441
              ],
              [
                131.1496094,
                3.021875
              ],
              [
                131.1723633,
                3.0262207
              ]
            ]
          ],
          [
            [
              [
                134.5954102,
                7.3820312
              ],
              [
                134.5982422,
                7.4382812
              ],
              [
                134.6327148,
                7.5013184
              ],
              [
                134.6595703,
                7.6632812
              ],
              [
                134.6511719,
                7.7121094
              ],
              [
                134.6086914,
                7.623584
              ],
              [
                134.599707,
                7.6157715
              ],
              [
                134.555957,
                7.5939453
              ],
              [
                134.5157227,
                7.5257812
              ],
              [
                134.50625,
                7.4371094
              ],
              [
                134.534668,
                7.3606445
              ],
              [
                134.5954102,
                7.3820312
              ]
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for oceania/palau.50m.json
GeoJsonFeatureCollection get oceaniaPalau50m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
