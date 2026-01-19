import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:data_visualization/data_visualization.dart';

/// Interactive demo of mock data generators
class MockDataExample extends StatefulWidget {
  const MockDataExample({super.key});

  @override
  State<MockDataExample> createState() => _MockDataExampleState();
}

class _MockDataExampleState extends State<MockDataExample> {
  String _selectedGenerator = 'scatter';
  int _seed = 42;
  MockData _mock = MockData(42);

  // Generator-specific parameters
  int _count = 50;
  double _correlation = 0.0;
  int _depth = 2;
  int _nodeCount = 20;
  double _linkProbability = 0.15;

  final List<_GeneratorOption> _generators = [
    _GeneratorOption('scatter', 'Scatter Data', Icons.scatter_plot),
    _GeneratorOption('line', 'Line Data', Icons.show_chart),
    _GeneratorOption('bar', 'Bar Data', Icons.bar_chart),
    _GeneratorOption('pie', 'Pie Data', Icons.pie_chart),
    _GeneratorOption('heatmap', 'Heatmap', Icons.grid_on),
    _GeneratorOption('network', 'Network', Icons.hub),
    _GeneratorOption('tree', 'Tree', Icons.account_tree),
    _GeneratorOption('boxplot', 'Box Plot', Icons.candlestick_chart),
    _GeneratorOption('timeseries', 'Time Series', Icons.timeline),
    _GeneratorOption('distributions', 'Distributions', Icons.analytics),
  ];

