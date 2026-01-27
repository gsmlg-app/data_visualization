// Generated from: assets/europe/malta.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for europe/malta.50m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Malta",
        "iso_a2": "MT",
        "iso_a3": "MLT",
        "continent": "Europe"
      },
      "geometry": {
        "type": "MultiPolygon",
        "coordinates": [
          [
            [
              [
                14.5662109,
                35.8527344
              ],
              [
                14.5370117,
                35.8862793
              ],
              [
                14.4483398,
                35.9574219
              ],
              [
                14.3512695,
                35.978418
              ],
              [
                14.3523438,
                35.8722656
              ],
              [
                14.4364258,
                35.8216797
              ],
              [
                14.5327148,
                35.8202148
              ],
              [
                14.5662109,
                35.8527344
              ]
            ]
          ],
          [
            [
              [
                14.3134766,
                36.0275879
              ],
              [
                14.3208984,
                36.0362305
              ],
              [
                14.3037109,
                36.0623047
              ],
              [
                14.2632813,
                36.0757812
              ],
              [
                14.1803711,
                36.0604004
              ],
              [
                14.1942383,
                36.0422363
              ],
              [
                14.2536133,
                36.0121582
              ],
              [
                14.3134766,
                36.0275879
              ]
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for europe/malta.50m.json
GeoJsonFeatureCollection get europeMalta50m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
