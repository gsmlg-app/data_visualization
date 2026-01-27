// Generated from: assets/oceania/samoa.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for oceania/samoa.50m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Samoa",
        "iso_a2": "WS",
        "iso_a3": "WSM",
        "continent": "Oceania"
      },
      "geometry": {
        "type": "MultiPolygon",
        "coordinates": [
          [
            [
              [
                -172.3334961,
                -13.4652344
              ],
              [
                -172.5108887,
                -13.4828125
              ],
              [
                -172.6696289,
                -13.5238281
              ],
              [
                -172.7785156,
                -13.5167969
              ],
              [
                -172.7440918,
                -13.5787109
              ],
              [
                -172.6587891,
                -13.6448242
              ],
              [
                -172.5356934,
                -13.7916992
              ],
              [
                -172.4845215,
                -13.8001953
              ],
              [
                -172.3308594,
                -13.774707
              ],
              [
                -172.2249512,
                -13.8042969
              ],
              [
                -172.1768555,
                -13.684668
              ],
              [
                -172.2215332,
                -13.5595703
              ],
              [
                -172.3334961,
                -13.4652344
              ]
            ]
          ],
          [
            [
              [
                -171.4541016,
                -14.0464844
              ],
              [
                -171.4495605,
                -14.0224609
              ],
              [
                -171.461377,
                -13.9776367
              ],
              [
                -171.5068848,
                -13.9499023
              ],
              [
                -171.5654297,
                -13.9430664
              ],
              [
                -171.6039062,
                -13.8791992
              ],
              [
                -171.8581543,
                -13.8071289
              ],
              [
                -171.9848633,
                -13.8244141
              ],
              [
                -172.0458984,
                -13.8571289
              ],
              [
                -172.0280762,
                -13.9068359
              ],
              [
                -171.9119141,
                -14.0016602
              ],
              [
                -171.8637695,
                -14.0020508
              ],
              [
                -171.7282227,
                -14.0472656
              ],
              [
                -171.4541016,
                -14.0464844
              ]
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for oceania/samoa.50m.json
GeoJsonFeatureCollection get oceaniaSamoa50m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