  void _regenerate() {
    setState(() {
      _seed = DateTime.now().millisecondsSinceEpoch % 10000;
      _mock = MockData(_seed);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Mock Data Generators',
                style: theme.textTheme.titleMedium,
              ),
              const SizedBox(width: 16),
              Text(
                'Seed: $_seed',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const Spacer(),
              FilledButton.icon(
                onPressed: _regenerate,
                icon: const Icon(Icons.refresh, size: 18),
                label: const Text('Regenerate'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Generator selector
          SizedBox(
            height: 40,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: _generators.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (context, index) {
                final gen = _generators[index];
                final isSelected = gen.id == _selectedGenerator;
                return FilterChip(
                  selected: isSelected,
                  label: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(gen.icon, size: 16),
                      const SizedBox(width: 4),
                      Text(gen.label),
                    ],
                  ),
                  onSelected: (_) => setState(() => _selectedGenerator = gen.id),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          // Parameters and preview
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Parameters panel
                SizedBox(
                  width: 200,
                  child: _buildParametersPanel(theme),
                ),
                const SizedBox(width: 16),
                // Preview
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: theme.colorScheme.outlineVariant),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: _buildPreview(theme),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildParametersPanel(ThemeData theme) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Parameters', style: theme.textTheme.titleSmall),
            const SizedBox(height: 16),
            ..._buildParameterControls(theme),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildParameterControls(ThemeData theme) {
    switch (_selectedGenerator) {
      case 'scatter':
        return [
          _buildSlider('Count', _count.toDouble(), 10, 200, (v) {
            setState(() => _count = v.round());
          }),
          const SizedBox(height: 8),
          _buildSlider('Correlation', _correlation, -1, 1, (v) {
            setState(() => _correlation = v);
          }),
        ];
      case 'network':
        return [
          _buildSlider('Nodes', _nodeCount.toDouble(), 5, 50, (v) {
            setState(() => _nodeCount = v.round());
          }),
          const SizedBox(height: 8),
          _buildSlider('Link Prob', _linkProbability, 0.05, 0.5, (v) {
            setState(() => _linkProbability = v);
          }),
        ];
      case 'tree':
        return [
          _buildSlider('Depth', _depth.toDouble(), 1, 4, (v) {
            setState(() => _depth = v.round());
          }),
        ];
      case 'heatmap':
        return [
          _buildSlider('Size', _count.toDouble(), 5, 20, (v) {
            setState(() => _count = v.round());
          }),
        ];
      default:
        return [
          _buildSlider('Count', _count.toDouble(), 5, 100, (v) {
            setState(() => _count = v.round());
          }),
        ];
    }
  }

  Widget _buildSlider(
    String label,
    double value,
    double min,
    double max,
    ValueChanged<double> onChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: const TextStyle(fontSize: 12)),
            Text(
              value.toStringAsFixed(value == value.roundToDouble() ? 0 : 2),
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Slider(
          value: value,
          min: min,
          max: max,
          onChanged: onChanged,
        ),
      ],
    );
  }

  Widget _buildPreview(ThemeData theme) {
    switch (_selectedGenerator) {
      case 'scatter':
        return _ScatterPreview(mock: _mock, count: _count, correlation: _correlation);
      case 'line':
        return _LinePreview(mock: _mock, count: _count);
      case 'bar':
        return _BarPreview(mock: _mock, count: _count);
      case 'pie':
        return _PiePreview(mock: _mock, count: _count);
      case 'heatmap':
        return _HeatmapPreview(mock: _mock, size: _count);
      case 'network':
        return _NetworkPreview(mock: _mock, nodeCount: _nodeCount, linkProbability: _linkProbability);
      case 'tree':
        return _TreePreview(mock: _mock, depth: _depth);
      case 'boxplot':
        return _BoxPlotPreview(mock: _mock);
      case 'timeseries':
        return _TimeSeriesPreview(mock: _mock);
      case 'distributions':
        return _DistributionsPreview(mock: _mock);
      default:
        return const Center(child: Text('Select a generator'));
    }
  }
}

class _GeneratorOption {
  final String id;
  final String label;
  final IconData icon;

  _GeneratorOption(this.id, this.label, this.icon);
}

// Preview widgets for each generator type

class _ScatterPreview extends StatelessWidget {
  final MockData mock;
  final int count;
  final double correlation;

  const _ScatterPreview({required this.mock, required this.count, required this.correlation});

  @override
  Widget build(BuildContext context) {
    final data = mock.scatterData(
      count: count,
      correlation: correlation != 0 ? correlation : null,
    );

    return CustomPaint(
      painter: _ScatterPainter(data),
      size: Size.infinite,
    );
  }
}

class _ScatterPainter extends CustomPainter {
  final List<Map<String, double>> data;

  _ScatterPainter(this.data);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue.withAlpha(150)
      ..style = PaintingStyle.fill;

    final padding = 40.0;
    final chartWidth = size.width - padding * 2;
    final chartHeight = size.height - padding * 2;

    for (final point in data) {
      final x = padding + (point['x']! / 100) * chartWidth;
      final y = size.height - padding - (point['y']! / 100) * chartHeight;
      canvas.drawCircle(Offset(x, y), 4, paint);
    }

    // Draw axes
    final axisPaint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 1;
    canvas.drawLine(
      Offset(padding, size.height - padding),
      Offset(size.width - padding, size.height - padding),
      axisPaint,
    );
    canvas.drawLine(
      Offset(padding, padding),
      Offset(padding, size.height - padding),
      axisPaint,
    );
  }

  @override
  bool shouldRepaint(_ScatterPainter old) => old.data != data;
}

class _LinePreview extends StatelessWidget {
  final MockData mock;
  final int count;

  const _LinePreview({required this.mock, required this.count});

  @override
  Widget build(BuildContext context) {
    final data = mock.lineData(points: count);
    return CustomPaint(
      painter: _LinePainter(data),
      size: Size.infinite,
    );
  }
}

class _LinePainter extends CustomPainter {
  final List<Map<String, dynamic>> data;

  _LinePainter(this.data);

  @override
  void paint(Canvas canvas, Size size) {
    if (data.isEmpty) return;

    final padding = 40.0;
    final chartWidth = size.width - padding * 2;
    final chartHeight = size.height - padding * 2;

    // Find extent
    double minY = double.infinity, maxY = double.negativeInfinity;
    for (final d in data) {
      final y = (d['y'] as num).toDouble();
      if (y < minY) minY = y;
      if (y > maxY) maxY = y;
    }
    final yRange = maxY - minY;

    final path = Path();
    for (int i = 0; i < data.length; i++) {
      final x = padding + (i / (data.length - 1)) * chartWidth;
      final y = size.height - padding - ((data[i]['y'] as num).toDouble() - minY) / yRange * chartHeight;
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    final paint = Paint()
      ..color = Colors.indigo
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    canvas.drawPath(path, paint);

    // Draw axes
    final axisPaint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 1;
    canvas.drawLine(
      Offset(padding, size.height - padding),
      Offset(size.width - padding, size.height - padding),
      axisPaint,
    );
    canvas.drawLine(
      Offset(padding, padding),
      Offset(padding, size.height - padding),
      axisPaint,
    );
  }

  @override
  bool shouldRepaint(_LinePainter old) => old.data != data;
}

class _BarPreview extends StatelessWidget {
  final MockData mock;
  final int count;

  const _BarPreview({required this.mock, required this.count});

  @override
  Widget build(BuildContext context) {
    final data = mock.barData(bars: count.clamp(3, 15));
    return CustomPaint(
      painter: _BarPainter(data),
      size: Size.infinite,
    );
  }
}

class _BarPainter extends CustomPainter {
  final List<Map<String, dynamic>> data;

  _BarPainter(this.data);

  @override
  void paint(Canvas canvas, Size size) {
    if (data.isEmpty) return;

    final padding = 40.0;
    final chartWidth = size.width - padding * 2;
    final chartHeight = size.height - padding * 2;

    final barWidth = chartWidth / data.length * 0.8;
    final gap = chartWidth / data.length * 0.2;

    final maxValue = data.map((d) => (d['value'] as num).toDouble()).reduce(math.max);

    final colors = [
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.teal,
      Colors.red,
      Colors.amber,
      Colors.indigo,
    ];

    for (int i = 0; i < data.length; i++) {
      final value = (data[i]['value'] as num).toDouble();
      final barHeight = (value / maxValue) * chartHeight;
      final x = padding + i * (barWidth + gap) + gap / 2;
      final y = size.height - padding - barHeight;

      final paint = Paint()..color = colors[i % colors.length];
      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTWH(x, y, barWidth, barHeight),
          const Radius.circular(4),
        ),
        paint,
      );
    }

    // Draw axes
    final axisPaint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 1;
    canvas.drawLine(
      Offset(padding, size.height - padding),
      Offset(size.width - padding, size.height - padding),
      axisPaint,
    );
  }

  @override
  bool shouldRepaint(_BarPainter old) => old.data != data;
}

class _PiePreview extends StatelessWidget {
  final MockData mock;
  final int count;

