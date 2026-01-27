// Generated from: assets/asia/armenia.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for asia/armenia.110m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Armenia",
        "iso_a2": "AM",
        "iso_a3": "ARM",
        "continent": "Asia"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              46.5057198,
              38.7706054
            ],
            [
              46.483499,
              39.4641548
            ],
            [
              46.0345341,
              39.6280207
            ],
            [
              45.6100122,
              39.8999938
            ],
            [
              45.8919072,
              40.2184757
            ],
            [
              45.3591748,
              40.5615038
            ],
            [
              45.5603512,
              40.8122895
            ],
            [
              45.1794959,
              40.9853539
            ],
            [
              44.9724801,
              41.2481286
            ],
            [
              43.5827458,
              41.0921433
            ],
            [
              43.7526579,
              40.7402009
            ],
            [
              43.6564364,
              40.253564
            ],
            [
              44.4000086,
              40.0050003
            ],
            [
              44.7939897,
              39.7130026
            ],
            [
              45.0019873,
              39.7400036
            ],
            [
              45.298145,
              39.4717512
            ],
            [
              45.7399785,
              39.4739991
            ],
            [
              45.7353793,
              39.3197191
            ],
            [
              46.1436231,
              38.7412015
            ],
            [
              46.5057198,
              38.7706054
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for asia/armenia.110m.json
GeoJsonFeatureCollection get asiaArmenia110m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
