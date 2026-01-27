// Generated from: assets/oceania/fiji.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for oceania/fiji.110m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Fiji",
        "iso_a2": "FJ",
        "iso_a3": "FJI",
        "continent": "Oceania"
      },
      "geometry": {
        "type": "MultiPolygon",
        "coordinates": [
          [
            [
              [
                180.0,
                -16.0671327
              ],
              [
                179.4135094,
                -16.3790543
              ],
              [
                179.0966094,
                -16.4339843
              ],
              [
                178.5968386,
                -16.63915
              ],
              [
                178.7250594,
                -17.0120417
              ],
              [
                179.3641427,
                -16.8013541
              ],
              [
                180.0,
                -16.5552166
              ],
              [
                180.0,
                -16.0671327
              ]
            ]
          ],
          [
            [
              [
                178.12557,
                -17.50481
              ],
              [
                177.67087,
                -17.38114
              ],
              [
                177.28504,
                -17.72465
              ],
              [
                177.38146,
                -18.16432
              ],
              [
                177.93266,
                -18.28799
              ],
              [
                178.55271,
                -18.15059
              ],
              [
                178.71806,
                -17.62846
              ],
              [
                178.3736,
                -17.33992
              ],
              [
                178.12557,
                -17.50481
              ]
            ]
          ],
          [
            [
              [
                -179.7933201,
                -16.0208823
              ],
              [
                -180.0,
                -16.0671327
              ],
              [
                -180.0,
                -16.5552166
              ],
              [
                -179.9173694,
                -16.5017831
              ],
              [
                -179.7933201,
                -16.0208823
              ]
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for oceania/fiji.110m.json
GeoJsonFeatureCollection get oceaniaFiji110m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
