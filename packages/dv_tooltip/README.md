# dv_tooltip

Tooltip components for data display

Part of the [data_visualization](https://pub.dev/packages/data_visualization) package suite.

📚 **[Live Examples](https://gsmlg-app.github.io/data_visualization/)** | **[Documentation](https://gsmlg-app.github.io/data_visualization/#/docs)**

## Overview

Provides tooltip components for displaying data on hover with customizable positioning and content.

## Features

- Automatic positioning
- Custom content
- Follow cursor mode
- Sticky tooltips
- Multiple positioning strategies

## Installation

```yaml
dependencies:
  dv_tooltip: ^1.1.0
```

## Usage

import 'package:dv_tooltip/dv_tooltip.dart';
import 'package:flutter/material.dart';

Tooltip(
  message: 'Value: 42',
  position: TooltipPosition.top,
  child: Container(
    width: 20,
    height: 20,
    color: Colors.blue,
  ),
)


## Documentation

For complete API documentation and interactive examples, visit:
- [Interactive Gallery](https://gsmlg-app.github.io/data_visualization/)
- [API Reference](https://pub.dev/documentation/dv_tooltip/latest/)

## Related Packages

This package is part of the data_visualization suite. See all packages at [pub.dev/publishers/gsmlg.dev](https://pub.dev/publishers/gsmlg.dev/packages).

## License

MIT License - see [LICENSE](LICENSE) for details.
