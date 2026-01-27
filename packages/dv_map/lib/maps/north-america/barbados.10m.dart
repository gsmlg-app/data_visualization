// Generated from: assets/north-america/barbados.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for north-america/barbados.10m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Barbados",
        "iso_a2": "BB",
        "iso_a3": "BRB",
        "continent": "North America"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              -59.42691,
              13.1603865
            ],
            [
              -59.4386287,
              13.1748721
            ],
            [
              -59.457102,
              13.1831729
            ],
            [
              -59.476674,
              13.1893985
            ],
            [
              -59.4918107,
              13.1979434
            ],
            [
              -59.5180558,
              13.2175154
            ],
            [
              -59.5366105,
              13.2313907
            ],
            [
              -59.5497941,
              13.2491723
            ],
            [
              -59.5689591,
              13.2896589
            ],
            [
              -59.5759171,
              13.3043887
            ],
            [
              -59.5807186,
              13.3145206
            ],
            [
              -59.5944718,
              13.3347842
            ],
            [
              -59.6128637,
              13.3445499
            ],
            [
              -59.6309301,
              13.3379581
            ],
            [
              -59.645131,
              13.3237165
            ],
            [
              -59.6522111,
              13.3106143
            ],
            [
              -59.6542049,
              13.2951114
            ],
            [
              -59.6460669,
              13.1603865
            ],
            [
              -59.6331274,
              13.1159122
            ],
            [
              -59.6215714,
              13.0939802
            ],
            [
              -59.6081437,
              13.0846622
            ],
            [
              -59.6002498,
              13.0841332
            ],
            [
              -59.5869034,
              13.0831973
            ],
            [
              -59.5644425,
              13.0780297
            ],
            [
              -59.5459692,
              13.0676944
            ],
            [
              -59.5361222,
              13.0511742
            ],
            [
              -59.5292863,
              13.055406
            ],
            [
              -59.5231014,
              13.0564639
            ],
            [
              -59.516713,
              13.0563826
            ],
            [
              -59.5088598,
              13.0573184
            ],
            [
              -59.4875382,
              13.0785587
            ],
            [
              -59.4757788,
              13.0864932
            ],
            [
              -59.4557186,
              13.100043
            ],
            [
              -59.4300431,
              13.1259219
            ],
            [
              -59.42691,
              13.1603865
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for north-america/barbados.10m.json
GeoJsonFeatureCollection get northAmericaBarbados10m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
