// Generated from: assets/africa/kenya.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for africa/kenya.110m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Kenya",
        "iso_a2": "KE",
        "iso_a3": "KEN",
        "continent": "Africa"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              39.20222,
              -4.67677
            ],
            [
              39.60489,
              -4.34653
            ],
            [
              39.80006,
              -3.68116
            ],
            [
              40.12119,
              -3.27768
            ],
            [
              40.26304,
              -2.57309
            ],
            [
              40.63785,
              -2.49979
            ],
            [
              40.88477,
              -2.08255
            ],
            [
              41.58513,
              -1.68325
            ],
            [
              40.993,
              -0.85829
            ],
            [
              40.98105,
              2.78452
            ],
            [
              41.8550831,
              3.9189119
            ],
            [
              41.1718,
              3.91909
            ],
            [
              40.76848,
              4.25702
            ],
            [
              39.85494,
              3.83879
            ],
            [
              39.5593843,
              3.42206
            ],
            [
              38.89251,
              3.50074
            ],
            [
              38.67114,
              3.61607
            ],
            [
              38.43697,
              3.58851
            ],
            [
              38.120915,
              3.598605
            ],
            [
              36.8550932,
              4.4478641
            ],
            [
              36.1590786,
              4.4478641
            ],
            [
              35.8174477,
              4.7769657
            ],
            [
              35.8174477,
              5.3382321
            ],
            [
              35.2980071,
              5.506
            ],
            [
              34.6201963,
              4.8471227
            ],
            [
              34.005,
              4.2498849
            ],
            [
              34.47913,
              3.5556
            ],
            [
              34.59607,
              3.05374
            ],
            [
              35.03599,
              1.90584
            ],
            [
              34.6721,
              1.17694
            ],
            [
              34.18,
              0.515
            ],
            [
              33.893569,
              0.1098135
            ],
            [
              33.9037112,
              -0.95
            ],
            [
              34.07262,
              -1.05982
            ],
            [
              37.69869,
              -3.09699
            ],
            [
              37.7669,
              -3.67712
            ],
            [
              39.20222,
              -4.67677
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for africa/kenya.110m.json
GeoJsonFeatureCollection get africaKenya110m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
