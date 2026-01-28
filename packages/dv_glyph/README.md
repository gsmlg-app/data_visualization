# dv_glyph

Symbol generators (circle, square, triangle, etc.)

Part of the [data_visualization](https://pub.dev/packages/data_visualization) package suite.

📚 **[Live Examples](https://gsmlg-app.github.io/data_visualization/)** | **[Documentation](https://gsmlg-app.github.io/data_visualization/#/docs)**

## Overview

Provides symbol generators for scatter plots and markers including circle, square, triangle, diamond, cross, and custom symbols.

## Features

- Circle symbols
- Square symbols
- Triangle symbols
- Diamond symbols
- Cross symbols
- Custom symbol support

## Installation

```yaml
dependencies:
  dv_glyph: ^1.1.0
```

## Usage

import 'package:dv_glyph/dv_glyph.dart';

// Use predefined symbols
final symbols = [
  symbolCircle,
  symbolSquare,
  symbolTriangle,
  symbolDiamond,
  symbolCross,
];

// Draw symbols at different points
for (int i = 0; i < data.length; i++) {
  final symbol = symbols[i % symbols.length];
  final path = symbol.draw(size: 64);
  canvas.save();
  canvas.translate(data[i].x, data[i].y);
  canvas.drawPath(path, paint);
  canvas.restore();
}


## Documentation

For complete API documentation and interactive examples, visit:
- [Interactive Gallery](https://gsmlg-app.github.io/data_visualization/)
- [API Reference](https://pub.dev/documentation/dv_glyph/latest/)

## Related Packages

This package is part of the data_visualization suite. See all packages at [pub.dev/publishers/gsmlg.dev](https://pub.dev/publishers/gsmlg.dev/packages).

## License

MIT License - see [LICENSE](LICENSE) for details.
