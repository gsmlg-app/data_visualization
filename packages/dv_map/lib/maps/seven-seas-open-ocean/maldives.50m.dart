// Generated from: assets/seven-seas-open-ocean/maldives.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for seven-seas-open-ocean/maldives.50m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Maldives",
        "iso_a2": "MV",
        "iso_a3": "MDV",
        "continent": "Seven seas (open ocean)"
      },
      "geometry": {
        "type": "MultiPolygon",
        "coordinates": [
          [
            [
              [
                73.4166016,
                3.23125
              ],
              [
                73.4349609,
                3.2501465
              ],
              [
                73.4427734,
                3.2743164
              ],
              [
                73.4277344,
                3.2898437
              ],
              [
                73.4015625,
                3.2887695
              ],
              [
                73.3849609,
                3.2713867
              ],
              [
                73.3820313,
                3.2464844
              ],
              [
                73.3953125,
                3.2293945
              ],
              [
                73.4166016,
                3.23125
              ]
            ]
          ],
          [
            [
              [
                73.512207,
                4.1645508
              ],
              [
                73.519043,
                4.1868652
              ],
              [
                73.522168,
                4.2110352
              ],
              [
                73.5271484,
                4.2296875
              ],
              [
                73.5283203,
                4.2433105
              ],
              [
                73.5177734,
                4.2476562
              ],
              [
                73.5041016,
                4.2346191
              ],
              [
                73.4947266,
                4.2104492
              ],
              [
                73.4811523,
                4.1881348
              ],
              [
                73.4730469,
                4.1707031
              ],
              [
                73.4786133,
                4.1589355
              ],
              [
                73.4948242,
                4.1551758
              ],
              [
                73.512207,
                4.1645508
              ]
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for seven-seas-open-ocean/maldives.50m.json
GeoJsonFeatureCollection get sevenSeasOpenOceanMaldives50m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
