# dv_grid

Grid lines for charts

Part of the [data_visualization](https://pub.dev/packages/data_visualization) package suite.

📚 **[Live Examples](https://gsmlg-app.github.io/data_visualization/)** | **[Documentation](https://gsmlg-app.github.io/data_visualization/#/docs)**

## Overview

Provides grid line components for charts with support for horizontal, vertical, and custom grid patterns.

## Features

- Horizontal grid lines
- Vertical grid lines
- Customizable styling
- Grid based on scales

## Installation

```yaml
dependencies:
  dv_grid: ^1.1.0
```

## Usage

import 'package:dv_grid/dv_grid.dart';
import 'package:dv_scale/dv_scale.dart';
import 'package:flutter/material.dart';

final grid = Grid(
  xScale: xScale,
  yScale: yScale,
  width: 400,
  height: 300,
  color: Colors.grey.withOpacity(0.2),
  strokeWidth: 1,
)


## Documentation

For complete API documentation and interactive examples, visit:
- [Interactive Gallery](https://gsmlg-app.github.io/data_visualization/)
- [API Reference](https://pub.dev/documentation/dv_grid/latest/)

## Related Packages

This package is part of the data_visualization suite. See all packages at [pub.dev/publishers/gsmlg.dev](https://pub.dev/publishers/gsmlg.dev/packages).

## License

MIT License - see [LICENSE](LICENSE) for details.
