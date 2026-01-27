// Generated from: assets/africa/eswatini.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for africa/eswatini.50m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "eSwatini",
        "iso_a2": "SZ",
        "iso_a3": "SWZ",
        "continent": "Africa"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              31.9482422,
              -25.9576172
            ],
            [
              31.9216797,
              -25.96875
            ],
            [
              31.8714844,
              -25.9816406
            ],
            [
              31.6404297,
              -25.8672852
            ],
            [
              31.4151367,
              -25.746582
            ],
            [
              31.3826172,
              -25.7429688
            ],
            [
              31.3351563,
              -25.7555664
            ],
            [
              31.2073242,
              -25.8433594
            ],
            [
              31.0880859,
              -25.9806641
            ],
            [
              31.0333008,
              -26.0977539
            ],
            [
              30.9452148,
              -26.21875
            ],
            [
              30.8033203,
              -26.4134766
            ],
            [
              30.7890625,
              -26.4554688
            ],
            [
              30.7875,
              -26.6136719
            ],
            [
              30.7943359,
              -26.7642578
            ],
            [
              30.8067383,
              -26.7852539
            ],
            [
              30.8833008,
              -26.7923828
            ],
            [
              30.9380859,
              -26.9158203
            ],
            [
              31.0633789,
              -27.1123047
            ],
            [
              31.2740234,
              -27.2383789
            ],
            [
              31.4695313,
              -27.2955078
            ],
            [
              31.7425781,
              -27.3099609
            ],
            [
              31.9583984,
              -27.3058594
            ],
            [
              31.9460938,
              -27.1736328
            ],
            [
              31.9671875,
              -26.9606445
            ],
            [
              31.9947266,
              -26.8174805
            ],
            [
              32.0248047,
              -26.8111328
            ],
            [
              32.0816406,
              -26.8248047
            ],
            [
              32.1128906,
              -26.8394531
            ],
            [
              32.105957,
              -26.5200195
            ],
            [
              32.0779297,
              -26.4498047
            ],
            [
              32.0483398,
              -26.347168
            ],
            [
              32.0414063,
              -26.28125
            ],
            [
              32.0599609,
              -26.2150391
            ],
            [
              32.0688477,
              -26.1101563
            ],
            [
              32.0605469,
              -26.0183594
            ],
            [
              31.968457,
              -25.9722656
            ],
            [
              31.9482422,
              -25.9576172
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for africa/eswatini.50m.json
GeoJsonFeatureCollection get africaEswatini50m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
