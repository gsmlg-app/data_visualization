// Generated from: assets/asia/siachen-glacier.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for asia/siachen-glacier.50m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Siachen Glacier",
        "iso_a2": "-99",
        "iso_a3": "-99",
        "continent": "Asia"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              77.0486328,
              35.1099121
            ],
            [
              77.1685547,
              35.1715332
            ],
            [
              77.2929688,
              35.2355469
            ],
            [
              77.4234375,
              35.3025879
            ],
            [
              77.571582,
              35.3787598
            ],
            [
              77.6969727,
              35.4432617
            ],
            [
              77.7994141,
              35.4958984
            ],
            [
              77.7240234,
              35.4805664
            ],
            [
              77.5725586,
              35.4718262
            ],
            [
              77.5200195,
              35.4734375
            ],
            [
              77.4464844,
              35.4755859
            ],
            [
              77.2948242,
              35.5081543
            ],
            [
              77.0900391,
              35.5520508
            ],
            [
              76.8789062,
              35.6132812
            ],
            [
              76.7668945,
              35.6617187
            ],
            [
              76.812793,
              35.5718262
            ],
            [
              76.8822266,
              35.4357422
            ],
            [
              76.9277344,
              35.3466309
            ],
            [
              76.9789063,
              35.2464355
            ],
            [
              77.0044922,
              35.1963379
            ],
            [
              77.0486328,
              35.1099121
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for asia/siachen-glacier.50m.json
GeoJsonFeatureCollection get asiaSiachenGlacier50m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
