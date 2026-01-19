import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../gallery/theme_provider.dart';
import 'package_docs.dart';

/// Detail page for viewing package documentation
class PackageDetailPage extends StatelessWidget {
  final PackageDoc package;

  const PackageDetailPage({
    super.key,
    required this.package,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;
    final isWide = screenWidth > 900;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: package.category.color.withAlpha(20),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Icon(
                package.category.icon,
                size: 20,
                color: package.category.color,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              package.name,
              style: const TextStyle(fontFamily: 'monospace'),
            ),
          ],
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: package.category.color.withAlpha(20),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              package.category.label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: package.category.color,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(isWide ? 32 : 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Description
            Text(
              package.description,
              style: theme.textTheme.titleLarge?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 32),

            // Overview
            _Section(
              title: 'Overview',
              icon: Icons.info_outline,
              color: package.category.color,
              child: Text(
                package.overview,
                style: theme.textTheme.bodyLarge?.copyWith(
                  height: 1.6,
                ),
              ),
            ),
            const SizedBox(height: 32),

            // API Reference
            _Section(
              title: 'API Reference',
              icon: Icons.code,
              color: package.category.color,
              child: Column(
                children: package.api.map((item) {
                  return _ApiItemCard(item: item, isDark: isDark);
                }).toList(),
              ),
            ),
            const SizedBox(height: 32),

            // Usage Example
            _Section(
              title: 'Usage Example',
              icon: Icons.play_arrow_outlined,
              color: package.category.color,
              trailing: IconButton(
                icon: const Icon(Icons.copy, size: 20),
                tooltip: 'Copy code',
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: package.usageExample));
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Code copied to clipboard'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
              ),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: isDark ? Colors.black38 : Colors.grey.shade900,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SelectableText(
                  package.usageExample,
                  style: TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 13,
                    height: 1.5,
                    color: Colors.lightGreenAccent.shade400,
                  ),
                ),
              ),
            ),

            // Related Packages
            if (package.relatedPackages.isNotEmpty) ...[
              const SizedBox(height: 32),
              _Section(
                title: 'Related Packages',
                icon: Icons.link,
                color: package.category.color,
                child: Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: package.relatedPackages.map((pkgName) {
                    final relatedPkg = PackageDocs.all.firstWhere(
                      (p) => p.name == pkgName,
                      orElse: () => package,
                    );
                    return ActionChip(
                      avatar: Icon(
                        relatedPkg.category.icon,
                        size: 18,
                        color: relatedPkg.category.color,
                      ),
                      label: Text(
                        pkgName,
                        style: const TextStyle(fontFamily: 'monospace'),
                      ),
                      onPressed: relatedPkg.name != package.name
                          ? () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (_) =>
                                      PackageDetailPage(package: relatedPkg),
                                ),
                              );
                            }
                          : null,
                    );
                  }).toList(),
                ),
              ),
            ],
            const SizedBox(height: 48),
          ],
        ),
      ),
    );
  }
}

class _Section extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final Widget child;
  final Widget? trailing;

  const _Section({
    required this.title,
    required this.icon,
    required this.color,
    required this.child,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, size: 24, color: color),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ),
            if (trailing != null) trailing!,
          ],
        ),
        const SizedBox(height: 16),
        child,
      ],
    );
  }
}

class _ApiItemCard extends StatelessWidget {
  final ApiItem item;
  final bool isDark;

  const _ApiItemCard({
    required this.item,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Color typeColor;
    IconData typeIcon;
    switch (item.type) {
      case 'class':
        typeColor = Colors.blue;
        typeIcon = Icons.class_outlined;
        break;
      case 'function':
        typeColor = Colors.purple;
        typeIcon = Icons.functions;
        break;
      case 'method':
        typeColor = Colors.teal;
        typeIcon = Icons.code;
        break;
      case 'property':
        typeColor = Colors.orange;
        typeIcon = Icons.data_object;
        break;
      case 'enum':
        typeColor = Colors.green;
        typeIcon = Icons.list;
        break;
      case 'const':
        typeColor = Colors.red;
        typeIcon = Icons.lock_outline;
        break;
      case 'widget':
        typeColor = Colors.indigo;
        typeIcon = Icons.widgets_outlined;
        break;
      case 'typedef':
        typeColor = Colors.pink;
        typeIcon = Icons.short_text;
        break;
      default:
        typeColor = Colors.grey;
        typeIcon = Icons.code;
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark
            ? theme.colorScheme.surfaceContainerHighest
            : theme.colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isDark ? Colors.grey.shade800 : Colors.grey.shade200,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: typeColor.withAlpha(20),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(typeIcon, size: 14, color: typeColor),
                    const SizedBox(width: 4),
                    Text(
                      item.type,
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: typeColor,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  item.name,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'monospace',
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            item.description,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          if (item.signature != null) ...[
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              decoration: BoxDecoration(
                color: isDark ? Colors.black26 : Colors.grey.shade100,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                item.signature!,
                style: theme.textTheme.bodySmall?.copyWith(
                  fontFamily: 'monospace',
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
