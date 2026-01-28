# dv_annotation

Chart annotations (labels, callouts, reference lines)

Part of the [data_visualization](https://pub.dev/packages/data_visualization) package suite.

📚 **[Live Examples](https://gsmlg-app.github.io/data_visualization/)** | **[Documentation](https://gsmlg-app.github.io/data_visualization/#/docs)**

## Overview

Provides annotation components for highlighting data points, adding reference lines, and displaying callouts.

## Features

- Reference lines
- Callout annotations
- Label annotations
- Custom positioning
- Arrow connectors

## Installation

```yaml
dependencies:
  dv_annotation: ^1.1.0
```

## Usage

import 'package:dv_annotation/dv_annotation.dart';
import 'package:flutter/material.dart';

// Reference line
ReferenceLine(
  value: 50,
  orientation: Orientation.horizontal,
  label: 'Target',
  color: Colors.red,
  strokeWidth: 2,
)

// Callout annotation
Callout(
  position: Point(100, 50),
  label: 'Important point',
  arrowLength: 20,
)


## Documentation

For complete API documentation and interactive examples, visit:
- [Interactive Gallery](https://gsmlg-app.github.io/data_visualization/)
- [API Reference](https://pub.dev/documentation/dv_annotation/latest/)

## Related Packages

This package is part of the data_visualization suite. See all packages at [pub.dev/publishers/gsmlg.dev](https://pub.dev/publishers/gsmlg.dev/packages).

## License

MIT License - see [LICENSE](LICENSE) for details.
