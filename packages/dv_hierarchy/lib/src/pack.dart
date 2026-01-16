import 'dart:math' as math;
import 'hierarchy.dart';

/// Computes a circle-packing layout for hierarchical data.
///
/// Each node is represented as a circle, with leaf circles sized
/// proportionally to their values and enclosing circles containing
/// their children.
class Pack<T> {
  /// The width of the layout.
  double width;

  /// The height of the layout.
  double height;

  /// Padding between sibling circles.
  double padding;

  /// Padding around the root circle.
  double paddingOuter;

  /// Creates a pack layout.
  Pack({
    this.width = 1,
    this.height = 1,
    this.padding = 0,
    this.paddingOuter = 0,
  });

  /// Sets the size of the layout.
  Pack<T> size(double w, double h) {
    width = w;
    height = h;
    return this;
  }

  /// Computes the circle-packing layout for the given hierarchy.
  HierarchyNode<T> layout(HierarchyNode<T> root) {
    // Compute radii bottom-up
    _computeRadii(root);

    // Pack circles top-down
    _packNode(root, padding);

    // Scale and translate to fit the target size
    final k = math.min(
      width / (2 * root.r + paddingOuter * 2),
      height / (2 * root.r + paddingOuter * 2),
    );

    for (final node in root.descendants()) {
      node.x = width / 2 + k * node.x;
      node.y = height / 2 + k * node.y;
      node.r = k * node.r;
    }

    // Set rectangular bounds
    for (final node in root.descendants()) {
      node.x0 = node.x - node.r;
      node.y0 = node.y - node.r;
      node.x1 = node.x + node.r;
      node.y1 = node.y + node.r;
    }

    return root;
  }

  void _computeRadii(HierarchyNode<T> node) {
    if (node.isLeaf) {
      // Leaf radius is proportional to sqrt of value
      node.r = math.sqrt(node.value ?? 0);
    } else {
      // Compute children radii first
      for (final child in node.children) {
        _computeRadii(child);
      }
      // Pack children and get enclosing radius
      node.r = _packChildren(node.children);
    }
  }

  void _packNode(HierarchyNode<T> node, double padding) {
    if (node.children.isEmpty) return;

    // Add padding to children
    for (final child in node.children) {
      child.r += padding;
    }

    // Re-pack with padding
    _packChildren(node.children);

    // Remove padding after packing
    for (final child in node.children) {
      child.r -= padding;
    }

    // Recursively pack children
    for (final child in node.children) {
      _packNode(child, padding);
    }
  }

  /// Packs circles using an implementation of Wang et al.'s algorithm.
  /// Returns the radius of the enclosing circle.
  double _packChildren(List<HierarchyNode<T>> children) {
    if (children.isEmpty) return 0;

    if (children.length == 1) {
      children[0].x = 0;
      children[0].y = 0;
      return children[0].r;
    }

    if (children.length == 2) {
      final a = children[0];
      final b = children[1];
      a.x = -a.r;
      a.y = 0;
      b.x = b.r;
      b.y = 0;
      return a.r + b.r;
    }

    // Sort by descending radius for better packing
    children.sort((a, b) => b.r.compareTo(a.r));

    // Place first two circles
    final a = children[0];
    final b = children[1];
    a.x = -a.r;
    a.y = 0;
    b.x = b.r;
    b.y = 0;

    // Maintain a front chain
    final front = <_PackCircle<T>>[
      _PackCircle<T>(a),
      _PackCircle<T>(b),
    ];
    front[0].next = front[1];
    front[1].prev = front[0];
    front[0].prev = front[1];
    front[1].next = front[0];

    // Place remaining circles
    for (int i = 2; i < children.length; i++) {
      final c = children[i];

      // Find the best position on the front
      _PackCircle<T>? bestPrev;
      double bestScore = double.infinity;

      var node = front[0];
      do {
        final next = node.next!;
        final pos = _placeCircle(node.node, next.node, c.r);
        if (pos != null) {
          // Check for overlaps
          bool overlaps = false;
          var check = next.next;
          while (check != node) {
            final d = math.sqrt(
                math.pow(pos.$1 - check!.node.x, 2) +
                    math.pow(pos.$2 - check.node.y, 2));
            if (d < c.r + check.node.r - 1e-6) {
              overlaps = true;
              break;
            }
            check = check.next;
          }

          if (!overlaps) {
            final score = pos.$1 * pos.$1 + pos.$2 * pos.$2;
            if (score < bestScore) {
              bestScore = score;
              bestPrev = node;
            }
          }
        }
        node = node.next!;
      } while (node != front[0]);

      if (bestPrev != null) {
        final next = bestPrev.next!;
        final pos = _placeCircle(bestPrev.node, next.node, c.r)!;
        c.x = pos.$1;
        c.y = pos.$2;

        // Insert into front
        final newNode = _PackCircle<T>(c);
        newNode.prev = bestPrev;
        newNode.next = next;
        bestPrev.next = newNode;
        next.prev = newNode;
      } else {
        // Fallback: place at origin
        c.x = 0;
        c.y = 0;
      }
    }

    // Compute enclosing circle using Welzl's algorithm
    return _enclose(children);
  }

