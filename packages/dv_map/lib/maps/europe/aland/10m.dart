// Generated from: assets/europe/aland.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:dv_geo_core/dv_geo_core.dart';
import 'package:dv_point/dv_point.dart';
import 'package:dv_map/src/map_widget.dart';

/// Gzipped GeoJSON data for europe/aland.10m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE7VdS4udxxHdz68YtA6i3o/sQkhWCWQZCCGIRAkCRTLKeGGC/3uontjY8lfX6FyPF8Kjkc60+lZXVVedOv3fh8fHV0/ffPX21a8fX/3+7Zunrz+9/e3H9+/f/v3p3ccPr3413/7n82//59WvH//y8Pj4+Pjf8+tP/+L54+cbX336+NXbT0/vzl/67o8/Pr768Obf5y/85v2bD//4/o8/Pr5695+Pf3sj51t//snv6/n9P/zmh9/4+8cPT+8+vP3wNN/73dfz8179/7vffr+Mf739+O+3T5+++fEivlv1H79+//TuTx/ff/Ov//9Lv4f++Okf7z68efrBP/n5vx/+/+df/fTrx0eh15LpXf6rn3wv6DWbsKd+9q2/fv5nr3Hdk1IWXDcWB3FVwusaV8szAsMNbYm4xuUSZXS9RZF6jUvZmeB6zUJ7+dy4o8MwXBETyeVz6yAF18uuJsv+qkeh+0DWG6yQWmLbwF3ispgZGSWD20vcbH2JS5XuLCBu9WINVKrc4HJNyvr6FFNqg4t1kerrM0FRag6u1ptMrz80CvFI8AxHSMX1maAYAwR95A3fSxGWmuB6q5qWfaggArehnCOubZdJvZQx3M7g5agJu4BHGIhsD9tXP/qJXxpluV+HtnVcW7wItSpgQQe31K8NU5RDrUBYM6cF14i1gU96cKWYlBfcCGvAMgeXyqgXXI8mBUyI+7W3ZtB1dJEgK8P2wbMqri3+LtjIKl4+NndmzMg8SNs2a6iOwqzMTcQWfyIaHQ6El8HV5OuQJSocCq5Wd+8nIpQCOOuDG+1LoizMDMOm1JLHCTEzktcfXJKy66PGrZGg6XJ61ZJ2VoahNsaT+yzXkNIs0PE637guZDNpg7gRLMt6cz430JNJktQSZK0CtTKzWOIEq6UzCBvOHcsuSLcT+KmVFW27oK6C7m6vq7VmdjC4k0rJctTCiBK0sW7bPA5nV4IfWnPYEia4IwMMwkHtVra5BqsAkxEV61yOcLgpFn3CokuXC797CXJpGlw3pVzSWU/XAnFD1bYz7BGFXEIGN5lyS+u9mBLMTdN0q09EqCS4DalMS4bOZaKEHbZI6i015SbPAlPeyHEtv/xpO/fZ69MmJCWBHgulXNIRVjOkXIVdrB62r+665Am9Nsle/43h0WDJ05i6ttuYtxNYOtPssKUMI9FRhN3n1at6KXnesw9qSbyUfqdYlw6u11yrthtDRiMB8eyD0lKNEqmCPNXAlswh3S7nSQUut3KC3nZxgivVWpnk28WJK8AqolaILR5QOEXBMpeWOy1XEWHKICBwHdwVlYwsgPhyE5W7KhurTGpLsy3REI0u48qMjbdLtDmXYTZmRrl1hcQloOg9uFqdfp10iZeQgy5drcQX2w3RBrtYQAh6sXBYXOW1hAG0EHNwWZMX3DtsqES7fPF/ZuaC+anSqszFNi2KUVwn76UEIa5BYLejboStO6J3mbfncvSTVBmL3jUdguVeJEXdjB39IueKJcxWCCE1CKHXWTcKcxUqYDMpi6m3/Q0NR6oFg9vkmzloJRu4vV/uHV7MU8l0Xpd+2ZSoMzBPJRrEe0YFe8BbXdl7POCtjplkJSPF0rMPRbZFpWIPRjkFGbJFgppmE8op2Jv00jLlKAh3aprdyz40SYDZGhcPI+EXd1XcQrG4FGVRAe2Bsyjp2s5UpKH+1+BKsPWyXp2cFvzcyCL8OtKqdQu2XOrppVwfYx0mCGgOVCJky3KdlQxL3imFdKlH37MNWiYbrLeHYQkHTQ9Rrr2DBksqilvWen2K1XFqEGlk23Iq7rBe4s7VHCzEC6tsdo/j3j63MAWbKR3dtXh1DdZ2wKsPrqTTEuXvWu/E26WPoElYND64Ov2qa9yqCnS9FCZ6ndgaCaMt3CpRXdZr5A4Wussnav7ysFpDQ11gybzAXeAM3ayhQH7q4FJp0BIssqZRA+JyxtJd06gy5PrE/TpbOnvDJTfkuje4meq24LqTgU3RIiFeiKTqxg32U4qba7k/qUUJbL+qpluuY3N5xXCttJemgHIKgd3WsfxcqhXKKozuQ/jkOwtuhyFVkMGdq9DSJFfNUAHPcTnT0hZVcyGwz1i1N8KmvZbgOa5WlYVOpdpejrWHm4h9ubPA2c6JmtK6nTdxqEd0kgebBS9mZpJg/7KVrbYrd3c60oM7uKa6UQxLjMFj3NJk21UzE04emnPnAqa0ghyaJvftjiXJ2WBudsN6Jd2h1uk5be2VW9HRAqrAHNwpMy+14ubOQnGlVJYoRBESmHeoCluL0K1haBZ19nCrcE0TGYzy2alri77KA01+K3yrIKKVvoPLxVuLHu2dnqzEzZdkXSS0HMxKbmTV95B6S3ivyIkY6h9K1HpzZ1RWSM/neb258Rfbu0FeZM08RC9UuKZgkLOWXd5L6YFbKQjb3mwhWqazhGiqoRjuXHdoYxOBjYBzaQldW4AnkQdxo9Zur5EJSELOcLbNO9xB+J+yby4VOUlqQ2YsjzmEBy3RuDsbYWyc9YbSQuxV0hloBHHVtlaokhLo1G9dje/ahiTSZXuVVBpMdtJaffE69yQP6Tnzuss+uEFEpnMspGKj8DQ5gyWCoUfxUoKB2zeDq0NXWk6bNqOVHa7e6of35FBJrbJ0hWaiMQLcBhKrJQhJ0LgkCDdudfOsMpAp1sGtsq3yIFpqCL/vrPcG98pjBobA9Uolb8QDU2twvRGRK400yNF9uEHQhwkuZ71Dt1s+tzuSh1sM8nty9aixpo3nyF1gNJ5t6FrGhLvHo4H2a5HbOMwdo1HJJL3c5XkqcuCwa1qOMV3jEsN3oQwl5Wv/C87knyCkZnW9C1TDE0dznWpe2MrUePexKDqXAhd1l8I3N7NcKgTUNownEFdXQQkqE3S5yslL2ZeyrZHm+WkDOMXCUqOsuXdguDcKGlSU7qA5RKkuhTMqd0YLUUnSywQ4NROBZepKVeINN0wQ6tJz4cxjm0slhsiFpzw7ef4KSwGmqLfK6tQ8cxkYrjHnZr4xCSFaVs/0pcdNThoEtgGs1noRWc6sF4brxbV0b8inJgGu19m28WdKGuYCug8rB5uGSA3G4g7vjbNDzTMk/uW4w62h0I3FCkeLwwVir4VbQ5VayOc2uGYzz7ThTmaM4fpQ5LZ9yOFSg+tN10V5h4dEADIFyahiifI8BgFO45DuBURmkLt0cGltYzFbMcplU+KNQcsyU3zYLNmJFlu8MFMHGcpkNvXd5Q4QCi/XehU9GzoaysSUkUDYJvhVoS7sM6WvYsl24Nnqg0skS7IOz64fN6m9lR7Yq9Fsp8evb+pvEUSg/kRXKvtyLFIJJS+1V+mq7oGrhrRp8CbKUjGNLDA96+jlUsgdirY1b3b7KSPQtITNY7kaC5cQyk6QzIWZKyJYdDvmYGVbZfKOilG7p25dWJZCJBwPrK6qVdO8gVM+ujEYK46m1GEsS1mS20aIDPSRuxjgKAoZQgw7uDeUinq0M1Gfbk1bWZJEwRkkmnO6MUpGDRBxZT+T6dwz1U0s7VuPUJwDPcOtvRK4jA0OFdm5usjgmckDcb23aYt7ZryIdl1eiSRFxNyOnVlvI1453QU0odaK5SIvrdVIfevnhk7QnubP4fKMcYD7EJPmbyNeNPdFDNeTN3li6bndgmamobURgZIrQbnqW/uLSic+3+ObN0VGDfw+aDX/1sWbhUPSYMccqLahXLY0tOzgubYIYX7RWa4lLUSKu3Bnd7eWm0yhGTsVzHxjILin84DhWiZvOrBmmaCCDVfJogJyz5zxhPFcZhdEpRidrx1Z6U2oVCkLnYOlSTu2/B9U7z0DoO6bCAhTlYCHuHbBCW6vQJTiDu5oC21CfEMgBL1Du63FIryowxq9dfLugbXMtV2cNuNUGK5bbLKB0Wlg/sTBq7zssPXRUes031R24Wb8wc2uTS4v1QUUsueKVTSGK/FR9h7B1u3SBk1DHAECal3iMHcbgdmTTGtxSZ7mEo4KuN9ihE3AA5NpkRt3ILQ08PzGxS4kR92EMM0wHZGH7asf/cQf/7TPf/blWipdLjuVfspkYD5bm5bboFKzgH2eZtG4KmAeXLMCQ0vL+OMLi39erxh4QJul/Eolc3BHCxwpPA8uxXXfb3B1iiqgSFKn5RXdYHBH0B/UR6syv5SEOOvtDDBRnkzjctr54MY0BTHcmBrwgjt6MaAkWWTrFXX1HLZsNMp+8SF+MXfS887E1djqMaARDsJ2bu3gHFwnBrO0maNbDci6UIG9Hj3Aq+qvH1JENRiSejhVi191IQcjc88DSFe8h4ObU7wE/V+3ymLwrsqgZkuzC29+1ebkgx8bq/jVVLs/c28U9deb9sfBBQeczucm1+Wz4/+8INWLY76SV4nPcX/sCspZdrPIFl5kFLtBM6theGzbEAJR7Ac3euaYNm9GqABVxyGebeZQ6J0T8L4vFgmCiRf9AjKDqRJBN4ihlt4gw2XkzDeddHKhAC+U3jXdhw03EmRSeTPlUhQin9FRzIS8smllAnKjpUe/URQadZ42FFfKl5Im+cjzYfbg89bYVeS6FzeGXrDtbzSqHuu+6/6QZxBYuHCz6wj+vF5CRc9dqXWzXysj1M7I3RYOBomJgq/EjSSYLEOTIwhUYCHLeYoiyz5QKBoKbj3kQ+SUoHysTxt7YyAT/siAW/Dq1zkcrbX4LcYpg9OCxz/kOi1IFHNbQf0kx/q5FQuYcniH2TKjTAxOyZ24GbJNs9FpMaLxeMh1i53JkL8xO4s5xps9HBlJbH+DaOVLkLagneFx3BsDmbQTGVA42ZnL5iWNCX2iM3gpcBxcGakMEFfcF5U4MjWD1/ulSerD9tW9+bKJUS0SOSNOBL0zNbhDWt5GGgycRj9PP9Aq/jBytegjNiSrOAEJz+NAGO52Uz64Tqj8u41M2zYpYTPyBO5DjAjZNpkU2WB8MaveFJMoHK7wAub7YkfJZQYzNi9UGC374IZsQ2gepeA7SK5evLBTKIwd1GF229QiKAnTADqrHVnDZRdyYhWY+HAZbReNJJB+6vPW4BY4YqQZQEtwW2/J4dZgv8gnRG635DC4T2K1K+tTjAYQiDvUifU2m+pgH8qSdaNdkjH2et/zLU51m5fTUPQywK0bD4wMfwgAcGQv5lRncHorMLBOaQgLHEfMfCELaYw4MAYbI8q04JoTgYzKGRBdR8CsUxCd04OrvtXz2OfRWfD+YEau24TdCCuBGbnur5+xzTvg4D7M7MgSBlgZroeE+6opxuyNvq4Uyaum2EyINkjBieJVt2LYodCk98FdqZo8hCzw0bqYqvw2WSZTsUe34Yu9zkt6wIxNzFVaGxwGnjG27WEAkUi4dBC6PpgxUphgpS5iirMLLPnc38CTRBHLazqjB0RgEI2KzG0mus0DrPgkZfRy4+HhK4C1jtFp4e3VJmpIAeYs13vLr2fm0cBZYOBUvNgJvSn6L2EFmmaWr7ImquoB485U2PbkysypYJ/JLd1TdUn0AamsvKbfPT+5MjaP4eYoVi9P5Yy/AYvIM/ilS/FUIydmYbievEmMaQQzmFyOZkwvzeJ5qNFAukw6RSzjReojLA9+bhbN68tUXAk2K9LUaXvExMrQIn2qa2yPQGhmo/agsj9aoZKQtOHB5axlTl3FYH53DvFqeWpZBa8N3dwHNnUwxqQRrU8yMV6+AOLFi8UuKb7WkhjuTkagGiBSmpeP/h0KXlmCXK6ZUt0op3PKQD7HvGsaG3M8JApd7mh5XWVVZ3uT0aOv2ipXWevgzmNBYP1iZkIuX8k6uAwzMuft4suXqp9x1dCKnU2CuTAyh/EKMhxNI9c2+3To0O5VmS+vAdMMKIDt8DF83gqtnJHoY/Mz9bnRLoTmSV/wFHNfOdbzqQ2HGUsMAGf2Yo51Kr62FVFD4Yl4cfGNSGBiaE5FPpa5VKjnOoU+ylmyzfeddi04KcEzX7UZ/LwghI7osvJSEyGOQBsAzFGx9YPITUG3yjQtoSUMzDAd2K5l0euXPI67rkqwyMDzsMtGzG9pEfBzm4e+r8rYzw4lITmSM5dppNuAVksrmFlyOgstn1tOygraQ2XY5lgzFJT3EJ4pocWvNjP0DNiZdHThTZ+S5ikEdDJTXLZmMVuh7GeZmvLW3J6uIzi6zq28yviGe4BhlmOZK3nW05zpOAxXiWy52FNFo6d4GK1LCZLaZtoWC0LT1ViG1ylnTAOMmV8c4l8o2+ARVYitlGVF4GPdg2vbSLYVKlnBryljFeg9DWaogsNDVtiegplJM4daGjzMe/HtNd6INKjNdJbbi5ywjfeDbhmzu6W5vUk8DyRBA+/HyESW5qC5CENRi0dRPDZZWot5HhTchxkbWZLPKUBAyRx01vZz//D5/3378N2vf3349uF/TDp+32GmAAA=';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for europe/aland.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get europeAland10m {
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

/// Widget for rendering the europe/aland.10m.json map.
///
/// This widget provides a convenient way to render this specific map
/// with customizable projection and styling.
///
/// Example:
/// ```dart
/// Aland10mWidget(
///   projection: MercatorProjection(),
///   fillColor: Color(0xFFE0E0E0),
///   strokeColor: Color(0xFF333333),
///   onFeatureTap: (feature, position) {
///     print('Tapped: ${feature.properties}');
///   },
/// )
/// ```
class Aland10mWidget extends StatelessWidget {
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

  /// Creates a Aland10mWidget.
  const Aland10mWidget({
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
      geoJson: europeAland10m,
      projection: projection,
      fillColor: fillColor,
      strokeColor: strokeColor,
      strokeWidth: strokeWidth,
      onFeatureTap: onFeatureTap,
      antiAlias: antiAlias,
    );
  }
}
