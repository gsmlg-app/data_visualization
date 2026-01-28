# dv_hierarchy

Hierarchical data layouts (tree, treemap, pack)

Part of the [data_visualization](https://pub.dev/packages/data_visualization) package suite.

📚 **[Live Examples](https://gsmlg-app.github.io/data_visualization/)** | **[Documentation](https://gsmlg-app.github.io/data_visualization/#/docs)**

## Overview

Provides layouts for hierarchical data including tree layouts, treemaps, circle packing, and partition layouts.

## Features

- Tree layout for dendrograms
- Treemap layout
- Circle packing layout
- Partition layout
- Hierarchy traversal methods

## Installation

```yaml
dependencies:
  dv_hierarchy: ^1.1.0
```

## Usage

import 'package:dv_hierarchy/dv_hierarchy.dart';

final root = HierarchyNode(
  data: {'name': 'root'},
  children: [
    HierarchyNode(data: {'name': 'A', 'value': 100}),
    HierarchyNode(data: {'name': 'B', 'value': 200}),
    HierarchyNode(data: {'name': 'C', 'value': 150}),
  ],
);

// Calculate values
root.sum((d) => (d['value'] as num?)?.toDouble() ?? 0);

// Apply treemap layout
treemapLayout(root, width: 400, height: 300);

// Each node now has x0, y0, x1, y1 coordinates
for (final node in root.descendants()) {
  print('${node.data['name']}: (${node.x0}, ${node.y0}) - (${node.x1}, ${node.y1})');
}


## Documentation

For complete API documentation and interactive examples, visit:
- [Interactive Gallery](https://gsmlg-app.github.io/data_visualization/)
- [API Reference](https://pub.dev/documentation/dv_hierarchy/latest/)

## Related Packages

This package is part of the data_visualization suite. See all packages at [pub.dev/publishers/gsmlg.dev](https://pub.dev/publishers/gsmlg.dev/packages).

## License

MIT License - see [LICENSE](LICENSE) for details.
