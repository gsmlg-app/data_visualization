// Generated from: assets/asia/northern-cyprus.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for asia/northern-cyprus.50m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Northern Cyprus",
        "iso_a2": "-99",
        "iso_a3": "-99",
        "continent": "Asia"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              34.0044922,
              35.0652344
            ],
            [
              33.93125,
              35.1403809
            ],
            [
              33.9079102,
              35.2023926
            ],
            [
              33.9419922,
              35.292041
            ],
            [
              34.4631836,
              35.5935059
            ],
            [
              34.5560547,
              35.6620605
            ],
            [
              34.4111328,
              35.6292969
            ],
            [
              34.2723633,
              35.5699707
            ],
            [
              34.1924805,
              35.5457031
            ],
            [
              34.0634766,
              35.4739746
            ],
            [
              33.6076172,
              35.3541504
            ],
            [
              33.4587891,
              35.3358887
            ],
            [
              33.3078125,
              35.3415039
            ],
            [
              33.1234375,
              35.3582031
            ],
            [
              32.9416016,
              35.3904297
            ],
            [
              32.9263672,
              35.2780762
            ],
            [
              32.8798828,
              35.1805664
            ],
            [
              32.7723633,
              35.1595703
            ],
            [
              32.7126953,
              35.1710449
            ],
            [
              32.7202148,
              35.1453613
            ],
            [
              32.784082,
              35.1157715
            ],
            [
              32.8694336,
              35.0894043
            ],
            [
              32.9195313,
              35.0878418
            ],
            [
              32.9859375,
              35.1164062
            ],
            [
              33.0775391,
              35.1461914
            ],
            [
              33.1910156,
              35.1731445
            ],
            [
              33.2483398,
              35.1569336
            ],
            [
              33.3255859,
              35.1536133
            ],
            [
              33.3837891,
              35.1626953
            ],
            [
              33.4242188,
              35.140918
            ],
            [
              33.455957,
              35.101416
            ],
            [
              33.4638672,
              35.0049316
            ],
            [
              33.4757813,
              35.0003418
            ],
            [
              33.5256836,
              35.0386719
            ],
            [
              33.6144531,
              35.0227539
            ],
            [
              33.6753906,
              35.0178711
            ],
            [
              33.7257813,
              35.0373047
            ],
            [
              33.7569336,
              35.0397461
            ],
            [
              33.7922852,
              35.0481934
            ],
            [
              33.8320312,
              35.0671875
            ],
            [
              33.8664063,
              35.0936035
            ],
            [
              33.9033203,
              35.0854492
            ],
            [
              33.9657227,
              35.0567871
            ],
            [
              34.0044922,
              35.0652344
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for asia/northern-cyprus.50m.json
GeoJsonFeatureCollection get asiaNorthernCyprus50m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
