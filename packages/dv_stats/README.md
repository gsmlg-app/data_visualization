# dv_stats

Statistical functions and data analysis

Part of the [data_visualization](https://pub.dev/packages/data_visualization) package suite.

📚 **[Live Examples](https://gsmlg-app.github.io/data_visualization/)** | **[Documentation](https://gsmlg-app.github.io/data_visualization/#/docs)**

## Overview

Provides statistical functions for data analysis including descriptive statistics, distributions, and data transformations.

## Features

- Descriptive statistics (mean, median, variance)
- Quartiles and percentiles
- Min/max and extent
- Histograms and bins
- Data transformations

## Installation

```yaml
dependencies:
  dv_stats: ^1.1.0
```

## Usage

import 'package:dv_stats/dv_stats.dart';

final data = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

// Descriptive statistics
final avg = mean(data); // 5.5
final med = median(data); // 5.5
final q = quartiles(data); // Q1: 3, Q2: 5.5, Q3: 8

// Min and max
final (min, max) = extent(data); // (1, 10)

// Variance and standard deviation
final variance = variance(data);
final stdDev = standardDeviation(data);


## Documentation

For complete API documentation and interactive examples, visit:
- [Interactive Gallery](https://gsmlg-app.github.io/data_visualization/)
- [API Reference](https://pub.dev/documentation/dv_stats/latest/)

## Related Packages

This package is part of the data_visualization suite. See all packages at [pub.dev/publishers/gsmlg.dev](https://pub.dev/publishers/gsmlg.dev/packages).

## License

MIT License - see [LICENSE](LICENSE) for details.
