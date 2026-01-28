# dv_zoom

Zoom and pan interactions

Part of the [data_visualization](https://pub.dev/packages/data_visualization) package suite.

📚 **[Live Examples](https://gsmlg-app.github.io/data_visualization/)** | **[Documentation](https://gsmlg-app.github.io/data_visualization/#/docs)**

## Overview

Provides zoom and pan interactions for charts with support for mouse wheel zoom, pinch-to-zoom, and programmatic control.

## Features

- Mouse wheel zoom
- Pinch-to-zoom
- Pan support
- Zoom constraints
- Transform state management

## Installation

```yaml
dependencies:
  dv_zoom: ^1.1.0
```

## Usage

import 'package:dv_zoom/dv_zoom.dart';

Zoom(
  scaleExtent: [0.5, 10],
  onZoom: (transform) {
    setState(() {
      _zoomTransform = transform;
      // Update scales with transform
      _xScale = _baseXScale.rescale(transform.k, transform.x);
    });
  },
  child: CustomPaint(
    painter: MyChartPainter(transform: _zoomTransform),
  ),
)


## Documentation

For complete API documentation and interactive examples, visit:
- [Interactive Gallery](https://gsmlg-app.github.io/data_visualization/)
- [API Reference](https://pub.dev/documentation/dv_zoom/latest/)

## Related Packages

This package is part of the data_visualization suite. See all packages at [pub.dev/publishers/gsmlg.dev](https://pub.dev/publishers/gsmlg.dev/packages).

## License

MIT License - see [LICENSE](LICENSE) for details.
