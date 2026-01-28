# dv_curve

Curve interpolation algorithms for smooth lines

Part of the [data_visualization](https://pub.dev/packages/data_visualization) package suite.

📚 **[Live Examples](https://gsmlg-app.github.io/data_visualization/)** | **[Documentation](https://gsmlg-app.github.io/data_visualization/#/docs)**

## Overview

Provides curve interpolation algorithms for creating smooth lines through data points. Includes linear, cardinal, Catmull-Rom, basis, step, and natural spline curves.

## Features

- Linear interpolation
- Catmull-Rom splines
- Cardinal splines with tension
- Basis splines
- Step functions
- Natural cubic splines

## Installation

```yaml
dependencies:
  dv_curve: ^1.1.0
```

## Usage

import 'package:dv_curve/dv_curve.dart';
import 'package:dv_point/dv_point.dart';

final points = [
  Point(0, 0),
  Point(50, 100),
  Point(100, 50),
  Point(150, 80),
];

// Create smooth Catmull-Rom curve
final curve = curveCatmullRom(alpha: 0.5);
final smoothPoints = curve.generate(points);

// Create cardinal spline with tension
final cardinalCurve = curveCardinal(tension: 0.5);
final cardinalPoints = cardinalCurve.generate(points);

// Step curve for step charts
final stepCurve = curveStep();
final stepPoints = stepCurve.generate(points);


## Documentation

For complete API documentation and interactive examples, visit:
- [Interactive Gallery](https://gsmlg-app.github.io/data_visualization/)
- [API Reference](https://pub.dev/documentation/dv_curve/latest/)

## Related Packages

This package is part of the data_visualization suite. See all packages at [pub.dev/publishers/gsmlg.dev](https://pub.dev/publishers/gsmlg.dev/packages).

## License

MIT License - see [LICENSE](LICENSE) for details.
