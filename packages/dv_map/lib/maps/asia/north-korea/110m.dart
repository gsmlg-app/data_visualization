// Generated from: assets/asia/north-korea.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for asia/north-korea.110m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE6VXS2sbSRC+61cMOoei3o/clkAuZhez1yUsIqtkBY7GyMrBBP/3ZeTHOlY7kIoOw/RU96fqr6u+6vq2mqb18fZ6u347rd9vN8evh+27+epq+/G4m/frN4v50/3nm/Xb6a/VNE3Tt9PzfOFp+slwfZivt4fj7rTocfo0rfebL6cFf8yH47/TxXzYbp4WTdN6dzP/veFlwsXl2XdZvl/+efHc8HHeH3f77f642H672W3WD7a7J1c+b+cv2+Ph9ntHHj3//evVcXc5X91+ftjtE/B8+Ge33xyfbfv+9/z95eh8PE0kCJGIKPHmzKgMzIgY+cL04eXcHwCH/gCYfwFY61VgQv0F4J+jYvXa6Lu/7JyLS1XV2BkpQ1Zp7JILqpQ9eAhcaZJePWArd8+xx8paSZ1I4gQ0ZrKRx3TaTar3gBlTRWgIrO4R1AIOEJVIGeIaClmPCYf0wpQxcJKbVysoHCgZ1cZMEIaIUwfYAKNKKQfACOaVLNEBVmA3Z/VzYCkoTi3pqAArhIQmD6iQAncU7SWegTAR2YAKKTAjaYaxgaRb1hhYMsqildEGJJyWNgBOSE2zXrgZMFPpSCokwd3SWrWBdRGwJd6GwKapoU3gICbHsceEKdpLkMVjQpGBuElAaSZj8/BYETNGVAQsBLO2EsSAw0RwUNglwL0w0HrA5qlSYyrCGDNbWmHgWYQy0oqF4+XG0Do8BwoNG8ZxQGh5WlPoWUIkB3ec5fAUJXop7eApQfUKMGoEt4ADliKBr2gFmxNpi4o43crERuGWIKgm1q7+FmojKhIkUKonQgmiFeRjj52YtctxpIjyKNwK0DArW3ocIGkqOsq8AibR4JZWBBgyUY2rtLCUYDMqTETFRuFWEOZpvZQOKA+lERWKgGxK3FK3BBcRz1E/hEBZqd17NxJKjThWBF0OtleaCiiTaNhoIbhT9lpDLgg0ypHQK0ImJ/fUbbmfhfjo7qYEjkTYq3kF5VY6UrelBVESb3ksCLq0nDg6PAY+9aMddVua2agqHrUKD81sNYFHwnbfkzbxfr7RXb02+v/98e1u9fj8sLpb/Qf6w6Z2UxIAAA==';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for asia/north-korea.110m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get asiaNorthKorea110m {
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
