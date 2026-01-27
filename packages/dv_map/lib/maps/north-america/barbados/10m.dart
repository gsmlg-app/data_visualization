// Generated from: assets/north-america/barbados.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for north-america/barbados.10m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE52WS2vcQAzH7/spjM9p0PuRW1PosZReSyjbxE0XknVw3EMI+e5lnWzIQ6XM+mDGo9EPySP9Z+5XXdfPdzdDf9L1n4f1/GcaPo1XV8P5vBm3/dHO/Otx+rY/6b6vuq7r7pf3e8dl+WK4mcabYZo3i9N+edf12/X14nC6nn6uL8bbZ4+u6ze34481LdbTd/O8zH97ZTgft/NmO2znne3LOM2/u4/Xw7Q5X/dPix6eA7ocxuthnu5eh7OP/+t4dXf5lO4zfJwuNtv1/CLvx+fl+O1X133QPBayxKM3BuRjNOAwfWU4O/o/jsMovAK6hBM2A9URqOIFo1M289zMpeQlZ7QnnBgIZcLpKSytQMUA1SiAhK6o7UA2Q9AKyMgJ3gyUXWZV0ZAkOnEz0CK1rEKKNI3mTVbXRK+ADMIR7SkHOIZVQBQlsGZgijhWu8wsHkKtQEMK46oOWUQlm/+hMSRD+Q/ZU6O5k00UueQRO7ZLjSkRYglEMJTmMjQVAsmqDFMRsbnzTAzMKuCB6mrMSLV6oSZSe9UQqmMFhJ0aQjsQAqUsQwgxOyBCAJKsGgVCkLkZqGEJXKYcjOkHqJeIUKWv4AGUB+irpmV15oG5pRxyAiBRCVREbxcbpdypTQlUOUANiRHqMlQT4/YDAM2xjs84qD1AiNC6CtUZo3lLJFw5yi3xUG0/ocTVPeo+Mcn2PhHVfxx5CADt6iq88yqvmqRJ2H6Ta7m5rqrxfvSw2r/PVg+rv8qh6exnDAAA';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for north-america/barbados.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get northAmericaBarbados10m {
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
