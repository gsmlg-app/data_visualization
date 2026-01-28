# dv_brush

Brush selection for data filtering

Part of the [data_visualization](https://pub.dev/packages/data_visualization) package suite.

📚 **[Live Examples](https://gsmlg-app.github.io/data_visualization/)** | **[Documentation](https://gsmlg-app.github.io/data_visualization/#/docs)**

## Overview

Provides brush selection for filtering data with support for 1D and 2D brush selection and customizable appearance.

## Features

- 1D brush selection
- 2D brush selection
- Programmatic control
- Selection events
- Customizable styling

## Installation

```yaml
dependencies:
  dv_brush: ^1.1.0
```

## Usage

import 'package:dv_brush/dv_brush.dart';

Brush(
  width: 400,
  height: 300,
  onBrush: (selection) {
    final filtered = data.where((d) =>
      d.x >= selection.x0 &&
      d.x <= selection.x1 &&
      d.y >= selection.y0 &&
      d.y <= selection.y1
    ).toList();
    setState(() => filteredData = filtered);
  },
)


## Documentation

For complete API documentation and interactive examples, visit:
- [Interactive Gallery](https://gsmlg-app.github.io/data_visualization/)
- [API Reference](https://pub.dev/documentation/dv_brush/latest/)

## Related Packages

This package is part of the data_visualization suite. See all packages at [pub.dev/publishers/gsmlg.dev](https://pub.dev/publishers/gsmlg.dev/packages).

## License

MIT License - see [LICENSE](LICENSE) for details.
