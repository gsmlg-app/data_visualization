// Generated from: assets/north-america/puerto-rico.50m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for north-america/puerto-rico.50m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE7VYTWscRxC9768Y9uw09f3hWwgEckgwvgYTFmXjLEg7Yr06CKP/HmZkCVnqDqiE9zDsTHe/qamueq+qv26maXu+vd5v30/bX/e7881p/8t8ebm/OB/m4/bdMvzP/eMv2/fTn5tpmqav6/XlwnX6OnB9mq/3p/NhXfQwfZq2x93VuuDDzf50nqePh4v5cdE0bQ9f5r92tE74+OI53z//7enAxXw8H47743kZ+2M+nf+dfr7anw4Xu+23SXePNn3ez1f78+n2e4sePuH3m8vz4cN8efv522c/vmE+/X047s5Pvv/+9/T/87uX99P0k1lDSk7Rdy8GMZqIJGE+G/r0fO4AWBncqA/sYCpcBI5QlxGweiDVgAMpEqwPnKSUJYu9gaZhYhdYidCihovIwD7ARfGU0t55Qw0TGnkiCcOLwI7uzn1gVk+s4RIye2QXl5MNWIvAJmDUTw820UwrAnOkSfSBqZwe3ggEFaQLTMGcIdW9IzHo+5hI3hIUwmh9i1FJuRoVmBbe2ztvmYKRxaBAIQ7q7Z23NLPMEgN5A2Rm6CX0AuzhWPKEtTQkhoErlF2zREHWeuHgLcUToBRn1mIxx31gq4JH0QnuJEgD74apU1GRNEN4FGjuEVDUUEXwrm4sBjsgljLOmkCoyGDvFDS0aDDTqr+DABY0KGozhUbEICgkU6uiT6KAOdg7cTItEbw1ZJUccISkGJVcrC0dAmAA7MKmJU9oCxbkAb+DOpMUgT2IyPrVBFIYcinvtDmGQPQrQYyViGvARhCSfYtJiLlEbQtuBEQflwM5raRI2lxVbSChAmiIRReHxyIOg/aAQ7xIQeAgCIMq3mLR5yJwkrkOLH4TsI2jTSiAvCgfkCFhg6KYFFOrndLre7vN6O67V76+0dTlSxZd6ScrqGGVtyglBi3FUk5JrULXxkAW2vcerrFfqpm0sRnhgGjREGoFujZxR4lBHW0KxTpam/rapA5c7AxSIgFtel/ODWLCzYpbpyAAPJCypVioFU6lIP5RGeUt/qchA82wmq56CwtE7TMdGHn1HCTMPG1gcP1IaAFmoW7LsACXGdRbaKLnCDg1an2Tt5AEpz5rQToQFnvTEGbNAQkAp2qxmY61tBzwLCJwjb8XHyuOBBsJUah4xBIrlw5wl0Qu4iZGig48QRDlE5ZksFHeISqyFU9Ykh2s2/4vQQHGNSlbLWbHPoFDWGKt2PKWgAkyyA/H8Gp6pMqAv9/EbIlo3aOFlYoTqZp1gcEjgzWSteqI14vHWMk2z//dbR6unzZ3m/8AXLNcpNMZAAA=';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for north-america/puerto-rico.50m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get northAmericaPuertoRico50m {
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
