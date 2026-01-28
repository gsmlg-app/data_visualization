# dv_legend

Legend components for charts

Part of the [data_visualization](https://pub.dev/packages/data_visualization) package suite.

📚 **[Live Examples](https://gsmlg-app.github.io/data_visualization/)** | **[Documentation](https://gsmlg-app.github.io/data_visualization/#/docs)**

## Overview

Provides legend components for charts including categorical legends, continuous color legends, and size legends.

## Features

- Categorical legends
- Continuous color legends
- Size legends
- Customizable layout
- Interactive legends

## Installation

```yaml
dependencies:
  dv_legend: ^1.1.0
```

## Usage

import 'package:dv_legend/dv_legend.dart';
import 'package:flutter/material.dart';

Legend(
  items: [
    LegendItem(
      label: 'Series A',
      color: Colors.blue,
      symbol: symbolCircle,
    ),
    LegendItem(
      label: 'Series B',
      color: Colors.red,
      symbol: symbolSquare,
    ),
  ],
  orientation: LegendOrientation.horizontal,
)


## Documentation

For complete API documentation and interactive examples, visit:
- [Interactive Gallery](https://gsmlg-app.github.io/data_visualization/)
- [API Reference](https://pub.dev/documentation/dv_legend/latest/)

## Related Packages

This package is part of the data_visualization suite. See all packages at [pub.dev/publishers/gsmlg.dev](https://pub.dev/publishers/gsmlg.dev/packages).

## License

MIT License - see [LICENSE](LICENSE) for details.
