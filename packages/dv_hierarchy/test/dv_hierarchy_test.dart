import 'package:test/test.dart';
import 'package:dv_hierarchy/dv_hierarchy.dart';

void main() {
  group('HierarchyNode', () {
    late HierarchyNode<Map<String, dynamic>> root;

    setUp(() {
      // Create a simple hierarchy
      root = HierarchyNode.fromData(
        <String, dynamic>{'name': 'root', 'value': 100},
        children: (d) {
          if (d['name'] == 'root') {
            return <Map<String, dynamic>>[
              {'name': 'A', 'value': 30},
              {'name': 'B', 'value': 70},
            ];
          } else if (d['name'] == 'A') {
            return <Map<String, dynamic>>[
              {'name': 'A1', 'value': 10},
              {'name': 'A2', 'value': 20},
            ];
          } else if (d['name'] == 'B') {
            return <Map<String, dynamic>>[
              {'name': 'B1', 'value': 35},
              {'name': 'B2', 'value': 35},
            ];
          }
          return [];
        },
      );
    });

    test('fromData creates correct hierarchy', () {
      expect(root.data['name'], equals('root'));
      expect(root.depth, equals(0));
      expect(root.children.length, equals(2));
    });

    test('computes height correctly', () {
      expect(root.height, equals(2));
      expect(root.children[0].height, equals(1));
      expect(root.leaves().first.height, equals(0));
    });

    test('descendants returns all nodes', () {
      final descendants = root.descendants().toList();
      expect(descendants.length, equals(7));
    });

    test('leaves returns only leaf nodes', () {
      final leaves = root.leaves().toList();
      expect(leaves.length, equals(4));
      for (final leaf in leaves) {
        expect(leaf.isLeaf, isTrue);
      }
    });

    test('ancestors returns path to root', () {
      final leaf = root.leaves().first;
      final ancestors = leaf.ancestors().toList();

      expect(ancestors.first, equals(leaf));
      expect(ancestors.last, equals(root));
    });

    test('sum computes correct values', () {
      root.sum((d) => (d['value'] as num).toDouble());

      expect(root.value, equals(100.0));
      expect(root.children[0].value, equals(30.0));
      expect(root.children[1].value, equals(70.0));
    });

    test('count counts leaves', () {
      root.count();

      expect(root.value, equals(4.0));
    });

    test('sort orders children', () {
      root.sum((d) => (d['value'] as num).toDouble());
      root.sort((a, b) => (b.value ?? 0).compareTo(a.value ?? 0));

      expect(root.children[0].data['name'], equals('B'));
      expect(root.children[1].data['name'], equals('A'));
    });

    test('links returns parent-child pairs', () {
      final links = root.links().toList();
      expect(links.length, equals(6));
    });

    test('copy creates deep copy', () {
      final copy = root.copy();

      expect(copy.data, equals(root.data));
      expect(copy.children.length, equals(root.children.length));
      expect(copy, isNot(same(root)));
    });
  });

  group('HierarchyNode.stratify', () {
    test('creates hierarchy from flat data', () {
      final data = <Map<String, String?>>[
        {'id': 'root', 'parentId': null},
        {'id': 'A', 'parentId': 'root'},
        {'id': 'B', 'parentId': 'root'},
        {'id': 'A1', 'parentId': 'A'},
        {'id': 'A2', 'parentId': 'A'},
      ];

      final root = HierarchyNode.stratify<Map<String, String?>>(
        data: data,
        id: (d) => d['id']!,
        parentId: (d) => d['parentId'],
      );

      expect(root, isNotNull);
      expect(root!.data['id'], equals('root'));
      expect(root.children.length, equals(2));
    });
  });

  group('Treemap', () {
    test('layouts hierarchy into rectangles', () {
      final root = HierarchyNode.fromData(
        <String, dynamic>{'name': 'root'},
        children: (d) {
          if (d['name'] == 'root') {
            return <Map<String, dynamic>>[
              {'name': 'A', 'value': 30},
              {'name': 'B', 'value': 70},
            ];
          }
          return [];
        },
      );
      root.sum((d) => (d['value'] as num?)?.toDouble() ?? 0);

      final treemap = Treemap<Map<String, dynamic>>()..size(100, 100);

      treemap.layout(root);

      // Root should fill the entire area
      expect(root.x0, equals(0));
      expect(root.y0, equals(0));
      expect(root.x1, equals(100));
      expect(root.y1, equals(100));

      // Children should partition the space
      for (final child in root.children) {
        expect(child.x0, greaterThanOrEqualTo(0));
        expect(child.y0, greaterThanOrEqualTo(0));
        expect(child.x1, lessThanOrEqualTo(100));
        expect(child.y1, lessThanOrEqualTo(100));
      }
    });

    test('respects padding', () {
      final root = HierarchyNode.fromData(
        <String, dynamic>{'name': 'root'},
        children: (d) {
          if (d['name'] == 'root') {
            return <Map<String, dynamic>>[
              {'name': 'A', 'value': 50},
              {'name': 'B', 'value': 50},
            ];
          }
          return [];
        },
      );
      root.sum((d) => (d['value'] as num?)?.toDouble() ?? 0);

      final treemap = Treemap<Map<String, dynamic>>()
        ..size(100, 100)
        ..padding(10);

      treemap.layout(root);

      // Children should be inset by padding
      for (final child in root.children) {
        expect(child.x0, greaterThanOrEqualTo(10));
        expect(child.y0, greaterThanOrEqualTo(10));
      }
    });

    test('supports different tiling methods', () {
      final root = HierarchyNode.fromData(
        <String, dynamic>{'name': 'root'},
        children: (d) {
          if (d['name'] == 'root') {
            return <Map<String, dynamic>>[
              {'name': 'A', 'value': 25},
              {'name': 'B', 'value': 25},
              {'name': 'C', 'value': 25},
              {'name': 'D', 'value': 25},
            ];
          }
          return [];
        },
      );
      root.sum((d) => (d['value'] as num?)?.toDouble() ?? 0);

      for (final tiling in TreemapTiling.values) {
        final treemap = Treemap<Map<String, dynamic>>()
          ..size(100, 100)
          ..tiling = tiling;

        final copy = root.copy();
        copy.sum((d) => (d['value'] as num?)?.toDouble() ?? 0);
        treemap.layout(copy);

        // All tilings should produce valid rectangles
        for (final node in copy.descendants()) {
          expect(node.x1, greaterThanOrEqualTo(node.x0));
          expect(node.y1, greaterThanOrEqualTo(node.y0));
        }
      }
    });
  });

  group('Pack', () {
    test('layouts hierarchy as circles', () {
      final root = HierarchyNode.fromData(
        <String, dynamic>{'name': 'root'},
        children: (d) {
          if (d['name'] == 'root') {
            return <Map<String, dynamic>>[
              {'name': 'A', 'value': 30},
              {'name': 'B', 'value': 70},
            ];
          }
          return [];
        },
      );
      root.sum((d) => (d['value'] as num?)?.toDouble() ?? 0);

      final pack = Pack<Map<String, dynamic>>()..size(100, 100);

      pack.layout(root);

      // All nodes should have positive radius
      for (final node in root.descendants()) {
        expect(node.r, greaterThan(0));
      }

      // Larger value should have larger radius
      expect(root.children[1].r, greaterThan(root.children[0].r));
    });
  });

  group('Partition', () {
    test('layouts hierarchy as strips', () {
      final root = HierarchyNode.fromData(
        <String, dynamic>{'name': 'root'},
        children: (d) {
          if (d['name'] == 'root') {
            return <Map<String, dynamic>>[
              {'name': 'A', 'value': 30},
              {'name': 'B', 'value': 70},
            ];
          }
          return [];
        },
      );
      root.sum((d) => (d['value'] as num?)?.toDouble() ?? 0);

      final partition = Partition<Map<String, dynamic>>()..size(100, 100);

      partition.layout(root);

      // Root should be at the top
      expect(root.y0, equals(0));

      // Children should be below root (y0 > 0 means below root.y0=0)
      for (final child in root.children) {
        expect(child.y0, greaterThan(0));
      }

      // Children should have widths proportional to values
      final totalWidth =
          root.children.fold<double>(0, (sum, c) => sum + (c.x1 - c.x0));
      expect(totalWidth, closeTo(100, 1));
    });

    test('radialLayout creates sunburst', () {
      final root = HierarchyNode.fromData(
        <String, dynamic>{'name': 'root'},
        children: (d) {
          if (d['name'] == 'root') {
            return <Map<String, dynamic>>[
              {'name': 'A', 'value': 50},
              {'name': 'B', 'value': 50},
            ];
          }
          return [];
        },
      );
      root.sum((d) => (d['value'] as num?)?.toDouble() ?? 0);

      final partition = Partition<Map<String, dynamic>>()..size(100, 100);

      partition.radialLayout(root);

      // x0, x1 should be angles
      for (final node in root.descendants()) {
        expect(node.x0, lessThanOrEqualTo(node.x1));
      }

      // y0, y1 should be radii (y1 >= y0, allowing for y1 == y0 for small arcs)
      for (final node in root.descendants()) {
        expect(node.y0, greaterThanOrEqualTo(0));
        expect(node.y1, greaterThanOrEqualTo(node.y0));
      }
    });
  });

  group('Tree', () {
    test('layouts hierarchy as tree', () {
      final root = HierarchyNode.fromData(
        <String, dynamic>{'name': 'root'},
        children: (d) {
          if (d['name'] == 'root') {
            return <Map<String, dynamic>>[
              {'name': 'A'},
              {'name': 'B'},
            ];
          } else if (d['name'] == 'A') {
            return <Map<String, dynamic>>[
              {'name': 'A1'},
              {'name': 'A2'},
            ];
          }
          return [];
        },
      );

      final tree = Tree<Map<String, dynamic>>()..size(100, 100);

      tree.layout(root);

      // Root should be at the top
      expect(root.y, equals(0));

      // Nodes at same depth should have same y
      final depth1 = root.children;
      for (final node in depth1) {
        expect(node.y, equals(depth1.first.y));
      }
    });

    test('uses separation function', () {
      final root = HierarchyNode.fromData(
        <String, dynamic>{'name': 'root'},
        children: (d) {
          if (d['name'] == 'root') {
            return <Map<String, dynamic>>[
              {'name': 'A'},
              {'name': 'B'},
            ];
          }
          return [];
        },
      );

      final tree = Tree<Map<String, dynamic>>()
        ..size(100, 100)
        ..setSeparation((a, b) => a.parent == b.parent ? 1 : 3);

      tree.layout(root);

      // Layout should be valid
      expect(root.x, greaterThanOrEqualTo(0));
    });
  });

  group('Cluster', () {
    test('layouts leaves at same depth', () {
      final root = HierarchyNode.fromData(
        <String, dynamic>{'name': 'root'},
        children: (d) {
          if (d['name'] == 'root') {
            return <Map<String, dynamic>>[
              {'name': 'A'},
              {'name': 'B'},
            ];
          } else if (d['name'] == 'A') {
            return <Map<String, dynamic>>[
              {'name': 'A1'},
            ];
          }
          return [];
        },
      );

      final cluster = Cluster<Map<String, dynamic>>()..size(100, 100);

      cluster.layout(root);

      // All leaves should be at the same y
      final leaves = root.leaves().toList();
      final leafY = leaves.first.y;
      for (final leaf in leaves) {
        expect(leaf.y, equals(leafY));
      }
    });

    test('radialLayout creates radial dendrogram', () {
      final root = HierarchyNode.fromData(
        <String, dynamic>{'name': 'root'},
        children: (d) {
          if (d['name'] == 'root') {
            return <Map<String, dynamic>>[
              {'name': 'A'},
              {'name': 'B'},
            ];
          }
          return [];
        },
      );

      final cluster = Cluster<Map<String, dynamic>>()..size(100, 100);

      cluster.radialLayout(root);

      // Center should be near the middle
      expect(root.x, closeTo(50, 10));
      expect(root.y, closeTo(50, 10));
    });
  });

  group('hierarchicalClustering', () {
    test('clusters data points', () {
      final data = [
        [0.0, 0.0],
        [0.1, 0.1],
        [5.0, 5.0],
        [5.1, 5.1],
      ];

      final result = hierarchicalClustering<List<double>>(
        data: data,
        distance: (a, b) {
          final dx = a[0] - b[0];
          final dy = a[1] - b[1];
          return (dx * dx + dy * dy);
        },
      );

      expect(result.root, isNotNull);
      expect(result.data.length, equals(4));
    });

    test('supports different linkage methods', () {
      final data = [
        [0.0, 0.0],
        [1.0, 1.0],
        [5.0, 5.0],
      ];

      for (final linkage in ClusterLinkage.values) {
        final result = hierarchicalClustering<List<double>>(
          data: data,
          distance: (a, b) {
            final dx = a[0] - b[0];
            final dy = a[1] - b[1];
            return (dx * dx + dy * dy);
          },
          linkage: linkage,
        );

        expect(result.root, isNotNull);
      }
    });
  });
}
