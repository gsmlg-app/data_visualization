import 'package:flutter/widgets.dart';

import 'marker.dart';

/// A circle marker for line endpoints.
class CircleMarker extends Marker {
  /// Creates a circle marker.
  const CircleMarker({
    super.size = 10,
    super.color,
    super.strokeColor,
    super.strokeWidth,
  });

  /// Creates a filled circle marker.
  factory CircleMarker.filled({
    double size = 10,
    Color color = const Color(0xFF000000),
  }) {
    return CircleMarker(
      size: size,
      color: color,
    );
  }

  /// Creates a hollow circle marker.
  factory CircleMarker.hollow({
    double size = 10,
    Color color = const Color(0xFF000000),
    double strokeWidth = 2.0,
  }) {
    return CircleMarker(
      size: size,
      color: const Color(0x00000000),
      strokeColor: color,
      strokeWidth: strokeWidth,
    );
  }

  @override
  Path createPath() {
    final radius = size / 2;
    return Path()..addOval(Rect.fromCircle(center: Offset.zero, radius: radius));
  }
}

/// A square marker for line endpoints.
class SquareMarker extends Marker {
  /// Creates a square marker.
  const SquareMarker({
    super.size = 10,
    super.color,
    super.strokeColor,
    super.strokeWidth,
  });

  @override
  Path createPath() {
    return Path()
      ..addRect(Rect.fromCenter(center: Offset.zero, width: size, height: size));
  }
}

/// A bar/line marker for line endpoints.
class BarMarker extends Marker {
  /// The thickness of the bar.
  final double thickness;

  /// Creates a bar marker.
  const BarMarker({
    super.size = 10,
    this.thickness = 2,
    super.color,
    super.strokeColor,
    super.strokeWidth,
  });

  @override
  Path createPath() {
    final half = size / 2;
    final halfThick = thickness / 2;

    return Path()
      ..addRect(Rect.fromLTRB(-halfThick, -half, halfThick, half));
  }
}

/// A dot marker (small filled circle).
class DotMarker extends Marker {
  /// Creates a dot marker.
  const DotMarker({
    super.size = 6,
    super.color,
  }) : super(strokeColor: null, strokeWidth: 0);

  @override
  Path createPath() {
    final radius = size / 2;
    return Path()..addOval(Rect.fromCircle(center: Offset.zero, radius: radius));
  }
}
