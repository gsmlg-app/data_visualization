# dv_scale

Scale functions for mapping data to visual dimensions

Part of the [data_visualization](https://pub.dev/packages/data_visualization) package suite.

📚 **[Live Examples](https://gsmlg-app.github.io/data_visualization/)** | **[Documentation](https://gsmlg-app.github.io/data_visualization/#/docs)**

## Overview

Scale functions transform data values (domain) to visual values (range). Includes linear, logarithmic, power, time, ordinal, and band scales inspired by D3.js.

## Features

- Linear scales for continuous data
- Logarithmic and power scales
- Time scales for temporal data
- Band scales for categorical data with spacing
- Ordinal scales for discrete mappings
- Color scales for gradients

## Installation

```yaml
dependencies:
  dv_scale: ^1.1.0
```

## Usage

import 'package:dv_scale/dv_scale.dart';

// Linear scale: map data 0-100 to pixels 0-500
final xScale = scaleLinear(
  domain: [0, 100],
  range: [0, 500],
);
final x = xScale(50); // 250

// Band scale for bar chart categories
final categoryScale = scaleBand(
  domain: ['A', 'B', 'C', 'D'],
  range: [0, 400],
  padding: 0.1,
);
final barWidth = categoryScale.bandwidth;
final position = categoryScale('B');

// Logarithmic scale
final logScale = scaleLog(
  domain: [1, 1000],
  range: [0, 300],
);


## Documentation

For complete API documentation and interactive examples, visit:
- [Interactive Gallery](https://gsmlg-app.github.io/data_visualization/)
- [API Reference](https://pub.dev/documentation/dv_scale/latest/)

## Related Packages

This package is part of the data_visualization suite. See all packages at [pub.dev/publishers/gsmlg.dev](https://pub.dev/publishers/gsmlg.dev/packages).

## License

MIT License - see [LICENSE](LICENSE) for details.
