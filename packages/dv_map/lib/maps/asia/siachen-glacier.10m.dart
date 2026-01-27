// Generated from: assets/asia/siachen-glacier.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for asia/siachen-glacier.10m.json
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
              77.048971,
              35.110442
            ],
            [
              77.4246587,
              35.3029238
            ],
            [
              77.8003463,
              35.4954056
            ],
            [
              77.7735779,
              35.4989713
            ],
            [
              77.7603488,
              35.4980928
            ],
            [
              77.7474296,
              35.4943204
            ],
            [
              77.7167338,
              35.4754068
            ],
            [
              77.6896554,
              35.4626944
            ],
            [
              77.6606132,
              35.4580952
            ],
            [
              77.5196082,
              35.4774392
            ],
            [
              77.5121985,
              35.4784557
            ],
            [
              77.4764384,
              35.4771638
            ],
            [
              77.4127731,
              35.4694123
            ],
            [
              77.3837309,
              35.4719962
            ],
            [
              77.3520016,
              35.4860521
            ],
            [
              77.3053894,
              35.5178332
            ],
            [
              77.2811015,
              35.5280134
            ],
            [
              77.2508191,
              35.5307006
            ],
            [
              77.177542,
              35.5231558
            ],
            [
              77.1412651,
              35.5253779
            ],
            [
              77.1052983,
              35.537987
            ],
            [
              77.0922758,
              35.5478055
            ],
            [
              77.0710885,
              35.5710082
            ],
            [
              77.0581694,
              35.5801033
            ],
            [
              77.0390491,
              35.5850125
            ],
            [
              77.0175517,
              35.5845991
            ],
            [
              76.9764173,
              35.5786563
            ],
            [
              76.9357996,
              35.5796382
            ],
            [
              76.9150257,
              35.5831522
            ],
            [
              76.8964222,
              35.5896117
            ],
            [
              76.8805058,
              35.6006705
            ],
            [
              76.8569414,
              35.6285757
            ],
            [
              76.8429887,
              35.6412881
            ],
            [
              76.8245919,
              35.6477994
            ],
            [
              76.7828374,
              35.6457323
            ],
            [
              76.7773507,
              35.6461117
            ],
            [
              76.9131609,
              35.3782769
            ],
            [
              77.048971,
              35.110442
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for asia/siachen-glacier.10m.json
GeoJsonFeatureCollection get asiaSiachenGlacier10m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
