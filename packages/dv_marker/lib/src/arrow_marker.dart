import 'package:flutter/widgets.dart';

import 'marker.dart';

/// An arrow marker for line endpoints.
class ArrowMarker extends Marker {
  /// The width/spread of the arrowhead.
  final double width;

  /// The length of the arrowhead.
  final double length;

  /// Whether the arrow is filled or just stroked.
  final bool filled;

  /// Creates an arrow marker.
  const ArrowMarker({
    super.size = 10,
    super.color,
    super.strokeColor,
    super.strokeWidth,
    double? width,
    double? length,
    this.filled = true,
  })  : width = width ?? size,
        length = length ?? size;

  /// Creates a simple triangle arrow marker.
  factory ArrowMarker.simple({
    double size = 10,
    Color color = const Color(0xFF000000),
    Color? strokeColor,
    double strokeWidth = 1.0,
  }) {
    return ArrowMarker(
      size: size,
      color: color,
      strokeColor: strokeColor,
      strokeWidth: strokeWidth,
    );
  }

  /// Creates an open (unfilled) arrow marker.
  factory ArrowMarker.open({
    double size = 10,
    Color color = const Color(0xFF000000),
    double strokeWidth = 2.0,
  }) {
    return ArrowMarker(
      size: size,
      color: const Color(0x00000000),
      strokeColor: color,
      strokeWidth: strokeWidth,
      filled: false,
    );
  }

  @override
  Path createPath() {
    final halfWidth = width / 2;

    final path = Path();

    if (filled) {
      // Solid triangle arrow
      path.moveTo(0, 0); // Tip
      path.lineTo(-length, -halfWidth);
      path.lineTo(-length, halfWidth);
      path.close();
    } else {
      // Open arrow (chevron)
      path.moveTo(-length, -halfWidth);
      path.lineTo(0, 0);
      path.lineTo(-length, halfWidth);
    }

    return path;
  }
}

/// A diamond arrow marker.
class DiamondArrowMarker extends Marker {
  /// Creates a diamond arrow marker.
  const DiamondArrowMarker({
    super.size = 10,
    super.color,
    super.strokeColor,
    super.strokeWidth,
  });

  @override
  Path createPath() {
    final half = size / 2;

    final path = Path();
    path.moveTo(0, 0); // Right point (tip)
    path.lineTo(-half, -half); // Top
    path.lineTo(-size, 0); // Left
    path.lineTo(-half, half); // Bottom
    path.close();

    return path;
  }
}

/// A stealth/sharp arrow marker.
class StealthArrowMarker extends Marker {
  /// Creates a stealth arrow marker.
  const StealthArrowMarker({
    super.size = 10,
    super.color,
    super.strokeColor,
    super.strokeWidth,
  });

  @override
  Path createPath() {
    final half = size / 2;

    final path = Path();
    path.moveTo(0, 0); // Tip
    path.lineTo(-size, -half);
    path.lineTo(-size * 0.6, 0); // Notch
    path.lineTo(-size, half);
    path.close();

    return path;
  }
}
