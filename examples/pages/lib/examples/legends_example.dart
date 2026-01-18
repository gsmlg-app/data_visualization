import 'package:flutter/material.dart';
import 'package:data_visualization/data_visualization.dart';

class LegendsExample extends StatefulWidget {
  const LegendsExample({super.key});

  @override
  State<LegendsExample> createState() => _LegendsExampleState();
}

class _LegendsExampleState extends State<LegendsExample> {
  String _legendPosition = 'Bottom';
  final _positions = ['Top', 'Bottom', 'Left', 'Right'];

  final _series = [
    ('Revenue', Colors.indigo, [65, 70, 80, 75, 90, 95]),
    ('Expenses', Colors.teal, [45, 50, 55, 48, 60, 58]),
    ('Profit', Colors.orange, [20, 20, 25, 27, 30, 37]),
  ];

  final _visibleSeries = <String>{'Revenue', 'Expenses', 'Profit'};

  @override
  Widget build(BuildContext context) {
    final isVertical = _legendPosition == 'Left' || _legendPosition == 'Right';

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Legends',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const Spacer(),
              const Text('Position: '),
              const SizedBox(width: 8),
              DropdownButton<String>(
                value: _legendPosition,
                items: _positions.map((p) {
                  return DropdownMenuItem(value: p, child: Text(p));
                }).toList(),
                onChanged: (v) => setState(() => _legendPosition = v!),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: _buildChartWithLegend(isVertical),
          ),
        ],
      ),
    );
  }

  Widget _buildChartWithLegend(bool isVertical) {
    final legend = _buildLegend(isVertical);
    final chart = Expanded(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return CustomPaint(
            size: Size(constraints.maxWidth, constraints.maxHeight),
            painter: LegendsChartPainter(
              series: _series,
              visibleSeries: _visibleSeries,
            ),
          );
        },
      ),
    );

    switch (_legendPosition) {
      case 'Top':
        return Column(
          children: [legend, const SizedBox(height: 16), chart],
        );
      case 'Bottom':
        return Column(
          children: [chart, const SizedBox(height: 16), legend],
        );
      case 'Left':
        return Row(
          children: [legend, const SizedBox(width: 16), chart],
        );
      case 'Right':
        return Row(
          children: [chart, const SizedBox(width: 16), legend],
        );
      default:
        return chart;
    }
  }

  Widget _buildLegend(bool isVertical) {
    final items = _series.map((s) {
      final isVisible = _visibleSeries.contains(s.$1);
      return InkWell(
        onTap: () {
          setState(() {
            if (isVisible && _visibleSeries.length > 1) {
              _visibleSeries.remove(s.$1);
            } else {
              _visibleSeries.add(s.$1);
            }
          });
        },
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  color: isVisible ? s.$2 : Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                s.$1,
                style: TextStyle(
                  color: isVisible ? Colors.black87 : Colors.grey,
                  fontWeight: isVisible ? FontWeight.w500 : FontWeight.normal,
                  decoration: isVisible ? null : TextDecoration.lineThrough,
                ),
              ),
            ],
          ),
        ),
      );
    }).toList();

    if (isVertical) {
      return Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                'Series',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
            const Divider(height: 1),
            ...items,
          ],
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        alignment: WrapAlignment.center,
        children: items,
      ),
    );
  }
}

class LegendsChartPainter extends CustomPainter {
  final List<(String, Color, List<int>)> series;
  final Set<String> visibleSeries;

  LegendsChartPainter({
    required this.series,
    required this.visibleSeries,
  });

  @override
  void paint(Canvas canvas, Size size) {
    const margin = EdgeInsets.only(left: 50, right: 20, top: 20, bottom: 40);
    final chartWidth = size.width - margin.left - margin.right;
    final chartHeight = size.height - margin.top - margin.bottom;

    final categories = ['Q1', 'Q2', 'Q3', 'Q4', 'Q5', 'Q6'];

    final xScale = scaleBand<String>(
      domain: categories,
      range: [margin.left, margin.left + chartWidth],
      paddingInner: 0.2,
      paddingOuter: 0.1,
    );

    final yScale = scaleLinear(
      domain: [0, 100],
      range: [margin.top + chartHeight, margin.top],
    );

    // Draw grid
    for (double y = 0; y <= 100; y += 20) {
      canvas.drawLine(
        Offset(margin.left, yScale(y)),
        Offset(margin.left + chartWidth, yScale(y)),
        Paint()..color = Colors.grey.withAlpha(50),
      );
    }

    // Draw axes
    final axisPaint = Paint()
      ..color = Colors.black54
      ..strokeWidth = 1;

    canvas.drawLine(
      Offset(margin.left, margin.top),
      Offset(margin.left, margin.top + chartHeight),
      axisPaint,
    );
    canvas.drawLine(
      Offset(margin.left, margin.top + chartHeight),
      Offset(margin.left + chartWidth, margin.top + chartHeight),
      axisPaint,
    );

    // Draw lines for visible series
    final curve = curveCatmullRom();

    for (final s in series) {
      if (!visibleSeries.contains(s.$1)) continue;

      final points = <Point>[];
      for (int i = 0; i < s.$3.length; i++) {
        points.add(Point(
          xScale(categories[i]) + xScale.bandwidth / 2,
          yScale(s.$3[i].toDouble()),
        ));
      }

      final curvePoints = curve.generate(points);
      if (curvePoints.isNotEmpty) {
        final path = Path()..moveTo(curvePoints.first.x, curvePoints.first.y);
        for (int i = 1; i < curvePoints.length; i++) {
          path.lineTo(curvePoints[i].x, curvePoints[i].y);
        }
        canvas.drawPath(
          path,
          Paint()
            ..color = s.$2
            ..strokeWidth = 2.5
            ..style = PaintingStyle.stroke,
        );
      }

      // Draw points
      for (final p in points) {
        canvas.drawCircle(Offset(p.x, p.y), 5, Paint()..color = s.$2);
        canvas.drawCircle(Offset(p.x, p.y), 2, Paint()..color = Colors.white);
      }
    }

    // Draw labels
    final textPainter = TextPainter(textDirection: TextDirection.ltr);

    for (double y = 0; y <= 100; y += 20) {
      textPainter.text = TextSpan(
        text: '\$${y.toInt()}K',
        style: const TextStyle(color: Colors.black54, fontSize: 11),
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(margin.left - textPainter.width - 8, yScale(y) - textPainter.height / 2),
      );
    }

    for (int i = 0; i < categories.length; i++) {
      textPainter.text = TextSpan(
        text: categories[i],
        style: const TextStyle(color: Colors.black54, fontSize: 11),
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(
          xScale(categories[i]) + xScale.bandwidth / 2 - textPainter.width / 2,
          margin.top + chartHeight + 8,
        ),
      );
    }
  }

  @override
  bool shouldRepaint(covariant LegendsChartPainter oldDelegate) =>
      oldDelegate.visibleSeries != visibleSeries;
}