  const _PiePreview({required this.mock, required this.count});

  @override
  Widget build(BuildContext context) {
    final data = mock.pieData(slices: count.clamp(3, 8));
    return CustomPaint(
      painter: _PiePainter(data),
      size: Size.infinite,
    );
  }
}

class _PiePainter extends CustomPainter {
  final List<Map<String, dynamic>> data;

  _PiePainter(this.data);

  @override
  void paint(Canvas canvas, Size size) {
    if (data.isEmpty) return;

    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width, size.height) / 2 - 40;
    final innerRadius = radius * 0.5;

    final total = data.map((d) => (d['value'] as num).toDouble()).reduce((a, b) => a + b);

    final colors = [
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.teal,
      Colors.red,
      Colors.amber,
      Colors.indigo,
    ];

    double startAngle = -math.pi / 2;
    for (int i = 0; i < data.length; i++) {
      final value = (data[i]['value'] as num).toDouble();
      final sweepAngle = (value / total) * 2 * math.pi;

      final paint = Paint()
        ..color = colors[i % colors.length]
        ..style = PaintingStyle.fill;

      final path = Path()
        ..moveTo(
          center.dx + innerRadius * math.cos(startAngle),
          center.dy + innerRadius * math.sin(startAngle),
        )
        ..lineTo(
          center.dx + radius * math.cos(startAngle),
          center.dy + radius * math.sin(startAngle),
        )
        ..arcTo(
          Rect.fromCircle(center: center, radius: radius),
          startAngle,
          sweepAngle,
          false,
        )
        ..lineTo(
          center.dx + innerRadius * math.cos(startAngle + sweepAngle),
          center.dy + innerRadius * math.sin(startAngle + sweepAngle),
        )
        ..arcTo(
          Rect.fromCircle(center: center, radius: innerRadius),
          startAngle + sweepAngle,
          -sweepAngle,
          false,
        )
        ..close();

      canvas.drawPath(path, paint);
      startAngle += sweepAngle;
    }
  }

  @override
  bool shouldRepaint(_PiePainter old) => old.data != data;
}

class _HeatmapPreview extends StatelessWidget {
  final MockData mock;
  final int size;

  const _HeatmapPreview({required this.mock, required this.size});

  @override
  Widget build(BuildContext context) {
    final data = mock.heatmapData(rows: size, columns: size);
    return CustomPaint(
      painter: _HeatmapPainter(data),
      size: Size.infinite,
    );
  }
}

class _HeatmapPainter extends CustomPainter {
  final List<List<double>> data;

  _HeatmapPainter(this.data);

