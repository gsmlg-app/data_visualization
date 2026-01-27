// Generated from: assets/asia/spratly-islands.10m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for asia/spratly-islands.10m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE7WaS2sbSRDH7/oUg85ZUe9HbstCIIeFhT0uYRGJEgSKZGTlYIK/+9Lj2CR2txcVjA1C4575uaYe/+rume+raVpf7m5267fT+t1ue/l23v1xOhx2Hy/703H9pg1/fvjz7frt9M9qmqbp+/z58sL59Hng5ny62Z0v+/mix9OnaX3cfp0v+PvmvL0c7qb3t4ft8dPt04XTtN7fnv7dUjvpt8wXA9wZ+Hg6XvbH3fHSxn6/3W/XP8bun+z5sjt93V3Od79a82j+n98Ol/1fp8Pdlx+3/AQ+nT/tj9vLT/f+8PPz9+dHL4+nCVE3bI4Z+OblIGyIXVLo2dCH5+cOwcmgA3CikVbBmu6yBPhqV6xGR7/8y+vjIht2JgJ6aUxuLNwkonKTjQthI66gZMl5M9fQOs5rXOQgq3KZg7tYT0Uou8HEtZOdzVxAwlLWy4YDwvtUIxKvUjHErM9Nk7JzX+EmoGOdC0x9PyQRGFajFuZDrqVIlSsWOkjebKlSTt4ri3g5QQFK404hIWwAMcyLsQbmFOvc4wwmTquCBUCyE+wZnOJlMLt7X+aBEIyLEgiUDN7veIAugMX0BHLzzAFYkaiogtfnxIINz1TA++FGV4laW29FiGSDeGOAhFdVwzKA+u7D4ATlKng8w8FwgnJ3MgYZ+TgcPKtgjUgfukLQq4qvYcp9dUFPlmr/N2CjEddItdr6rk/j5WpKTAgGBc7m7MW+JhbCvX75wHXhYh6JQ6r3lY6dGKAoAmLp7P14s5tpdeogZum9Fj+Dg42LIiAmhkOwZ1ZLSgwtBgszbuKi5ay4NtuW7CbsAcMMbaJSrW9L7UszW4CV12XmITkKNwRXo8JmHDKIigtAecX3ioSyh5pVXaGBJiMRcCGvWvxKl2InlfI8//psW1D0VUKks6hrxkQwU1XqNAMi+uAkp6puaLDwIN6pgVk2WJIGjkgnoKxyMXGUoGnG5fYnmYYjD4uwli0GAh1YHOnp1S51fbItlfm6CQYdTL2cxUCLW5lBgaz9m3TWjChlvm4CPQJHFitkbSnawGJk/R7vLExQKqkGpuDeNl8Dk1t4KUP/x2JiZilNdxo4eOBhgqinhAwr1cm8zGUQHHRrJxfhUlNtYLKkvgI4uVOUFjwNzJmjuKVwbV+pcZETBh5mwYySZFVUYkHFEmAZtKggxih7T9RxkPdBJChVZRFLlv4EOIg5q2UqETDYRgwyASqDlai309/AjARljRUZLikbOKQqhYISIy45lF3Mbaewr93BLIJVT1AaDFaUwehemw/NpUqKAzC5Q/XhZDC7DsQlSEDq2XZ1QS+lLrIhD/XuNg223fXyLg01CR1hEQCLCwEKC9deVBrYDK04/aUg72sAbkDBojqvftXDCsA1DWhgIupuATdXaBTnAQ2M1m9/DcxKtcZQSbbl2ipgCFA/3giOxMXyhtYutO89hCTP4koAaBwWRFGrrYFni926gtTAnsWnHzo/2wvoZyiiMmBxpgrYfvsqgKiJVBR9gETSXmNtYCaqPVBsFnObZYzSzbTaTQp5vFw3YUPm/ssNbo5YfRzLRgHcfQnBLRFrS9W225ep2n11xB1ArLwDfK0fxjFZPf92v3r8/LC6X/0HCv7BNQgnAAA=';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for asia/spratly-islands.10m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get asiaSpratlyIslands10m {
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
