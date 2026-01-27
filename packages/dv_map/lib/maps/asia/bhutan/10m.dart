// Generated from: assets/asia/bhutan.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:dv_geo_core/dv_geo_core.dart';
import 'package:dv_point/dv_point.dart';
import 'package:dv_map/src/map_widget.dart';

/// Gzipped GeoJSON data for asia/bhutan.10m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE61dTY9dxRHd+1eMZo1a9f3BLomUZZRFdhGKLDIhlmAGmWGBEP89qmtAgOsFnSe8sMbzZo5u366urjp1qvz9m4eHx9fvvn56/PTh8a9Pb1+/ff/0l5cvv3z6/PXdy/PjJ/Pxfz58+5vHTx/++ebh4eHh++vvj3/x+vHrg6/fv3z99P713fVLP/34w8Pj89uvrl/483+/fX37/PPPPzw8vvvm5V9v5frsHx99Xz98/2+//ODzl+fXd89Pz6/z2Z++eff28cfPfvj5Kb54evnq6fX9d79+hp8e+u8vX373xcvzrzFf3v/73fPb118s9sOfX3792389PDQdSxfl+OQ3n0gdSlEz/9UHn33yu3jlEW0LHouFp4F4zi5d2/Oxm1QEimcl3L3ipWclihfZKbnhNTkRo3idQbw9nxBpBrofXpnivuGpSmf9Ye9PLCxCUTxyE5EVr9MLtj8PMuINrySy0fUah6ut7+8uPK1oct3wutkIXa+6dm3H7U44aacVzj3b0dVKsyWtuxusjh4OCS6yFe6u1d7GU3V11FeJuDdtvkC9tKtBPO4W1833qZWLoMvlDKFan0/cMlFfyq4cuuMJF/z+WPTGWbtrOyipYjVmNRclCK/6dJOtnlSFQhTa3YFL9tbNU+lYJXZzDJ6Ly/72qMSwm3fwOHjzU8oexAKiVbGy7X4v57lRvNTgG6sl74buocELac7Vz7dnK/r2yo2kV1dVKRFQnDF4Ok+4+YK5hRi2vpJOW/dXvNkN8vTVJzvIar/HiavR/c2i8v2elMpAl5upIbS+PpZMR8053cvWKLdME346zuI1aOFoKkGNxTuLc3086yLYFXi27W+PzUKxIGjwgq1qDcLVwmDP7OykXFsSU9xk0MVWfaxdbXXNFEWkMF662ur8KFgV3g/zKsp1vZbZhVqzmbn5ul5lLoPxhLkW+8vTbSlYEnPh0ZjtH4fHqVvgkqerAgs0qo8msfLHry9PU6ujp1c1SOzj05ZncgfcV0m31ZKS5ykzMUOfT7ySY3t7Jemu8POJtdDHpyPPGDkL6l2Ew3tJOvJkMhuj1sJdQrriKXkx6u0nfpLVXCI8KlDzY0n1xZvmCUmphp9viBpb8djKGfV+zG1LijpwJYQlbQNH7eHbdoSIeKGRH5NXrMctRNoFjcOZRJ3X9YoGE2rO1OxK+/Z6BZZED14YycKozX54G8bgDJ5T++pMg0qKUfdC2lGyuQNvU8LXq6q5uhfPaizpHTgO0dyW6+nwzUskyZstD43VuK2QdcS6VutIwva2TrfklqPmcU3rxPaiTmdp+PrylKTALGvwpN23s+ac4Y3juVCvz0dRWth+1OkisnU/rLMLDHQHTzri4yx18CSU4eeLEFoC5zyWRYrbi6dbb/ZiHq1gVj54TL5kvXlMlc1gvDDi9bxpSwsY2M9+MOcSOOdRt1DDrt45b0m8MHR5VKkCzKLHnrl1Mz9l0QIjydkOKlqS/DwqJYIRnIPHvpSe7l1stcwvrqt1N0WdVZXF6vukQs3RxVYGs2/LlSIrME2oU8EmtW2uJGmCJESdIubUzbeIh4mjZy2neiPr+zOqJHS96aZu29kQliCF8bRM17iUs7MaNZdUoojN/PhDhATjDW+77S9bdQp6d6SJp2z7yyap8F1e5LKaM7OSgFlgTe4YuhQ+81BngYFVnTIqWpPeyaAt4dNmHrzwkXnI2gPkr2/jxVAabVht5/fwSht+f87Ji/eL0+amIOUy3iqZlzp5zJ0sBvLh45zDdInUYmLMTng/miI2CizmjqeGzbmHWFm86ayXIwS+KiV6CXRnO9rY4cBF3GhJ2uK09qSHOJ7SkmTFaWlFk9Q6raLb5RaneeI0+PlMcqGsBk6TEg+EzG2p7gyehMBw4cXL1TZwbgHyr1cao7IfXuEEM/KJSiNYP77ZBk7SYQaHhP3G2WCJhOl1MqtcsoQ41ckwP0dB0bLCFVswTECkqS6EVZzyO4onU8zd+LQ4pRMGwbvR4bTUsuKUsDEYNg99OLTtZszFOscGxSuL/eYoJg/08YSlZLPlYiWcHJ5YVmM1Fu5EGYgh10eU8nEYNLsRWXCpSELabXMFpaEG01/DNXdvZ3ei6RaUPZxcKhaNy+BZJ2zNSsSxZPgXnhEY1ffREYDldhGVDweBwkVVL2TzbMew+HBlkVK11u1lNYJrMWZSzdv2ZicJSDD1B3nf9nQ0bwIFs3BaPUHOjQe/PK8YnmHDK8OJ5mBWX13BUJEBklWDp5ZrzJdWbrDExTudlqpsnBQaJ4E+3xRlY8VjEYHJ65BSWsjNC88VxwsV7c3VjyKW4DpW1OgM1v0V82TUNadW6kKWxknSuURRPLeINSVKoilso3hBUqtvSSIugiVgRJTraZuyxR1wNtXXBS+68w6FFWvEomwevGCDb/LiHKnXjicEh5ElQlstZt4fE2wtdakF19NLGQnfHJcaeintzOlVZ1jDNHhrVJrsUfDFW5ISCzk8eNkEiyqGrsr1aksR8zuWu+vxBm9ku7CeUa1jd1bKbpju/8JrWhRMF9zUQ1E4Gx+yvz4rgZOichqJ34qno3uG8Srphq8XclhxVN6rxmXwuAqODapI6oY5hzicxlSTbXTp4E1LD/p8zTLR0P58ySB/01dhNpZiwmV/5XAbC02Uu4d+Nn4bhGNJ7n07nLWx7biU9SK0dMXESJhABdgl/E/bra9UyAtudGAavnRNikbZCbeJTJ/ITmm4FP54MQLwlTFw9sYUPYM3qeO6G+VJgfcAEVWuXH1FSWH81+CxySYHHcJqCCG070SlPHXlIJrCscLs4FnVGrjUiBnQ3dWSkDWNqeZsTD73fzogr8NhgnfwVebOMGURJUZHNk18MnfbmlbmFJ9AvDaznd7MrIrGrI8PUWovfTGzXgEbEwaOJW/cbGVqhW0HHxrd/5plFZkH2FDJI8frG4zLiK8Va4DkuTpG5briUTVGgA1eF9ei3hw8vKGXj6jYnkS3c2BJ78AF99bTNtbXpKCv5yMZRCv3n2kE8oeD1+G5VPEvPG+sFNN8lFV4J4WyIrEsdfBGZbBngcMJYaqPwTO/wVm1BepM+Wp0rEVQNtYXHGA7L4+0nmJR/g8dbhFgu/bgFW/txkMPD+WCehetMl/axiY0KAPrns3HKFR3vGgXxUINns4JrtWcK9lBWcDgBU1z0f58KKU7eOkUK0lS4Q72JgxemeUimrkiycSq7s1n+NL99BZNBgbjCYX57k3TQQ5s8LTVbzDiVQo2RPNImKdetK2XicFq0eC1Ji/61wsvA6MNmk/o3DprLNTV5eh6wzVjpzU6G8yz+EyFRHUNTWlCFzQ2GKpmrwVycGOKsoGbFuG90uvqhBUAmodCZFnkpfc6vzJtvVELxFdb1s43Sm2WhklmBs+n1rufjXKGXWmFkq+qivsCycqKWJpIL+MjBidz8Cisepfg1Civ4cilyqttXe8l90V9aaURrRqcsukTgZ+v3W+RGnedjtt4d2T5g6d8wzcXq8O+dBqLF73lwDkXVukdOPGolf8fw0xCl9uethaiy22aUlC4dKrdmmdqDTbPoOWQevmaF5VbgfrSwUtJ3wO1ygzQW8mhYX6WrrFLAuZJ2GkbPO1dl9KaKqC3kkMRvfKvd8hVfwcOVdMOnHXS2sdCEiXY+IGxvu7qVTycDNaKBm0GIKzt1UxGCrLNF17TohHKM7kSfhN1Uy5HY4Tmw2ShOWW3V+xCeK/p7kM3l6R7CTNG+C9BmKLswvPc6uSDF8yYJOrCK8slyL0aEywxCdPgCVsvgUYebp66I4yXlMtFPnhdChKIg9cda9OTUBnYB3S5Zp2N3PAkh0KE8WKRLeQRDUusMWHQnEJXXyDOBtbJL8c80ee2GzK1J7DYMXjXfbPhtSg4m+PCs9pbApVMBDcWnRF5C5xZJDqP7XZcMB2QYgpWAvl0qFKsHZBRzTBB0jPNaO3+Np/uVzhq9vDc31+EKEyo1bRDL4Ta4E1UikbNmdPQu3a4eswcFRRP5iLfnIt5t2EisB/xtrh01ksEjpq5KANr2a5yi8qAk94oEll9n6WUYTqIiyBJrbVHcy4ix1RHg2e80X3Tv2x9x3JVar05nDkc5m+CzFbX5ypsmHL9Yr98RpFteBYKTka42Dkd0daCF9zJcIrl2bXOcQnPxrk5iaiF28yRfBgYBc3WWntujjRnjiymBr3wPGNtJc9LCgfjkauu/Y/FFOAkiNmMiOma3PCEwZFdF9x0y262XM4Kdo9eu1uqC/sweBINFyZCk7dphXlmYC04/fByLKNNWIcSdQrMvIbPNIp1pBNHgu2K/4e4zum3S4NTwBBOWWf0tNMdu0szFWaHa0m4DOhZIWsvdMcMhIXrEjNtZE0BO1odzlCt0zYucgaAGRWmzf1QFutNgXPhacBRi1nc6E3vCgV7qAZPY1SVK15r4mXKS7O4Oas7BrJdVWi2rfl7BtCRB8y9KvUILjc8n/FH6H5IE8c6sJAa7pG7VBCdtA0bpZQKkIzkGb3Nts5npGQDZ6TzEaHgJc4YOKuE8bgtNi5y8MgLl7jkdO6sy/V5QBhPdWsfrUNsDPYBDRx36HoVDbdZMD0389NW13fXUaMW93WGS480F05Qybk32xvXLMMronhUZWuQ2xGJskE0Cf40b6yuT6jBBJBOB3kuZZ379oNmRKRv2txxfRJgFYtGCD8d8hucGQk8wT1rhPA3Ro2ONaN47jNvdz27zmDbyeBJVC9ZxzVaNRokS+nENDqsk1BnZA3W2T9wV7C4XxykAsq16ITzKAnW54sxQBRvug8WNvK6iTpAOuP67yu0l0kG97l6GkGK5JIFzvZ6KWwuzkSx0DfX1cYEC/WtxbdA8sIzxvGw/47lzfb1T1/98Oanvz9788Ob/wHyVQUUMmcAAA==';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for asia/bhutan.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get asiaBhutan10m {
  if (_cached != null) return _cached!;

  // Decode base64 and decompress
  final compressed = base64Decode(_kCompressedData);
  final decompressed = gzip.decode(compressed);
  final jsonString = utf8.decode(decompressed);

  // Parse GeoJSON
  final data = parseGeoJson(
    jsonDecode(jsonString) as Map<String, dynamic>,
  );

  if (data is! GeoJsonFeatureCollection) {
    throw StateError('Invalid GeoJSON format');
  }

  _cached = data;
  return _cached!;
}

