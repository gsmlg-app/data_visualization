import 'dart:math' as math;
import 'package:flutter/material.dart';

class WordcloudExample extends StatefulWidget {
  const WordcloudExample({super.key});

  @override
  State<WordcloudExample> createState() => _WordcloudExampleState();
}

class _WordcloudExampleState extends State<WordcloudExample> {
  final _words = [
    ('Flutter', 100),
    ('Dart', 85),
    ('Widget', 75),
    ('State', 70),
    ('Animation', 65),
    ('Layout', 60),
    ('Navigation', 55),
    ('Material', 50),
    ('Cupertino', 45),
    ('Provider', 42),
    ('Riverpod', 40),
    ('Bloc', 38),
    ('GetX', 35),
    ('Firebase', 48),
    ('API', 44),
    ('HTTP', 36),
    ('JSON', 34),
    ('Async', 52),
    ('Future', 46),
    ('Stream', 43),
    ('Build', 39),
    ('Context', 41),
    ('Theme', 37),
    ('Color', 33),
    ('Icon', 31),
    ('Text', 29),
    ('Image', 27),
    ('Button', 25),
    ('List', 23),
    ('Grid', 21),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Word Cloud',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: () => setState(() {}),
                tooltip: 'Regenerate',
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Flutter ecosystem keywords',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.grey.shade600,
                ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return CustomPaint(
                      size: Size(constraints.maxWidth, constraints.maxHeight),
                      painter: WordcloudPainter(words: _words),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _WordPlacement {
  final String text;
  final double fontSize;
  final Offset position;
  final double rotation;
  final Color color;
  final Rect bounds;

  _WordPlacement({
    required this.text,
    required this.fontSize,
    required this.position,
    required this.rotation,
    required this.color,
    required this.bounds,
  });
}

class WordcloudPainter extends CustomPainter {
  final List<(String, int)> words;

  WordcloudPainter({required this.words});

  @override
  void paint(Canvas canvas, Size size) {
    final random = math.Random();
    final center = Offset(size.width / 2, size.height / 2);

    final colors = [
      Colors.indigo,
      Colors.teal,
      Colors.orange,
      Colors.purple,
      Colors.pink,
      Colors.cyan,
      Colors.amber.shade700,
      Colors.green.shade700,
    ];

    final maxWeight = words.map((w) => w.$2).reduce((a, b) => a > b ? a : b);
    final minWeight = words.map((w) => w.$2).reduce((a, b) => a < b ? a : b);

    final placements = <_WordPlacement>[];

    for (final word in words) {
      final normalizedWeight = (word.$2 - minWeight) / (maxWeight - minWeight);
      final fontSize = 12 + normalizedWeight * 36;
      final rotation = random.nextBool() ? 0.0 : -math.pi / 2;
      final color = colors[random.nextInt(colors.length)];

      // Estimate text bounds
      final textPainter = TextPainter(
        text: TextSpan(
          text: word.$1,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();

      final textWidth = rotation == 0 ? textPainter.width : textPainter.height;
      final textHeight = rotation == 0 ? textPainter.height : textPainter.width;

      // Try to place word using spiral
      Offset? position;
      Rect? bounds;

      for (double t = 0; t < 1000; t += 1) {
        final spiralRadius = 5 + t * 0.5;
        final angle = t * 0.1;
        final x = center.dx + spiralRadius * math.cos(angle);
        final y = center.dy + spiralRadius * math.sin(angle);

        final candidateBounds = Rect.fromCenter(
          center: Offset(x, y),
          width: textWidth + 4,
          height: textHeight + 4,
        );

        // Check if within bounds
        if (candidateBounds.left < 10 ||
            candidateBounds.right > size.width - 10 ||
            candidateBounds.top < 10 ||
            candidateBounds.bottom > size.height - 10) {
          continue;
        }

        // Check for collisions
        bool collision = false;
        for (final existing in placements) {
          if (candidateBounds.overlaps(existing.bounds)) {
            collision = true;
            break;
          }
        }

        if (!collision) {
          position = Offset(x, y);
          bounds = candidateBounds;
          break;
        }
      }

      if (position != null && bounds != null) {
        placements.add(_WordPlacement(
          text: word.$1,
          fontSize: fontSize,
          position: position,
          rotation: rotation,
          color: color,
          bounds: bounds,
        ));
      }
    }

    // Draw words
    for (final placement in placements) {
      canvas.save();
      canvas.translate(placement.position.dx, placement.position.dy);
      canvas.rotate(placement.rotation);

      final textPainter = TextPainter(
        text: TextSpan(
          text: placement.text,
          style: TextStyle(
            color: placement.color,
            fontSize: placement.fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(-textPainter.width / 2, -textPainter.height / 2),
      );

      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
