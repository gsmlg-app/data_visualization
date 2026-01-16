import 'package:flutter/widgets.dart';

/// Base class for line endpoint markers.
abstract class Marker {
  /// The size of the marker.
  final double size;

  /// The fill color.
  final Color color;

  /// Optional stroke color.
  final Color? strokeColor;

  /// The stroke width.
  final double strokeWidth;

  /// Creates a marker.
  const Marker({
    this.size = 10,
    this.color = const Color(0xFF000000),
    this.strokeColor,
    this.strokeWidth = 1.0,
  });

  /// Returns the path for this marker shape.
  /// The path should be oriented to point in the direction of the line.
  Path createPath();

  /// Draws the marker at the given position and angle.
  void draw(Canvas canvas, Offset position, double angle) {
    canvas.save();

    canvas.translate(position.dx, position.dy);
    canvas.rotate(angle);

    final path = createPath();

    // Fill
    final fillPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = color;
    canvas.drawPath(path, fillPaint);

    // Stroke
    if (strokeColor != null) {
      final strokePaint = Paint()
        ..style = PaintingStyle.stroke
        ..color = strokeColor!
        ..strokeWidth = strokeWidth;
      canvas.drawPath(path, strokePaint);
    }

    canvas.restore();
  }
}

/// Widget that draws a marker at a line endpoint.
class MarkerWidget extends StatelessWidget {
  /// The marker to draw.
  final Marker marker;

  /// The x position.
  final double x;

  /// The y position.
  final double y;

  /// The angle in radians.
  final double angle;

  /// Creates a marker widget.
  const MarkerWidget({
    super.key,
    required this.marker,
    required this.x,
    required this.y,
    this.angle = 0,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _MarkerPainter(
        marker: marker,
        x: x,
        y: y,
        angle: angle,
      ),
    );
  }
}

class _MarkerPainter extends CustomPainter {
  final Marker marker;
  final double x;
  final double y;
  final double angle;

  _MarkerPainter({
    required this.marker,
    required this.x,
    required this.y,
    required this.angle,
  });

  @override
  void paint(Canvas canvas, Size size) {
    marker.draw(canvas, Offset(x, y), angle);
  }

  @override
  bool shouldRepaint(_MarkerPainter oldDelegate) {
    return marker != oldDelegate.marker ||
        x != oldDelegate.x ||
        y != oldDelegate.y ||
        angle != oldDelegate.angle;
  }
}

/// Marker position on a line.
enum MarkerPosition {
  /// At the start of the line.
  start,

  /// At the end of the line.
  end,

  /// At both start and end.
  both,
}
