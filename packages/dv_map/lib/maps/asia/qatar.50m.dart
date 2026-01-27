// Generated from: assets/asia/qatar.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for asia/qatar.50m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Qatar",
        "iso_a2": "QA",
        "iso_a3": "QAT",
        "continent": "Asia"
      },
      "geometry": {
        "type": "Polygon",
        "coordinates": [
          [
            [
              51.2679688,
              24.6072266
            ],
            [
              51.3964844,
              24.6451172
            ],
            [
              51.4279297,
              24.6682617
            ],
            [
              51.5333984,
              24.8908691
            ],
            [
              51.5869141,
              24.9648438
            ],
            [
              51.6088867,
              25.0528809
            ],
            [
              51.6019531,
              25.1479492
            ],
            [
              51.5614258,
              25.2844727
            ],
            [
              51.5195312,
              25.3897461
            ],
            [
              51.5102539,
              25.4523437
            ],
            [
              51.4853516,
              25.524707
            ],
            [
              51.5269531,
              25.6821289
            ],
            [
              51.5722656,
              25.7810059
            ],
            [
              51.5430664,
              25.9023926
            ],
            [
              51.3890625,
              26.0111328
            ],
            [
              51.2623047,
              26.1532715
            ],
            [
              51.1081055,
              26.0805664
            ],
            [
              51.003125,
              25.9814453
            ],
            [
              50.9038086,
              25.7240723
            ],
            [
              50.8686523,
              25.6126953
            ],
            [
              50.8026367,
              25.4970703
            ],
            [
              50.7628906,
              25.4447266
            ],
            [
              50.7545898,
              25.3992676
            ],
            [
              50.7773438,
              25.1774414
            ],
            [
              50.8467773,
              24.8885742
            ],
            [
              50.8359375,
              24.8503906
            ],
            [
              50.8043945,
              24.7892578
            ],
            [
              50.8556641,
              24.6796387
            ],
            [
              50.9283203,
              24.5951172
            ],
            [
              50.9660156,
              24.5739258
            ],
            [
              51.0227539,
              24.5652344
            ],
            [
              51.0933594,
              24.5646484
            ],
            [
              51.1780273,
              24.5867188
            ],
            [
              51.2679688,
              24.6072266
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for asia/qatar.50m.json
GeoJsonFeatureCollection get asiaQatar50m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
