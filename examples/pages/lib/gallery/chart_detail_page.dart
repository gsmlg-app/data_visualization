import 'package:flutter/material.dart';

import 'gallery_item.dart';

/// Detail page for viewing a chart example
class ChartDetailPage extends StatelessWidget {
  final GalleryItem item;

  const ChartDetailPage({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Row(
          children: [
            Container(
              width: 4,
              height: 20,
              decoration: BoxDecoration(
                color: item.primaryColor,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: 12),
            Text(item.title),
          ],
        ),
        actions: [
          // Category chip
          Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: item.primaryColor.withAlpha(20),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  item.category.icon,
                  size: 16,
                  color: item.primaryColor,
                ),
                const SizedBox(width: 6),
                Text(
                  item.category.label,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: item.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Description bar
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            decoration: BoxDecoration(
              color: isDark
                  ? theme.colorScheme.surfaceContainerHighest
                  : theme.colorScheme.surfaceContainerLow,
              border: Border(
                bottom: BorderSide(
                  color: isDark ? Colors.grey.shade800 : Colors.grey.shade200,
                ),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    item.description,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                // Tags
                Wrap(
                  spacing: 8,
                  children: item.tags.map((tag) {
                    return Chip(
                      label: Text(tag),
                      backgroundColor: item.primaryColor.withAlpha(20),
                      labelStyle: TextStyle(
                        fontSize: 12,
                        color: item.primaryColor,
                      ),
                      padding: EdgeInsets.zero,
                      visualDensity: VisualDensity.compact,
                      side: BorderSide.none,
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          // Chart content
          Expanded(
            child: Container(
              color: isDark
                  ? theme.colorScheme.surface
                  : Colors.white,
              child: item.builder(),
            ),
          ),
        ],
      ),
    );
  }
}