  @override
  void paint(Canvas canvas, Size size) {
    if (data.isEmpty) return;

    final padding = 20.0;
    final rows = data.length;
    final cols = data[0].length;
    final cellWidth = (size.width - padding * 2) / cols;
    final cellHeight = (size.height - padding * 2) / rows;

    for (int r = 0; r < rows; r++) {
      for (int c = 0; c < cols; c++) {
        final value = data[r][c] / 100;
        final color = Color.lerp(Colors.blue.shade100, Colors.blue.shade900, value)!;

        final rect = Rect.fromLTWH(
          padding + c * cellWidth,
          padding + r * cellHeight,
          cellWidth - 1,
          cellHeight - 1,
        );

        canvas.drawRRect(
          RRect.fromRectAndRadius(rect, const Radius.circular(2)),
          Paint()..color = color,
        );
      }
    }
  }

  @override
  bool shouldRepaint(_HeatmapPainter old) => old.data != data;
}

class _NetworkPreview extends StatelessWidget {
  final MockData mock;
  final int nodeCount;
  final double linkProbability;

  const _NetworkPreview({
    required this.mock,
    required this.nodeCount,
    required this.linkProbability,
  });

  @override
  Widget build(BuildContext context) {
    final data = mock.networkData(nodeCount: nodeCount, linkProbability: linkProbability);
    return CustomPaint(
      painter: _NetworkPainter(data),
      size: Size.infinite,
    );
  }
}

class _NetworkPainter extends CustomPainter {
  final Map<String, dynamic> data;

  _NetworkPainter(this.data);

  @override
  void paint(Canvas canvas, Size size) {
    final nodes = data['nodes'] as List;
    final links = data['links'] as List;

    if (nodes.isEmpty) return;

    final padding = 50.0;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width, size.height) / 2 - padding;

    // Position nodes in a circle
    final positions = <String, Offset>{};
    for (int i = 0; i < nodes.length; i++) {
      final angle = (i / nodes.length) * 2 * math.pi - math.pi / 2;
      final node = nodes[i] as Map<String, dynamic>;
      positions[node['id'] as String] = Offset(
        center.dx + radius * math.cos(angle),
        center.dy + radius * math.sin(angle),
      );
    }

    // Draw links
    final linkPaint = Paint()
      ..color = Colors.grey.withAlpha(100)
      ..strokeWidth = 1;

    for (final link in links) {
      final linkMap = link as Map<String, dynamic>;
      final source = positions[linkMap['source'] as String];
      final target = positions[linkMap['target'] as String];
      if (source != null && target != null) {
        canvas.drawLine(source, target, linkPaint);
      }
    }

    // Draw nodes
    final colors = [Colors.blue, Colors.green, Colors.orange, Colors.purple, Colors.teal];
    for (final node in nodes) {
      final nodeMap = node as Map<String, dynamic>;
      final pos = positions[nodeMap['id'] as String]!;
      final groupIndex = int.parse((nodeMap['group'] as String).replaceAll('Group ', ''));
      final nodeValue = (nodeMap['value'] as num).toDouble();

      canvas.drawCircle(
        pos,
        nodeValue / 2 + 3,
        Paint()..color = colors[groupIndex % colors.length],
      );
    }
  }

  @override
  bool shouldRepaint(_NetworkPainter old) => old.data != data;
}

class _TreePreview extends StatelessWidget {
  final MockData mock;
  final int depth;

  const _TreePreview({required this.mock, required this.depth});

  @override
  Widget build(BuildContext context) {
    final data = mock.treeData(depth: depth, minChildren: 2, maxChildren: 3);
    return CustomPaint(
      painter: _TreePainter(data),
      size: Size.infinite,
    );
  }
}

class _TreePainter extends CustomPainter {
  final Map<String, dynamic> data;

  _TreePainter(this.data);

  @override
  void paint(Canvas canvas, Size size) {
    final padding = 40.0;
    _drawNode(canvas, data, padding, size.width - padding, padding, size.height - padding, 0);
  }

