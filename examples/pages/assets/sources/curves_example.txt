import 'package:flutter/material.dart' hide Curve;
import 'package:data_visualization/data_visualization.dart';

class CurvesExample extends StatefulWidget {
  const CurvesExample({super.key});

  @override
  State<CurvesExample> createState() => _CurvesExampleState();
}

class _CurvesExampleState extends State<CurvesExample> {
  String _selectedCurve = 'Linear';

  final curveTypes = [
    'Linear',
    'Basis',
    'Cardinal',
    'Catmull-Rom',
    'Monotone',
    'Natural',
    'Step',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: curveTypes.map((c) {
              return ChoiceChip(
                label: Text(c),
                selected: _selectedCurve == c,
                onSelected: (_) => setState(() => _selectedCurve = c),
              );
            }).toList(),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: CustomPaint(
              size: Size.infinite,
              painter: CurvePainter(curveType: _selectedCurve),
            ),
          ),
        ],
      ),
    );
  }
}

class CurvePainter extends CustomPainter {
  final String curveType;

  CurvePainter({required this.curveType});

  @override
  void paint(Canvas canvas, Size size) {
    const margin = EdgeInsets.only(left: 40, right: 40, top: 40, bottom: 40);
    final chartWidth = size.width - margin.left - margin.right;
    final chartHeight = size.height - margin.top - margin.bottom;

    // Sample data points
    const rawPoints = [
      Point(0, 30),
      Point(1, 80),
      Point(2, 45),
      Point(3, 60),
      Point(4, 20),
      Point(5, 90),
      Point(6, 55),
      Point(7, 40),
    ];

    final xScale = scaleLinear(
      domain: [0, 7],
      range: [margin.left, margin.left + chartWidth],
    );

    final yScale = scaleLinear(
      domain: [0, 100],
      range: [margin.top + chartHeight, margin.top],
    );

    // Scale points
    final points = rawPoints.map((p) => Point(xScale(p.x), yScale(p.y))).toList();

    // Get curve
    Curve curve;
    switch (curveType) {
      case 'Basis':
        curve = curveBasis();
        break;
      case 'Cardinal':
        curve = curveCardinal(tension: 0.5);
        break;
      case 'Catmull-Rom':
        curve = curveCatmullRom();
        break;
      case 'Monotone':
        curve = curveMonotoneX();
        break;
      case 'Natural':
        curve = curveNatural();
        break;
      case 'Step':
        curve = curveStep();
        break;
      default:
        curve = curveLinear();
    }

    // Generate smooth curve points
    final curvePoints = curve.generate(points);

    // Draw grid
    final gridPaint = Paint()
      ..color = Colors.grey.withAlpha(50)
      ..strokeWidth = 1;

    for (double y = 0; y <= 100; y += 25) {
      final py = yScale(y);
      canvas.drawLine(
        Offset(margin.left, py),
        Offset(margin.left + chartWidth, py),
        gridPaint,
      );
    }

    // Draw curve
    if (curvePoints.isNotEmpty) {
      final path = Path();
      path.moveTo(curvePoints.first.x, curvePoints.first.y);
      for (int i = 1; i < curvePoints.length; i++) {
        path.lineTo(curvePoints[i].x, curvePoints[i].y);
      }

      canvas.drawPath(
        path,
        Paint()
          ..color = Colors.indigo
          ..strokeWidth = 2.5
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round
          ..strokeJoin = StrokeJoin.round,
      );
    }

    // Draw data points
    for (final p in points) {
      canvas.drawCircle(
        Offset(p.x, p.y),
        6,
        Paint()..color = Colors.indigo,
      );
      canvas.drawCircle(
        Offset(p.x, p.y),
        3,
        Paint()..color = Colors.white,
      );
    }
  }

  @override
  bool shouldRepaint(CurvePainter oldDelegate) => oldDelegate.curveType != curveType;
}
