// Generated from: assets/seven-seas-open-ocean/mauritius.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for seven-seas-open-ocean/mauritius.50m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Mauritius",
        "iso_a2": "MU",
        "iso_a3": "MUS",
        "continent": "Seven seas (open ocean)"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              57.6512695,
              -20.4848633
            ],
            [
              57.7066406,
              -20.4348633
            ],
            [
              57.725,
              -20.3688477
            ],
            [
              57.7806641,
              -20.3269531
            ],
            [
              57.7919922,
              -20.2125977
            ],
            [
              57.737207,
              -20.0984375
            ],
            [
              57.656543,
              -19.9899414
            ],
            [
              57.5757813,
              -19.997168
            ],
            [
              57.5150391,
              -20.055957
            ],
            [
              57.4864258,
              -20.1439453
            ],
            [
              57.4160156,
              -20.1837891
            ],
            [
              57.3857422,
              -20.2286133
            ],
            [
              57.3621094,
              -20.3375977
            ],
            [
              57.3651367,
              -20.4064453
            ],
            [
              57.3176758,
              -20.4276367
            ],
            [
              57.3283203,
              -20.45
            ],
            [
              57.3833008,
              -20.5037109
            ],
            [
              57.5248047,
              -20.5131836
            ],
            [
              57.6512695,
              -20.4848633
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for seven-seas-open-ocean/mauritius.50m.json
GeoJsonFeatureCollection get sevenSeasOpenOceanMauritius50m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