  void _drawNode(
    Canvas canvas,
    Map<String, dynamic> node,
    double left,
    double right,
    double top,
    double bottom,
    int level,
  ) {
    final x = (left + right) / 2;
    final y = top + 30;

    final children = node['children'] as List?;
    if (children != null && children.isNotEmpty) {
      final childWidth = (right - left) / children.length;
      final childTop = y + 40;

      for (int i = 0; i < children.length; i++) {
        final childX = left + childWidth * i + childWidth / 2;
        final childY = childTop + 30;

        // Draw link
        canvas.drawLine(
          Offset(x, y + 10),
          Offset(childX, childY - 10),
          Paint()
            ..color = Colors.grey
            ..strokeWidth = 1,
        );

        _drawNode(
          canvas,
          children[i] as Map<String, dynamic>,
          left + childWidth * i,
          left + childWidth * (i + 1),
          childTop,
          bottom,
          level + 1,
        );
      }
    }

    // Draw node
    final colors = [Colors.indigo, Colors.teal, Colors.orange, Colors.purple];
    canvas.drawCircle(
      Offset(x, y),
      12,
      Paint()..color = colors[level % colors.length],
    );
  }

  @override
  bool shouldRepaint(_TreePainter old) => old.data != data;
}

class _BoxPlotPreview extends StatelessWidget {
  final MockData mock;

  const _BoxPlotPreview({required this.mock});

  @override
  Widget build(BuildContext context) {
    final data = mock.boxPlotData(groups: 5);
    return CustomPaint(
      painter: _BoxPlotPainter(data),
      size: Size.infinite,
    );
  }
}

class _BoxPlotPainter extends CustomPainter {
  final List<Map<String, dynamic>> data;

  _BoxPlotPainter(this.data);

  @override
  void paint(Canvas canvas, Size size) {
    if (data.isEmpty) return;

    final padding = 50.0;
    final chartWidth = size.width - padding * 2;
    final chartHeight = size.height - padding * 2;

    // Find extent
    double minVal = double.infinity, maxVal = double.negativeInfinity;
    for (final d in data) {
      final samples = d['samples'] as List<double>;
      for (final s in samples) {
        if (s < minVal) minVal = s;
        if (s > maxVal) maxVal = s;
      }
    }
    final range = maxVal - minVal;

    final boxWidth = chartWidth / data.length * 0.6;
    final gap = chartWidth / data.length;

    final colors = [Colors.blue, Colors.green, Colors.orange, Colors.purple, Colors.teal];

    for (int i = 0; i < data.length; i++) {
      final d = data[i];
      final centerX = padding + i * gap + gap / 2;
      final color = colors[i % colors.length];

      final min = (d['min'] as num).toDouble();
      final q1 = (d['q1'] as num).toDouble();
      final median = (d['median'] as num).toDouble();
      final q3 = (d['q3'] as num).toDouble();
      final max = (d['max'] as num).toDouble();

      double toY(double v) => size.height - padding - ((v - minVal) / range) * chartHeight;

      // Whisker
      canvas.drawLine(
        Offset(centerX, toY(min)),
        Offset(centerX, toY(max)),
        Paint()
          ..color = color
          ..strokeWidth = 1,
      );

      // Min/max caps
      canvas.drawLine(
        Offset(centerX - boxWidth / 4, toY(min)),
        Offset(centerX + boxWidth / 4, toY(min)),
        Paint()
          ..color = color
          ..strokeWidth = 2,
      );
      canvas.drawLine(
        Offset(centerX - boxWidth / 4, toY(max)),
        Offset(centerX + boxWidth / 4, toY(max)),
        Paint()
          ..color = color
          ..strokeWidth = 2,
      );

      // Box
      final boxRect = Rect.fromLTRB(
        centerX - boxWidth / 2,
        toY(q3),
        centerX + boxWidth / 2,
        toY(q1),
      );
      canvas.drawRRect(
        RRect.fromRectAndRadius(boxRect, const Radius.circular(4)),
        Paint()..color = color.withAlpha(100),
      );
      canvas.drawRRect(
        RRect.fromRectAndRadius(boxRect, const Radius.circular(4)),
        Paint()
          ..color = color
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2,
      );

      // Median
      canvas.drawLine(
        Offset(centerX - boxWidth / 2, toY(median)),
        Offset(centerX + boxWidth / 2, toY(median)),
        Paint()
          ..color = color
          ..strokeWidth = 2,
      );
    }
  }

  @override
  bool shouldRepaint(_BoxPlotPainter old) => old.data != data;
}

class _TimeSeriesPreview extends StatelessWidget {
  final MockData mock;

  const _TimeSeriesPreview({required this.mock});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final data = mock.timeSeries.stockPrice(
      start: now.subtract(const Duration(days: 90)),
      end: now,
      interval: const Duration(days: 1),
      startPrice: 100,
    );
    return CustomPaint(
      painter: _TimeSeriesPainter(data),
      size: Size.infinite,
    );
  }
}

