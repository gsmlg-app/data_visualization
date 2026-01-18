import 'dart:math' as math;
import 'package:flutter/material.dart';

class NetworkGraphExample extends StatefulWidget {
  const NetworkGraphExample({super.key});

  @override
  State<NetworkGraphExample> createState() => _NetworkGraphExampleState();
}

class _NetworkGraphExampleState extends State<NetworkGraphExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<_Node> _nodes;
  late List<_Edge> _edges;

  @override
  void initState() {
    super.initState();
    _initializeGraph();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();
  }

  void _initializeGraph() {
    final random = math.Random(42);

    // Create nodes
    _nodes = List.generate(15, (i) {
      return _Node(
        id: i,
        label: 'Node $i',
        x: 100 + random.nextDouble() * 300,
        y: 100 + random.nextDouble() * 200,
        vx: 0,
        vy: 0,
        radius: 15 + random.nextDouble() * 15,
        color: [
          Colors.indigo,
          Colors.teal,
          Colors.orange,
          Colors.purple,
          Colors.pink,
        ][i % 5],
      );
    });

    // Create edges (random connections)
    _edges = [];
    for (int i = 0; i < _nodes.length; i++) {
      final numConnections = 1 + random.nextInt(3);
      for (int j = 0; j < numConnections; j++) {
        final target = random.nextInt(_nodes.length);
        if (target != i && !_edges.any((e) =>
            (e.source == i && e.target == target) ||
            (e.source == target && e.target == i))) {
          _edges.add(_Edge(source: i, target: target));
        }
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _simulateForces(Size size) {
    const repulsion = 2000.0;
    const attraction = 0.05;
    const damping = 0.9;
    const centerForce = 0.01;

    final centerX = size.width / 2;
    final centerY = size.height / 2;

    // Reset forces
    for (final node in _nodes) {
      node.vx = 0;
      node.vy = 0;
    }

    // Repulsion between nodes
    for (int i = 0; i < _nodes.length; i++) {
      for (int j = i + 1; j < _nodes.length; j++) {
        final dx = _nodes[j].x - _nodes[i].x;
        final dy = _nodes[j].y - _nodes[i].y;
        final dist = math.max(1, math.sqrt(dx * dx + dy * dy));
        final force = repulsion / (dist * dist);
        final fx = (dx / dist) * force;
        final fy = (dy / dist) * force;

        _nodes[i].vx -= fx;
        _nodes[i].vy -= fy;
        _nodes[j].vx += fx;
        _nodes[j].vy += fy;
      }
    }

    // Attraction along edges
    for (final edge in _edges) {
      final source = _nodes[edge.source];
      final target = _nodes[edge.target];
      final dx = target.x - source.x;
      final dy = target.y - source.y;

      final fx = dx * attraction;
      final fy = dy * attraction;

      source.vx += fx;
      source.vy += fy;
      target.vx -= fx;
      target.vy -= fy;
    }

    // Center force
    for (final node in _nodes) {
      node.vx += (centerX - node.x) * centerForce;
      node.vy += (centerY - node.y) * centerForce;
    }

    // Update positions with damping
    for (final node in _nodes) {
      node.x += node.vx * damping;
      node.y += node.vy * damping;

      // Boundary constraints
      node.x = node.x.clamp(node.radius + 20, size.width - node.radius - 20);
      node.y = node.y.clamp(node.radius + 20, size.height - node.radius - 20);
    }
  }

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
                'Force-Directed Graph',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: () {
                  setState(() {
                    _initializeGraph();
                  });
                },
                tooltip: 'Regenerate',
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Nodes attract along edges, repel each other',
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
                    return AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        _simulateForces(Size(constraints.maxWidth, constraints.maxHeight));
                        return CustomPaint(
                          size: Size(constraints.maxWidth, constraints.maxHeight),
                          painter: NetworkGraphPainter(
                            nodes: _nodes,
                            edges: _edges,
                          ),
                        );
                      },
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

class _Node {
  final int id;
  final String label;
  double x;
  double y;
  double vx;
  double vy;
  final double radius;
  final Color color;

  _Node({
    required this.id,
    required this.label,
    required this.x,
    required this.y,
    required this.vx,
    required this.vy,
    required this.radius,
    required this.color,
  });
}

class _Edge {
  final int source;
  final int target;

  _Edge({required this.source, required this.target});
}

class NetworkGraphPainter extends CustomPainter {
  final List<_Node> nodes;
  final List<_Edge> edges;

  NetworkGraphPainter({required this.nodes, required this.edges});

  @override
  void paint(Canvas canvas, Size size) {
    // Draw edges
    final edgePaint = Paint()
      ..color = Colors.grey.withAlpha(80)
      ..strokeWidth = 1.5;

    for (final edge in edges) {
      final source = nodes[edge.source];
      final target = nodes[edge.target];
      canvas.drawLine(
        Offset(source.x, source.y),
        Offset(target.x, target.y),
        edgePaint,
      );
    }

    // Draw nodes
    for (final node in nodes) {
      // Shadow
      canvas.drawCircle(
        Offset(node.x + 2, node.y + 2),
        node.radius,
        Paint()..color = Colors.black12,
      );

      // Node fill
      canvas.drawCircle(
        Offset(node.x, node.y),
        node.radius,
        Paint()..color = node.color,
      );

      // Node border
      canvas.drawCircle(
        Offset(node.x, node.y),
        node.radius,
        Paint()
          ..color = node.color.withAlpha(200)
          ..strokeWidth = 2
          ..style = PaintingStyle.stroke,
      );

      // Inner highlight
      canvas.drawCircle(
        Offset(node.x - node.radius * 0.3, node.y - node.radius * 0.3),
        node.radius * 0.3,
        Paint()..color = Colors.white.withAlpha(80),
      );

      // Label
      final textPainter = TextPainter(
        text: TextSpan(
          text: '${node.id}',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 11,
            fontWeight: FontWeight.bold,
          ),
        ),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(node.x - textPainter.width / 2, node.y - textPainter.height / 2),
      );
    }
  }

  @override
  bool shouldRepaint(covariant NetworkGraphPainter oldDelegate) => true;
}
