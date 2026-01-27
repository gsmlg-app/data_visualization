// Generated from: assets/north-america/the-bahamas.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for north-america/the-bahamas.110m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "The Bahamas",
        "iso_a2": "BS",
        "iso_a3": "BHS",
        "continent": "North America"
      },
      "geometry": {
        "type": "MultiPolygon",
        "coordinates": [
          [
            [
              [
                -78.98,
                26.79
              ],
              [
                -78.91,
                26.42
              ],
              [
                -77.82,
                26.58
              ],
              [
                -77.85,
                26.84
              ],
              [
                -78.51,
                26.87
              ],
              [
                -78.98,
                26.79
              ]
            ]
          ],
          [
            [
              [
                -77.79,
                27.04
              ],
              [
                -77.78802,
                26.92516
              ],
              [
                -77.34,
                26.53
              ],
              [
                -77.35641,
                26.00735
              ],
              [
                -77.17255,
                25.87918
              ],
              [
                -77.0,
                26.59
              ],
              [
                -77.79,
                27.04
              ]
            ]
          ],
          [
            [
              [
                -78.19087,
                25.2103
              ],
              [
                -78.40848,
                24.57564
              ],
              [
                -78.03405,
                24.28615
              ],
              [
                -77.78,
                23.71
              ],
              [
                -77.53466,
                23.75975
              ],
              [
                -77.54,
                24.34
              ],
              [
                -77.89,
                25.17
              ],
              [
                -78.19087,
                25.2103
              ]
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for north-america/the-bahamas.110m.json
GeoJsonFeatureCollection get northAmericaTheBahamas110m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
