# dv_responsive

Responsive layout utilities

Part of the [data_visualization](https://pub.dev/packages/data_visualization) package suite.

📚 **[Live Examples](https://gsmlg-app.github.io/data_visualization/)** | **[Documentation](https://gsmlg-app.github.io/data_visualization/#/docs)**

## Overview

Provides utilities for responsive chart layouts that automatically adjust based on container size.

## Features

- Responsive sizing
- Container-based dimensions
- Aspect ratio preservation
- Breakpoint support

## Installation

```yaml
dependencies:
  dv_responsive: ^1.1.0
```

## Usage

import 'package:dv_responsive/dv_responsive.dart';
import 'package:flutter/material.dart';

ResponsiveChart(
  builder: (context, size) {
    return CustomPaint(
      size: size,
      painter: MyChartPainter(
        width: size.width,
        height: size.height,
      ),
    );
  },
)


## Documentation

For complete API documentation and interactive examples, visit:
- [Interactive Gallery](https://gsmlg-app.github.io/data_visualization/)
- [API Reference](https://pub.dev/documentation/dv_responsive/latest/)

## Related Packages

This package is part of the data_visualization suite. See all packages at [pub.dev/publishers/gsmlg.dev](https://pub.dev/publishers/gsmlg.dev/packages).

## License

MIT License - see [LICENSE](LICENSE) for details.
