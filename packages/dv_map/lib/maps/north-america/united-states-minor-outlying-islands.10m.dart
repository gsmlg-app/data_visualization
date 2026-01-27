// Generated from: assets/north-america/united-states-minor-outlying-islands.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for north-america/united-states-minor-outlying-islands.10m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE7WaTW8bRxKG7/oVA52TQX1/5LYIECAH7y4Q5LQIFoLNeAnIpCHRByPwf1900zYSu0aJiqEOgsghH9W8VV1VXT2/3SzL7en9293td8vtD7u707uH3ffH+/vdy9P+eLj9Zlz+9fz24+13y39ulmVZfpu/v/7i/Pi88Pbh+Hb3cNrPL336+LLcHu7ezC/8fNifdq+Wn053p93j8mJ/OD4s/3p3un+/P7xefny8vzu8evxMW5bb/ePxv3c0v/niq/f5/P6Pv7/w8ng47Q+7w2lc++fx4fS/5R9vdg/7l3e3Hz/04bOxr3fHN7vTw/s/mvrp3l68uz/t/328f//6ox6f/8Px4dX+MG7gszDnn9///eWrr18vy7douSoDGcU3X11FW90AM/mLS798+dlNMmkQ1WQNSeiTnQg2bFaTNG2TE102wCJGbS6Tc26BPbxtMQUn4pYWIJFtMisEX8N/6AKyFXMk7G2dCYLIt8jWdt+zF8nN1qs//M/GkoUVKNMLY76Fld1QueeXARa3LNQb5Ai3pl9gBSQRsA0yQUoXDJEAuiEGSSK2xXiuytdyudsqoUFZ5FJYMU2xl6QnmCKz0G+Ahanl8MlFciwS3uCiOHsX7MkYhV8GGJilFUkTrJRVJA0wI2BbYrfwqqgMsItqK0LPUiDqFjiB2hoHIdkG2Cz6QfHcKL7mktJU4fImiTSyV5EH2Di5DFAiDMu2eproXqpHmET9yH+2Eld0i7Gh1zHiCRjeamfOYCgTOqwBLNhOdcZjqZWJI8BSLwEbb1ksqdF1uAmASFHnpxTK0rZYQJKKlnGAMSP6vntmUFwnQtFsNUzOKutirhRo0qgTkytCaFW7nSu5akCjTkzwaORly2Ah8S54FHkqmroBTne1rhQs7lbtHHNlUGds5OazxRCeVR8/LBZAakTo2eLAlNpiChPpJOcJpnSGakMzwCRoXec9O4yvlvR9ZYqkKOSjWAkRohNJZzIruRYeH2QQau4Pps0SmUWHeyZndGLpIxlRq/ZrkjW8D6awyucT7GbNitJy4DXDSd106z5RhKjXRPjKFiZYLMdJVsZoh5MHlBvZSabg1uxigENJuKgr0+mWbn1yanoxeqIYGxDT6JPByWqZMaPZQg+RCQO3sgExt1eWiWg13zivLI3eVqwVytdaWOeRLldbmzEGYwZtjxrFzav0McDkbNSbDw1yKlSd4ySzaKd+frJ51JYNMgJKy+eTjJZV9J/JCdkf6ZJAVh3bcOBoP1sLoBMZ14xSZDPcGFzL2FS19UNys41huwhzp0f/CzarZqfl7apxJd+4jgkzE1UCxiroZNwRcIA3J/SXg4OpqMsTzOKt85UphaZUw/YBhgCyTs6bYHalqrMfYEuLTij9OVg422CQrCZbE0zWS6V/CgZB72qMkQjVooqVM4KhK8WTYHfGToaeYA+sOtcJNvNWUpxgw6iD4kKuQpQb1AlGaE2pJhiDoQ6KC8HgjFV1HWAF0E4/PMAQIFfhWkbU2fgyJUAZyznLxWBG4y3fXbI8ngALsGPrUHWCybicDA2wuGNbiqfAl2Tjp8AIRK2zu7PGzlQ9BDHBntzNxk/EsaCitM6tzyu63jv/DeDNVCGoxtoupQhmWxpfBH5253alNhKNVjAIqzbyukb4OK9t3OUEO7JWmUvXSEDjXhtOKwI6Vkl8gkmktycZYDaqpjBDitDmeGeCoT4QH2DrnRENhZPDcAOrAdm1F8IZoWgYBphDmw+FDTA5Vn3vAAv2jsNnrAVmNZueSkjz/H6CFaw6mJlgJent8qfEYNXBjK7h4zSi9+TRCArwKmsNrgQ1n2gaXOFykzXAykp9MCLrhhJo0iq+Z98xWPV8i65hyQ5t3xki6IbGLJxtsLqBbUQbibclfnaOv2LBEQD06iZtFVFk7ar3FJhn0W2Cx9y/2pddkXs1IWrwtrtvvvzrw82n37/cfLj5PyLH/rt9LgAA';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for north-america/united-states-minor-outlying-islands.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get northAmericaUnitedStatesMinorOutlyingIslands10m {
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
