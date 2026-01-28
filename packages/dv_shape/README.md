# dv_shape

Shape generators (arc, line, area, pie)

Part of the [data_visualization](https://pub.dev/packages/data_visualization) package suite.

📚 **[Live Examples](https://gsmlg-app.github.io/data_visualization/)** | **[Documentation](https://gsmlg-app.github.io/data_visualization/#/docs)**

## Overview

Provides shape generators inspired by D3.js for creating paths for arcs, lines, areas, pies, and other shapes.

## Features

- Arc generator for pie/donut charts
- Line generator with curves
- Area generator
- Pie layout generator
- Stack layout for stacked charts

## Installation

```yaml
dependencies:
  dv_shape: ^1.1.0
```

## Usage

import 'package:dv_shape/dv_shape.dart';
import 'dart:math';

// Create a pie arc
final arcGen = arc()
  ..innerRadius = 50
  ..outerRadius = 100
  ..startAngle = 0
  ..endAngle = pi / 2;

final path = arcGen.generate();

// Create a line with curve
final lineGen = line()
  ..x = (d) => d['x']
  ..y = (d) => d['y']
  ..curve = curveCatmullRom();

final data = [
  {'x': 0, 'y': 0},
  {'x': 50, 'y': 100},
  {'x': 100, 'y': 50},
];
final linePath = lineGen.generate(data);


## Documentation

For complete API documentation and interactive examples, visit:
- [Interactive Gallery](https://gsmlg-app.github.io/data_visualization/)
- [API Reference](https://pub.dev/documentation/dv_shape/latest/)

## Related Packages

This package is part of the data_visualization suite. See all packages at [pub.dev/publishers/gsmlg.dev](https://pub.dev/publishers/gsmlg.dev/packages).

## License

MIT License - see [LICENSE](LICENSE) for details.
