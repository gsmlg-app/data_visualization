// Generated from: assets/north-america/saint-vincent-and-the-grenadines.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'package:dv_geo_core/dv_geo_core.dart';

/// GeoJSON data for north-america/saint-vincent-and-the-grenadines.50m.json
const String _kGeoJson = '''{
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "properties": {
        "name": "Saint Vincent and the Grenadines",
        "iso_a2": "VC",
        "iso_a3": "VCT",
        "continent": "North America"
      },
      "geometry": {
        "type": "MultiPolygon",
        "coordinates": [
          [
            [
              [
                -61.1745117,
                13.1581055
              ],
              [
                -61.1345215,
                13.2028809
              ],
              [
                -61.1240234,
                13.294043
              ],
              [
                -61.1389648,
                13.3587402
              ],
              [
                -61.1821289,
                13.355957
              ],
              [
                -61.2240723,
                13.3306641
              ],
              [
                -61.268457,
                13.2876953
              ],
              [
                -61.2772949,
                13.2095703
              ],
              [
                -61.2039062,
                13.1422852
              ],
              [
                -61.1745117,
                13.1581055
              ]
            ]
          ],
          [
            [
              [
                -61.2262207,
                12.9946289
              ],
              [
                -61.2080566,
                13.024707
              ],
              [
                -61.19375,
                13.0382812
              ],
              [
                -61.1979492,
                13.0416992
              ],
              [
                -61.1993164,
                13.0451172
              ],
              [
                -61.1998047,
                13.0487305
              ],
              [
                -61.2011719,
                13.0525391
              ],
              [
                -61.2128418,
                13.0432617
              ],
              [
                -61.240625,
                13.0257324
              ],
              [
                -61.2490234,
                13.0178223
              ],
              [
                -61.2459473,
                13.0126953
              ],
              [
                -61.2392578,
                13.0053711
              ],
              [
                -61.2393555,
                12.9972656
              ],
              [
                -61.2620605,
                12.9927734
              ],
              [
                -61.2769531,
                12.9973633
              ],
              [
                -61.2769531,
                12.9898926
              ],
              [
                -61.265332,
                12.9901855
              ],
              [
                -61.2552246,
                12.9881836
              ],
              [
                -61.2472656,
                12.9836426
              ],
              [
                -61.2422363,
                12.9762695
              ],
              [
                -61.2347168,
                12.9836914
              ],
              [
                -61.2422363,
                12.9836914
              ],
              [
                -61.2262207,
                12.9946289
              ]
            ]
          ],
          [
            [
              [
                -61.334375,
                12.6952148
              ],
              [
                -61.3288086,
                12.701123
              ],
              [
                -61.3259277,
                12.7098633
              ],
              [
                -61.3201172,
                12.7155273
              ],
              [
                -61.3148437,
                12.7225586
              ],
              [
                -61.3167969,
                12.7316895
              ],
              [
                -61.319873,
                12.7354492
              ],
              [
                -61.3268066,
                12.7348145
              ],
              [
                -61.3358398,
                12.7288086
              ],
              [
                -61.3363281,
                12.719043
              ],
              [
                -61.3344238,
                12.7102051
              ],
              [
                -61.3397461,
                12.7036133
              ],
              [
                -61.351123,
                12.7011719
              ],
              [
                -61.3535156,
                12.6981445
              ],
              [
                -61.3445312,
                12.6947266
              ],
              [
                -61.334375,
                12.6952148
              ]
            ]
          ]
        ]
      }
    }
  ]
}
''';

/// Parses the GeoJSON for north-america/saint-vincent-and-the-grenadines.50m.json
GeoJsonFeatureCollection get northAmericaSaintVincentAndTheGrenadines50m {
  final data = parseGeoJson(
    jsonDecode(_kGeoJson) as Map<String, dynamic>,
  );
  if (data is GeoJsonFeatureCollection) return data;
  throw StateError('Invalid GeoJSON format');
}
