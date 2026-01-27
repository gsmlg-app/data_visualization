// Generated from: assets/africa/namibia.110m.json
// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:io';
import 'package:dv_geo_core/dv_geo_core.dart';

/// Gzipped GeoJSON data for africa/namibia.110m.json (base64 encoded)
const String _kCompressedData = 'H4sIAAAAAAAAE5VXXWsTURB9z69Y8lyH+f7wTQTfFN9FJNYogTYpaXwopf9dNrWluldw8rBs7uw9zLlz9szs/Wqa1qe7m+369bR+t92cfh63bw9XV9vL0+6wX1/M4e+Py7fr19On1TRN0/35utx4fvwcuDkebrbH0+686enxaVrvN9fnDR8217uvu83zhmla724PXzZ8Dr5ZrMvj+vuXgcvD/rTbb/enOfbm+3F3uVn/jj48J/Jje7jeno53f6bxlPfHw9Xdj980n1EPx2+7/eb0gu/j7+X93/+miQqyLDzq4q/IK1YIjyjkPyKfL/4DUC1yCUiQWmTRwWOETCJRGuKRCgc1AYvQlWQBSAlszJTVAiRwM1QcA1KRegtPgMrTUpd4AemFkq2SsIBFIZoPE0xip94RKjCFuNowwyzRXo0VjDHQeIwXxNoriQGmqsrwCN0puyo0wPCyUY0DLDJZpEnZk0VrKWsKEBMl7J4hiqTTsCZclipd1TAZag4BjYXIe6ohkAgKH1IuQRe3ltUklDlljPAiC6snw/llcBGsoWoEqwxbMiQFxgr0YYZiQtgrMimgpSENM1QWSWx5DQmoszgPauJQQUyULUCePRlz5K4OpSTKvTPkWYb6D10TkXtqC5AgRKly2aDOVabZv7qApTXUYQJ6ETcBGRzTfNDyqADVRLNdFPZUGxSlwEPIrQcoIMZagx6PkMEp2hsaBNLTlZcNYO6uVSjd94QtgkZDA8+iYey1UFKQtCBftlBmcHO3pqwV5rdEdcBYIE2QeqpWCBUeMjaQ4uryrawgXGqaHYhCgnp8DZhQg5fOxQFYWGZdQEdKygHhgGRijR5lB1Gt8IGoE+YRGXvdySFZkWLAOAGTyann1QHzaMoDn+EEMSvtzSCz3WVoxUCDCZFipK0OPw9r4jQY4zghzSWiV+MEdc0aDEl8NkL1pgoLEJk4lkbICRWsKj3G89eOhugQUJ0Itees/e+x1ej+6e5h9XT9vHpY/QLrwpKRNw8AAA==';

/// Cached parsed GeoJSON
GeoJsonFeatureCollection? _cached;

/// Parses the GeoJSON for africa/namibia.110m.json
///
/// The data is stored as gzipped binary to reduce package size.
/// First access decompresses and parses; subsequent accesses use cached result.
GeoJsonFeatureCollection get africaNamibia110m {
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
