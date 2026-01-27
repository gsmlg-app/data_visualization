// Generated from: assets/europe/bulgaria.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for europe/bulgaria.110m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Bulgaria",
        "iso_a2": "BG",
        "iso_a3": "BGR",
        "continent": "Europe"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              22.6571497,
              44.234923
            ],
            [
              22.4104464,
              44.0080635
            ],
            [
              22.5001567,
              43.6428144
            ],
            [
              22.9860185,
              43.2111612
            ],
            [
              22.6048015,
              42.8985188
            ],
            [
              22.4365947,
              42.5803212
            ],
            [
              22.5450118,
              42.461362
            ],
            [
              22.3805258,
              42.3202595
            ],
            [
              22.8813737,
              41.9992972
            ],
            [
              22.9523772,
              41.3379939
            ],
            [
              23.6920736,
              41.3090809
            ],
            [
              24.4926449,
              41.5838962
            ],
            [
              25.1972014,
              41.234486
            ],
            [
              26.1061381,
              41.3288988
            ],
            [
              26.1170419,
              41.8269046
            ],
            [
              27.1357394,
              42.1414849
            ],
            [
              27.9967204,
              42.0073587
            ],
            [
              27.6738977,
              42.5778924
            ],
            [
              28.0390951,
              43.2931717
            ],
            [
              28.5580815,
              43.7074617
            ],
            [
              27.970107,
              43.8124682
            ],
            [
              27.2423995,
              44.175986
            ],
            [
              26.0651587,
              43.9434938
            ],
            [
              25.5692717,
              43.6884447
            ],
            [
              24.1006792,
              43.7410513
            ],
            [
              23.3323023,
              43.8970108
            ],
            [
              22.9448324,
              43.8237853
            ],
            [
              22.6571497,
              44.234923
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for europe/bulgaria.110m.json
GeoJsonFeatureCollection get europeBulgaria110m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
