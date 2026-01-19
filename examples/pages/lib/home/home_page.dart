import 'package:flutter/material.dart';

import '../gallery/theme_provider.dart';

/// Home page with package introduction and summary
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;
    final isWide = screenWidth > 900;

    return SingleChildScrollView(
      child: Column(
        children: [
          // Hero section
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: isDark
                    ? [
                        const Color(0xFF1A1A2E),
                        const Color(0xFF2A2A4E),
                      ]
                    : [
                        GalleryTheme.accentTeal.withAlpha(15),
                        GalleryTheme.accentPurple.withAlpha(10),
                      ],
              ),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: isWide ? 64 : 24,
              vertical: isWide ? 80 : 48,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Data Visualization\nfor Flutter',
                  style: theme.textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  'A comprehensive, modular library for building beautiful and interactive data visualizations in Flutter. '
                  'Inspired by D3.js, designed for Flutter.',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 32),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    _FeatureChip(
                      icon: Icons.widgets_outlined,
                      label: '30+ Packages',
                      color: GalleryTheme.accentTeal,
                    ),
                    _FeatureChip(
                      icon: Icons.show_chart,
                      label: '30+ Chart Types',
                      color: GalleryTheme.accentPurple,
                    ),
                    _FeatureChip(
                      icon: Icons.touch_app_outlined,
                      label: 'Interactive',
                      color: GalleryTheme.accentCoral,
                    ),
                    _FeatureChip(
                      icon: Icons.devices,
                      label: 'Responsive',
                      color: Colors.amber,
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Quick start section
          Padding(
            padding: EdgeInsets.all(isWide ? 64 : 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Quick Start',
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 24),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: isDark ? Colors.black26 : Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isDark
                          ? Colors.grey.shade800
                          : Colors.grey.shade300,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Add to pubspec.yaml:',
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color:
                              isDark ? Colors.black38 : Colors.grey.shade900,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: SelectableText(
                          'dependencies:\n  data_visualization: ^1.0.0',
                          style: TextStyle(
                            fontFamily: 'monospace',
                            fontSize: 14,
                            color: Colors.lightGreenAccent.shade400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 48),

                // Package categories
                Text(
                  'Package Overview',
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 24),
                _buildPackageCategories(context, isWide),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPackageCategories(BuildContext context, bool isWide) {
    final categories = [
      _PackageCategory(
        title: 'Core Utilities',
        description: 'Essential building blocks for data transformation',
        icon: Icons.hub_outlined,
        color: GalleryTheme.accentTeal,
        packages: ['dv_point', 'dv_scale', 'dv_curve', 'dv_vendor'],
      ),
      _PackageCategory(
        title: 'Geometry & Algorithms',
        description: 'Computational geometry and statistical algorithms',
        icon: Icons.hexagon_outlined,
        color: Colors.purple,
        packages: ['dv_delaunay', 'dv_voronoi', 'dv_stats', 'dv_hierarchy'],
      ),
      _PackageCategory(
        title: 'Visual Primitives',
        description: 'Shapes, glyphs, and visual elements',
        icon: Icons.category_outlined,
        color: GalleryTheme.accentCoral,
        packages: ['dv_shape', 'dv_glyph', 'dv_marker', 'dv_text', 'dv_gradient'],
      ),
      _PackageCategory(
        title: 'Chart Components',
        description: 'Axes, grids, legends, and annotations',
        icon: Icons.dashboard_outlined,
        color: Colors.amber,
        packages: ['dv_axis', 'dv_grid', 'dv_legend', 'dv_annotation'],
      ),
      _PackageCategory(
        title: 'Interactions',
        description: 'User interactions and event handling',
        icon: Icons.touch_app_outlined,
        color: Colors.blue,
        packages: ['dv_event', 'dv_tooltip', 'dv_brush', 'dv_zoom', 'dv_drag'],
      ),
      _PackageCategory(
        title: 'Charts',
        description: 'Complete chart implementations',
        icon: Icons.bar_chart,
        color: Colors.green,
        packages: ['dv_xychart', 'dv_heatmap', 'dv_network', 'dv_threshold'],
      ),
    ];

    if (isWide) {
      return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 1.3,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return _CategoryCard(category: categories[index]);
        },
      );
    }

    return Column(
      children: categories.map((cat) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: _CategoryCard(category: cat),
        );
      }).toList(),
    );
  }
}

class _FeatureChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const _FeatureChip({
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: color.withAlpha(20),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: color.withAlpha(60)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: color),
          const SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

class _PackageCategory {
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final List<String> packages;

  const _PackageCategory({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.packages,
  });
}

class _CategoryCard extends StatelessWidget {
  final _PackageCategory category;

  const _CategoryCard({required this.category});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDark
            ? theme.colorScheme.surfaceContainerHighest
            : theme.colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: category.color.withAlpha(40),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: category.color.withAlpha(20),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  category.icon,
                  size: 24,
                  color: category.color,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  category.title,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            category.description,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: category.packages.map((pkg) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: isDark ? Colors.black26 : Colors.white,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: isDark
                        ? Colors.grey.shade700
                        : Colors.grey.shade300,
                  ),
                ),
                child: Text(
                  pkg,
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontFamily: 'monospace',
                    fontSize: 11,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
