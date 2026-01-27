// Generated from: assets/oceania/norfolk-island.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for oceania/norfolk-island.50m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Norfolk Island",
        "iso_a2": "NF",
        "iso_a3": "NFK",
        "continent": "Oceania"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              167.9394531,
              -29.0176758
            ],
            [
              167.9206055,
              -29.0139648
            ],
            [
              167.9061523,
              -29.028125
            ],
            [
              167.9185547,
              -29.0250977
            ],
            [
              167.9246094,
              -29.0285156
            ],
            [
              167.9240234,
              -29.0358398
            ],
            [
              167.9164063,
              -29.0451172
            ],
            [
              167.9124023,
              -29.052832
            ],
            [
              167.9142578,
              -29.0619141
            ],
            [
              167.9182617,
              -29.071875
            ],
            [
              167.9204102,
              -29.0828125
            ],
            [
              167.9265625,
              -29.0828125
            ],
            [
              167.9337891,
              -29.072168
            ],
            [
              167.9444336,
              -29.0729492
            ],
            [
              167.9546875,
              -29.0821289
            ],
            [
              167.9607422,
              -29.0962891
            ],
            [
              167.9606445,
              -29.0921875
            ],
            [
              167.9619141,
              -29.0884766
            ],
            [
              167.9641602,
              -29.0853516
            ],
            [
              167.9676758,
              -29.0828125
            ],
            [
              167.9790039,
              -29.0756836
            ],
            [
              167.9886719,
              -29.0589844
            ],
            [
              167.9904297,
              -29.0420898
            ],
            [
              167.978125,
              -29.0342773
            ],
            [
              167.9597656,
              -29.0283203
            ],
            [
              167.9394531,
              -29.0176758
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for oceania/norfolk-island.50m.json
GeoJsonFeatureCollection get oceaniaNorfolkIsland50m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
