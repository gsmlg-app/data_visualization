# dv_heatmap

Heatmap chart component

Part of the [data_visualization](https://pub.dev/packages/data_visualization) package suite.

📚 **[Live Examples](https://gsmlg-app.github.io/data_visualization/)** | **[Documentation](https://gsmlg-app.github.io/data_visualization/#/docs)**

## Overview

Provides heatmap chart components for visualizing matrix data with color intensity.

## Features

- Matrix visualization
- Color scale mapping
- Custom color schemes
- Cell tooltips
- Row/column labels

## Installation

```yaml
dependencies:
  dv_heatmap: ^1.1.0
```

## Usage

import 'package:dv_heatmap/dv_heatmap.dart';
import 'package:dv_scale/dv_scale.dart';

Heatmap(
  data: matrix,
  xLabels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri'],
  yLabels: ['Week 1', 'Week 2', 'Week 3'],
  colorScale: scaleSequential(
    domain: [0, 100],
    range: [Colors.blue.shade50, Colors.blue.shade900],
  ),
  onCellTap: (row, col, value) {
    print('Cell ($row, $col): $value');
  },
)


## Documentation

For complete API documentation and interactive examples, visit:
- [Interactive Gallery](https://gsmlg-app.github.io/data_visualization/)
- [API Reference](https://pub.dev/documentation/dv_heatmap/latest/)

## Related Packages

This package is part of the data_visualization suite. See all packages at [pub.dev/publishers/gsmlg.dev](https://pub.dev/publishers/gsmlg.dev/packages).

## License

MIT License - see [LICENSE](LICENSE) for details.
