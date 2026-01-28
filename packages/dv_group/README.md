# dv_group

SVG-like group with transforms

Part of the [data_visualization](https://pub.dev/packages/data_visualization) package suite.

📚 **[Live Examples](https://gsmlg-app.github.io/data_visualization/)** | **[Documentation](https://gsmlg-app.github.io/data_visualization/#/docs)**

## Overview

Provides SVG-like group functionality with support for transforms, clipping, and opacity.

## Features

- Transform support (translate, rotate, scale)
- Clipping paths
- Opacity control
- Nested groups

## Installation

```yaml
dependencies:
  dv_group: ^1.1.0
```

## Usage

import 'package:dv_group/dv_group.dart';
import 'package:flutter/material.dart';

Group(
  transform: Matrix4.translationValues(100, 50, 0),
  opacity: 0.8,
  child: CustomPaint(
    painter: MyPainter(),
  ),
)


## Documentation

For complete API documentation and interactive examples, visit:
- [Interactive Gallery](https://gsmlg-app.github.io/data_visualization/)
- [API Reference](https://pub.dev/documentation/dv_group/latest/)

## Related Packages

This package is part of the data_visualization suite. See all packages at [pub.dev/publishers/gsmlg.dev](https://pub.dev/publishers/gsmlg.dev/packages).

## License

MIT License - see [LICENSE](LICENSE) for details.
