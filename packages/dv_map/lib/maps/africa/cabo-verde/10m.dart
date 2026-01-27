// Generated from: assets/africa/cabo-verde.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:dv_geo_core/dv_geo_core.dart';
import 'package:dv_point/dv_point.dart';
import 'package:dv_map/src/map_widget.dart';

/// Gzipped GeoJSON data for africa/cabo-verde.10m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE7VdS4te17Gd969oNM491PuRWQjc2YWMMgkh6DpKEDiSUZSBCf7vlzqKc2N7Vxutz7JB6PTXvbR7n9r1XFX7n0/Pz68+fvvNm1e/fn71329ef/zHhze/ff/112+++vj2/btXv5qP//Lpy39/9evnPzw9Pz8///P+86c/eH/7/cE3H95/8+bDx7f3D33/7c/Pr969/tv9A799/b/vn3//5sOf//9nnp9fvf37+z+9lvvz3//k63p//Xc/+OCr9+8+vn335t3H+ew3f/nw9qvXr/716Xf/Xstf37z/25uPH7794Uq+X/r//OPrj29/9/7rb//6r1/339DvP/z57bvXH//j9/7033/+/cdPP31+fv4vsSvJVJ1/9ZMP2a4mKjH90Ud//PH3LsDcap1H4Goz9QaBNYM7FmAhdQGBrY23FZdbGaPArk4LcESYBQjs1cbyJYAtqe0M7FnujgKrmC0vz1qdUXF7acVGRWFfYI+Vy/E9ZldftkIrk9EDYhZcegaWCIJfnri5LsBszJqorijazgdpG6MHj8njiwCTGYdvO0EqoBhHuxL3AtxGCopxVFQuuBJhASrNKBXP7UCLpYEyEaVtvQibt5mAUhwV6YtMZHAEKBPRyrSptqZodMGAiX7ann7wTyL+gnS41lmQmkcLg1pL2jO8zsBKVglKvlKK0dkydLZpggpchVj79F78IlaiALdCpYVPku8XSSUrqFzUVJyXBRslwwsOq7MSGGDXRrWLlnvUSSgGWF0MPFOjSJUXYC1S1A+xMD8eD7+IMjnBnbCqFj6rrW6CvRCnSNPlPEdzoTbdhYIX/d3m4qiicAlRO9veltsLhFesuepZbUc1kFN4bS5kWbuDJsesqeK84tKiIhSYnaQWb1qootADnbE7vexdjmp5NYsv4KVLt1svjlMoiYI7IS2l27tLqSQYWKV0C2NNzQoFLqFc9rgnNECFgthJt4MXVvhWfLaz8qU8J73MI/MYM4xZ14iENK1eFhQlpxc+tozaGdq+AdZgOWmBAVa2gqzvAIebLI6ITtQA6S29bAKzo94a4OwmSA3o5cxacvZwmGE1MMBCejytAxzMDq+YanEiWUww/+ZnNkJSDQufBthGjDfgblQmXKS1thVHNGZ9B9iT/HygH9sKSfHFOR3gCkiD6+VqxrrssSphelYvN8qgs9fLeqtwdMEtx1SvX5NlCSxgmQVb9ybFpqwKA+f8vwB7G4Mq063ZluM8eVPM6dXLXXQL3di1u1AhjtSURdZcqBw0d14mfExl+cUxqg3DDXamY4TlF7cTmN3Ua7zEXPIEwnCINcCVdczH+iUSEjDwZE3jLBQinSKgtE2ewM6vTjQFDN30iuL0xaEQtxIsXtErOlXj7FBMKp1BxZa8+2xSptH4gksWBSQdqujxyElqL+6rsloI6Kgkt0ieV6wiTQJKcWq2HeP5WTFHYkn6Ae7qxVVRToWlLU2IbVnxnI5G99jU45gDHeBxvdA9HofiDKuS1iiss2d8CeCcAsuyEQ/JRCqdS00DTMFYHX22oowXO3qnxfGdYNHzeZY2VtRny/I8ZngGl4ux6uMs2CZru6hMD0VjuwyVXvSERGegPlu6teuyFZPxYHTFLxwPUbXAuBUDrLW5mSJFDQuFV3QueyxK1eiKQyMWFSQc0lj9cYC9vJbzQe4Mm/6I9C3ib03HVRDxMYvmF5d2BawpJpG/hKOZooKau11TcJoTLMX5QsRvkyGCd1ioFvv8UMSf6RO5LFmgEoVVUHXFsdrtF7WO2wwCt3gfiQp+TWwXhB6PJqZeKnOZSQZLW8hynqdCzFgpcXAnJFrKtTG8MViMd1+FwsJgjzsl+lhBm6oqR2Mkk5fPx0Pp1/SaQGABZsXF2ITcFmmTUMdq7RMjUJIsUsHlhJXmbmDXXsqf5SWw1mSnPMrxVILL4DJCZOzlHXVXAVcc1ilLdUfCGg0SQsb93cpGxYwxRvTyDpMV2FzhfGaoyDFjPMBaZHB60IuXumqzZGF8hjtRqn5MgEzNr5xRv21NGQ/ueDJoAla5Nj7zVOEVTspzyDljc29xCUaU0MtpU5oPCoW1ES1kwuYhGqIFx4pR5YumoHIFD96UkHmhgFkEoemPvd44OlNE0CS3ZVZvQhFNgYaO5vP7LuejvClBg2e2JR6HoOTpaALEbONVjiWlKFQbTxywhefEoh3wHnP1EuERO4uAqsLcPHtxg3gEBhW3z+cmPG1PDxMlWDKPivbBFB1rOx8ZpnfaNtPB18ITH5/lSFk8UOeUM2QjEyo3O1ok4KjipfypcleJv8CKH8nb8qjDJWRRyYZDep6NWJIbw2xHyQFcXXbsR3n03VV7LOpQpa3ROPbFFT/y7oRUcsn9qVjBelY42WUrST2wx8JDytwKPF6ClqSERwNtus1MH1ixRWyqQh119YQ6a6EHPKSMRYyZlvRqRRTKLRPzIbKfgafsqiiws+pSiBEPY1RViFqdQ6EHi9eTV1+Muph2oCQX0eGxn3GVCSTl/8wOi1QFLBMquTC1hIf5BAOn0pYa7xZC6yUyBYalwjMRFi7ExVFLBvuRnLsM338xSxxcjKb+xCh0KayyE8FpqZesB6u6opa/vf2YlpoigZBjnahjoCVlK2tweaPe/0vuIPNEhehWhMbitPHwfdAcD/sQ2ZcFq3ugNWb24UIs5/kRwiFbxeICsUkGGsOySp37RQfYJh8PAu9BGFsMjwjEZW7Z2HvJDbZ1DjDZpjC7jeAAQdjzmDt60OyzkPNGwCgFxxjcC67eHKBuVjgG++y4/Gl7ejBHIFeU8LnHPYaP742lWOSKrCRagJ0zMI70vWKrozKMUcBhWBQkV0x27cjZiIvTozCTLsP4y/CT5A9we2N1/wHuku3ldQUo+nIla/mRtxrD2UiHt0K04qhd4pJJIGClWLmGM1DH9rIBHrGA1JZcOcX9o02PcdIx/1GumoN+5GzEEIRMCFxvcU/madvhdoyHLlcNme0YBY1MGFGgK3bxc4/kAEcwQX6eXDXUvCNfPO7MBGMer0yTHvWi2ya+MiwBKlNYE/ZFinUaKsCt6GmBOmYJBjhSsAEeA+zexzgoHomNZTqQ7ezfPCjHzepx9HnjYnF3rNQkV6sELUqTKY2w+qNcbWmcJ2d6gEUM1RXtmX4kFMRF1YTVxuTqUDk3EcdFyUOCg4E7j5FbXOTTAwKq4xd3Qqf+C6qKNvdjNB8XcQfYWD6aoqWPIyjiItIUjOE+uu0u4CzAZIllQOWq0vClA6Srkg08HpVavcSaPQOgUBd2uAh5rKIP8KhN1OINjX3pkHqgdixXVm5Z8W4OQpVxThPsIhMzGgpLE4zLHXaeCXaf5xZ0wZGdizdIocJYUnxwk/nInR/NJuGFBh85rWLLikuIUZGIaYFdgo9h24ApW7kiws8dmnHRkLCwKR+z4nvK3C9v7iJL88hRnFiXq2Bp+/wg+ml7ejCit4uGFX/29GLGLBU4GGRaC3rxTYd4Feg0JU5ZWn0HuKkxb9ouLvI8NjPG9JKWoTNSJuPNR5ZgXGEZjY7DE4k8cu4Gt4Mw2pZdUqJ5NAwDzGpYGPvS8JUbeCbGYMBKznGsHN9bXI3OoVGpWILNYec01tY5M8HGDi7vLl0Di2LtUjfRXFZcFPCYJg22WqLYKAZNmV0m4h3L6QiRxnj8dplS+GJ8Q9uSwRFb96CUY+F4dGYySKye6WgleRwKFlcQcaADq7ScaonnvdUYs+r3XKnN0/PmLHQnNGmquGfgcf7R8cgatXTkxuXT+IFOMdbIpuPctbg8YFLMAPtSiI2hiT9yoGne0BnYkgvLjI8KUq1jJXaAyeB5VZa24uqEx6gUqxod+2diSNdt8PEQm5jlDFwSDpsPdtVj837MPD1jdOipTBS7ZNw9KeGBtTINi4vT65UoZdum8VY3/z9oPG1wxdw8c8wW5fbAiF3macJYtLG3JJZIs4vMqI8ZiBu4Ch1tTTNbYZOKmDGv4Fa8CNxRgh5p0jRZqnPeSrBvTJa9LrhK0AnUnx+HPW1PD1d5J1dYS970AXdhkunT9L8Bzz+KAtPGTPmkBBrNbzZxiizeKXkTNpLn5aLQA4H3AK8BC7sFFggNbC9jICbs5jCsweveYduS9A/E8zdw2bHrb/x/M8FM2WxFZS/Z/wcCi8l5t59z3hPF+gwdR4Ez6DixKq5wNoWloiJkDd4YpRMPsJy7bT8Fm+ZoLr34PPYxruhpz4bLFTbTbhfgMoVlolPj2NoRM81qRhb+8sdjmNwGFzbJ4kzwjCsV7pT+mRW3M8PlbjI6z0Ud4PLEy27TInOWiiIKQs9dU2cem0YGWDXhyibJkjyqafdPVAF16FJ+LHFitA7ykhWdKiyYWr11fPOSUCyN4kKtEkcXn81duU4nFwgsYot9riBpjEIrVyexLFF3TfMMRn+WGZ+fva2YPRybTTTA7LFQj7JMwaBCrq4J+85CkTMAHz51k/dbzGgGazZK2UgqXggF6QkL8YuwDHa4zz7cjQVnXGN0KvMADx3qbPdTlAwmbNTNTT0DkzpW0Jgdnsm+i2NVjd50NNSVmLvAFkelDaVVzOi63goa0QqzmT4/Fn3anh4uljZ32nGYUdymqMA0SLMlbTr2Vmco7n2f2RG3p9iAdQfNnJcZQHYWz+YH6mKtmbrkQVp0KEUgsM90gLMcNd+WCAQO514S/01zewy6x8kSx7a8R7ciizYS5mPANYOrlxWzNzam7Z4KwVsavYkFvLJvrgbyMWXnc1cZhUUU91SIrGUnqoQEo0D5RU58voVzgBlti5nJZupLJa8ySTBNMTPeinshCFY4OeY+zrS7zvO0/rhqkvNYym/m8xmfW5ompggGb1CaFfMwhhdPWtQw5uHscfB5GOesWAy86Oieozcck81Fp8a6ckaMx29azgd1KBZo3iNv5NysOb5/MKNsgq4iWYMKZ0MT/z3dG0tAmJWqmByPmjfnJZjPjmisNe+eSseLs5I9OUx0wSYVC0uhiKzQouZ0HfAmxjOHEL1hrJonBbflSyY5AQKn02qYcB00wDpli0UHeQtaF6sMaV5eno1ngAIXD3l9MSAzqB5UFVVzxfCiNSMT5ik00bA4F1sqxGipu9lsNdK48R93XlqOUzMn/phYHz55nxswPW1PDwZvM2I1+jyXIy9SH2ocaMxMzp3Kg1vDPgRxRZccZD5yvad/aiU5Zt4GeEqeqOs0U9aO/M4bGO2BvkOW7mMBK4eW3uBY1wFWOnNz86KOEPhIrdFbTnuXCsqu6rRepJjZDEvp3f7N0r2S0+eWYA/EeGR8JCrlxUot2PjOgc0J3hZgA1k/c+jIz+XofGQUxQD7DJBZgK0FG7B9z0uWXNQETwcKNmXzvsSQa1Fsc4sj6I8NcLsdk6Y501YM5NtNWKHLuLoBDpBTMQFWWx/bbQbXFbw0dGJNJj/m0XIuJSDGaiA+nS9L/niA4dGr98SbODejDbCUY0No/R5tcB4JPmJsmthwxLk1QpI2zebTAgfuscgQc5etMEO7NWdKmKsfKb+j2yLB8Vb3tSrnYsVtO2YQAIibnbmdO9zYzUCWZl3sPlOCZn9u8BH2I+N3cAscxzUDWaLoyH0Y3OmpR4HHVi6uIM6T9Etn0vgiEhTtgeZsp4PlHFLkRe4CRlezYhuf+pd3t3XI5ccswQAPpRrdihmkvAjbAxcF3xNY3Y6tcHmRlKD2WXnaoM/mjsjasZbKG1hrqRv3fILNc7mv+spa2jp6LCGaWpWu6IXX1ZxaWL/Irdlire5wcmGEsQGm0oV+1XOROAwczef7uh4qG93DK3WbmfMQ8BRhfKlJt8xERhA3pH2hU7b5yAwIbGqbTMx4LDSo4fFzllbm7kSbccfh9qVndjSQFRx6fH6u5ml7erjq7y3hW5+tmDLGAbdrTKTunGpD2zWC5iblrY+wy9AmN6/OWMo2Me4C2lLpOadmW7E72oDls6ZlvdwNjlGGROLLyWfmQpgomt5aUDizsmMju1WLopW0F4HTEm5/Wvchg9PRJvt0i/Od5cN1mxIbKJtp1XS8I27IbtKGXSM9wPPel8KfmgRKdZlOmFhGLzwGTBJ8vB3lpowno+ndKBdbNOFDexylRboIsd8XToHA7ZrHMaIjx6Qgt3L2OPqcVJgVz7VpYCY257qGhU6UnsZoEXSaBWrhYM+sPvAq0J85ea1wcfVzFfFuEp5+/Lfvnr7/849P3z39H18pTBulmQAA';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for africa/cabo-verde.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get africaCaboVerde10m {
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

/// Widget for rendering the africa/cabo-verde.10m.json map.
///
/// This widget provides a convenient way to render this specific map
/// with customizable projection and styling.
///
/// Example:
/// ```dart
/// CaboVerde10mWidget(
///   projection: MercatorProjection(),
///   fillColor: Color(0xFFE0E0E0),
///   strokeColor: Color(0xFF333333),
///   onFeatureTap: (feature, position) {
///     print('Tapped: ${feature.properties}');
///   },
/// )
/// ```
class CaboVerde10mWidget extends StatelessWidget {
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

  /// Creates a CaboVerde10mWidget.
  const CaboVerde10mWidget({
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
      geoJson: africaCaboVerde10m,
      projection: projection,
      fillColor: fillColor,
      strokeColor: strokeColor,
      strokeWidth: strokeWidth,
      onFeatureTap: onFeatureTap,
      antiAlias: antiAlias,
    );
  }
}
