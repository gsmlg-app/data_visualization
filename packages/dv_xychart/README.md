# dv_xychart

XY chart components (bar, line, scatter, area)

Part of the [data_visualization](https://pub.dev/packages/data_visualization) package suite.

📚 **[Live Examples](https://gsmlg-app.github.io/data_visualization/)** | **[Documentation](https://gsmlg-app.github.io/data_visualization/#/docs)**

## Overview

Provides XY chart components including bar charts, line charts, scatter plots, and area charts.

## Features

- Bar series (grouped, stacked)
- Line series with curves
- Scatter series
- Area series
- Multiple series support
- Interactive tooltips

## Installation

```yaml
dependencies:
  dv_xychart: ^1.1.0
```

## Usage

import 'package:dv_xychart/dv_xychart.dart';
import 'package:flutter/material.dart';

XYChart(
  data: data,
  series: [
    LineSeries(
      xValue: (d) => d['x'],
      yValue: (d) => d['y'],
      color: Colors.blue,
      strokeWidth: 2,
    ),
    ScatterSeries(
      xValue: (d) => d['x'],
      yValue: (d) => d['y'],
      color: Colors.red,
      size: 4,
    ),
  ],
  xAxis: Axis(label: 'X Axis'),
  yAxis: Axis(label: 'Y Axis'),
)


## Documentation

For complete API documentation and interactive examples, visit:
- [Interactive Gallery](https://gsmlg-app.github.io/data_visualization/)
- [API Reference](https://pub.dev/documentation/dv_xychart/latest/)

## Related Packages

This package is part of the data_visualization suite. See all packages at [pub.dev/publishers/gsmlg.dev](https://pub.dev/publishers/gsmlg.dev/packages).

## License

MIT License - see [LICENSE](LICENSE) for details.