/// Widget for rendering the asia/bhutan.10m.json map.
///
/// This widget provides a convenient way to render this specific map
/// with customizable projection and styling.
///
/// Example:
/// ```dart
/// Bhutan10mWidget(
///   projection: MercatorProjection(),
///   fillColor: Color(0xFFE0E0E0),
///   strokeColor: Color(0xFF333333),
///   onFeatureTap: (feature, position) {
///     print('Tapped: ${feature.properties}');
///   },
/// )
/// ```
class Bhutan10mWidget extends StatelessWidget {
  /// The projection to use for rendering.
  final Projection projection;

  /// The color to use for filling shapes.
  final Color? fillColor;

  /// The color to use for stroking shapes.
  final Color? strokeColor;

  /// The stroke width for shape outlines.
  final double strokeWidth;

  /// Optional callback when a feature is tapped.
  final void Function(GeoJsonFeature feature, Point position)? onFeatureTap;

  /// Whether to enable anti-aliasing.
  final bool antiAlias;

  /// Creates a Bhutan10mWidget.
  const Bhutan10mWidget({
    super.key,
    required this.projection,
    this.fillColor,
    this.strokeColor,
    this.strokeWidth = 1.0,
    this.onFeatureTap,
    this.antiAlias = true,
  });

  @override
  Widget build(BuildContext context) {
    return MapWidget(
      geoJson: asiaBhutan10m,
      projection: projection,
      fillColor: fillColor,
      strokeColor: strokeColor,
      strokeWidth: strokeWidth,
      onFeatureTap: onFeatureTap,
      antiAlias: antiAlias,
    );
  }
}