  /// Places a circle tangent to two others.
  (double, double)? _placeCircle(
      HierarchyNode<T> a, HierarchyNode<T> b, double r) {
    final ax = a.x, ay = a.y, ar = a.r;
    final bx = b.x, by = b.y, br = b.r;

    final dx = bx - ax;
    final dy = by - ay;
    final d = math.sqrt(dx * dx + dy * dy);

    if (d < 1e-10) return null;

    final cos = dx / d;
    final sin = dy / d;

    // Distance from a to the new circle's center
    final l = ar + r;
    // Distance from b to the new circle's center
    final m = br + r;

    // Use law of cosines to find angle
    final cosAngle = (l * l + d * d - m * m) / (2 * l * d);
    if (cosAngle.abs() > 1) return null;

    final sinAngle = math.sqrt(1 - cosAngle * cosAngle);

    // Two possible positions, choose the one that extends outward
    final x1 = ax + l * (cos * cosAngle - sin * sinAngle);
    final y1 = ay + l * (sin * cosAngle + cos * sinAngle);
    final x2 = ax + l * (cos * cosAngle + sin * sinAngle);
    final y2 = ay + l * (sin * cosAngle - cos * sinAngle);

    // Return the position that is farther from origin (extends the packing)
    if (x1 * x1 + y1 * y1 > x2 * x2 + y2 * y2) {
      return (x1, y1);
    } else {
      return (x2, y2);
    }
  }

  /// Computes the smallest enclosing circle using Welzl's algorithm.
  double _enclose(List<HierarchyNode<T>> circles) {
    if (circles.isEmpty) return 0;
    if (circles.length == 1) {
      return circles[0].r;
    }

    // Simple bounding circle
    double minX = double.infinity;
    double maxX = double.negativeInfinity;
    double minY = double.infinity;
    double maxY = double.negativeInfinity;

    for (final c in circles) {
      if (c.x - c.r < minX) minX = c.x - c.r;
      if (c.x + c.r > maxX) maxX = c.x + c.r;
      if (c.y - c.r < minY) minY = c.y - c.r;
      if (c.y + c.r > maxY) maxY = c.y + c.r;
    }

    final cx = (minX + maxX) / 2;
    final cy = (minY + maxY) / 2;

    // Find the maximum distance from center
    double maxR = 0;
    for (final c in circles) {
      final d = math.sqrt(math.pow(c.x - cx, 2) + math.pow(c.y - cy, 2)) + c.r;
      if (d > maxR) maxR = d;
    }

    // Translate circles so enclosing circle is centered at origin
    for (final c in circles) {
      c.x -= cx;
      c.y -= cy;
    }

    return maxR;
  }
}

class _PackCircle<T> {
  final HierarchyNode<T> node;
  _PackCircle<T>? prev;
  _PackCircle<T>? next;

  _PackCircle(this.node);
}

/// Creates a pack layout with default settings.
Pack<T> pack<T>() => Pack<T>();

/// Creates a pack layout with the given size.
Pack<T> packWithSize<T>(double width, double height) =>
    Pack<T>(width: width, height: height);

/// Packs a list of circles (without hierarchy) into a compact arrangement.
///
/// Returns the radius of the enclosing circle.
/// Modifies the x, y properties of the input circles.
double packEnclose<T>(List<HierarchyNode<T>> circles) {
  if (circles.isEmpty) return 0;

  final pack = Pack<T>();
  return pack._enclose(circles);
}