class _TimeSeriesPainter extends CustomPainter {
  final List<TimeSeriesPoint> data;

  _TimeSeriesPainter(this.data);

  @override
  void paint(Canvas canvas, Size size) {
    if (data.isEmpty) return;

    final padding = 40.0;
    final chartWidth = size.width - padding * 2;
    final chartHeight = size.height - padding * 2;

    double minY = double.infinity, maxY = double.negativeInfinity;
    for (final d in data) {
      if (d.value < minY) minY = d.value;
      if (d.value > maxY) maxY = d.value;
    }
    final yRange = maxY - minY;

    // Draw area
    final areaPath = Path();
    for (int i = 0; i < data.length; i++) {
      final x = padding + (i / (data.length - 1)) * chartWidth;
      final y = size.height - padding - ((data[i].value - minY) / yRange) * chartHeight;
      if (i == 0) {
        areaPath.moveTo(x, y);
      } else {
        areaPath.lineTo(x, y);
      }
    }
    areaPath.lineTo(size.width - padding, size.height - padding);
    areaPath.lineTo(padding, size.height - padding);
    areaPath.close();

    canvas.drawPath(
      areaPath,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.green.withAlpha(100), Colors.green.withAlpha(20)],
        ).createShader(Rect.fromLTWH(padding, padding, chartWidth, chartHeight)),
    );

    // Draw line
    final linePath = Path();
    for (int i = 0; i < data.length; i++) {
      final x = padding + (i / (data.length - 1)) * chartWidth;
      final y = size.height - padding - ((data[i].value - minY) / yRange) * chartHeight;
      if (i == 0) {
        linePath.moveTo(x, y);
      } else {
        linePath.lineTo(x, y);
      }
    }

    canvas.drawPath(
      linePath,
      Paint()
        ..color = Colors.green
        ..strokeWidth = 2
        ..style = PaintingStyle.stroke,
    );

    // Draw axes
    canvas.drawLine(
      Offset(padding, size.height - padding),
      Offset(size.width - padding, size.height - padding),
      Paint()
        ..color = Colors.grey
        ..strokeWidth = 1,
    );
  }

  @override
  bool shouldRepaint(_TimeSeriesPainter old) => old.data != data;
}

class _DistributionsPreview extends StatelessWidget {
  final MockData mock;

  const _DistributionsPreview({required this.mock});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _DistributionsPainter(mock.random),
      size: Size.infinite,
    );
  }
}

class _DistributionsPainter extends CustomPainter {
  final RandomGenerator random;

  _DistributionsPainter(this.random);

  @override
  void paint(Canvas canvas, Size size) {
    final padding = 40.0;
    final chartWidth = size.width - padding * 2;
    final chartHeight = (size.height - padding * 2) / 3;

    final distributions = [
      ('Normal', random.normalList(500, 50, 15), Colors.blue),
      ('Exponential', List.generate(500, (_) => random.exponential(0.1)), Colors.orange),
      ('Uniform', random.uniformList(500, 0, 100), Colors.green),
    ];

    for (int d = 0; d < distributions.length; d++) {
      final (name, values, color) = distributions[d];
      final yOffset = padding + d * chartHeight;

      // Create histogram
      final bins = List.filled(20, 0);
      final minV = values.reduce(math.min);
      final maxV = values.reduce(math.max);
      final range = maxV - minV;

      for (final v in values) {
        final binIndex = ((v - minV) / range * 19).floor().clamp(0, 19);
        bins[binIndex]++;
      }

      final maxBin = bins.reduce(math.max);
      final barWidth = chartWidth / bins.length;

      for (int i = 0; i < bins.length; i++) {
        final barHeight = (bins[i] / maxBin) * (chartHeight - 20);
        final rect = Rect.fromLTWH(
          padding + i * barWidth,
          yOffset + chartHeight - 10 - barHeight,
          barWidth - 1,
          barHeight,
        );
        canvas.drawRect(rect, Paint()..color = color.withAlpha(180));
      }

      // Label
      final textPainter = TextPainter(
        text: TextSpan(
          text: name,
          style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.bold),
        ),
        textDirection: TextDirection.ltr,
      );
      textPainter.layout();
      textPainter.paint(canvas, Offset(padding, yOffset));
    }
  }

  @override
  bool shouldRepaint(_DistributionsPainter old) => true;
}
