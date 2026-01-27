// Generated from: assets/asia/south-korea.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for asia/south-korea.110m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "South Korea",
        "iso_a2": "KR",
        "iso_a3": "KOR",
        "continent": "Asia"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              126.1747587,
              37.7496858
            ],
            [
              126.8601433,
              36.8939241
            ],
            [
              126.1173979,
              36.7254847
            ],
            [
              126.5592314,
              35.6845405
            ],
            [
              126.3739197,
              34.9345605
            ],
            [
              126.4857475,
              34.3900459
            ],
            [
              127.3865194,
              34.4756737
            ],
            [
              128.1858505,
              34.8903771
            ],
            [
              129.0913766,
              35.0824842
            ],
            [
              129.4683045,
              35.6321406
            ],
            [
              129.4604497,
              36.7841892
            ],
            [
              129.2129195,
              37.4323925
            ],
            [
              128.3497164,
              38.6122429
            ],
            [
              128.2057459,
              38.3703972
            ],
            [
              127.7800354,
              38.3045356
            ],
            [
              127.0733085,
              38.2561148
            ],
            [
              126.6837199,
              37.8047729
            ],
            [
              126.2373389,
              37.8403779
            ],
            [
              126.1747587,
              37.7496858
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for asia/south-korea.110m.json
GeoJsonFeatureCollection get asiaSouthKorea110m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
