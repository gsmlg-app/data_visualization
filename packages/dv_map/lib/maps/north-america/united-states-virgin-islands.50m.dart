// Generated from: assets/north-america/united-states-virgin-islands.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for north-america/united-states-virgin-islands.50m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "United States Virgin Islands",
        "iso_a2": "VI",
        "iso_a3": "VIR",
        "continent": "North America"
      },
      "geometry": {
        "type": "MultiPolygon",
        "coordinates": [
          [
            [
              [
                -64.8450195,
                18.3300781
              ],
              [
                -64.8891113,
                18.3742187
              ],
              [
                -64.942041,
                18.3852051
              ],
              [
                -65.0236328,
                18.3675781
              ],
              [
                -64.9199707,
                18.3212891
              ],
              [
                -64.8450195,
                18.3300781
              ]
            ]
          ],
          [
            [
              [
                -64.6598145,
                18.3543457
              ],
              [
                -64.7524414,
                18.3719727
              ],
              [
                -64.7876953,
                18.3411133
              ],
              [
                -64.7706055,
                18.3315918
              ],
              [
                -64.7259766,
                18.3278809
              ],
              [
                -64.6598145,
                18.3543457
              ]
            ]
          ],
          [
            [
              [
                -64.765625,
                17.7943359
              ],
              [
                -64.8847168,
                17.7722656
              ],
              [
                -64.8891113,
                17.701709
              ],
              [
                -64.6862793,
                17.7061035
              ],
              [
                -64.5804687,
                17.7501953
              ],
              [
                -64.6818359,
                17.7501953
              ],
              [
                -64.765625,
                17.7943359
              ]
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for north-america/united-states-virgin-islands.50m.json
GeoJsonFeatureCollection get northAmericaUnitedStatesVirginIslands50m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
