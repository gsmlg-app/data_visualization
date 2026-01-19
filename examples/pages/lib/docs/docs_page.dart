import 'package:flutter/material.dart';

import '../gallery/theme_provider.dart';
import 'package_docs.dart';
import 'package_detail_page.dart';

/// Documentation page with package documentation
class DocsPage extends StatefulWidget {
  const DocsPage({super.key});

  @override
  State<DocsPage> createState() => _DocsPageState();
}

class _DocsPageState extends State<DocsPage> {
  PackageCategory? _selectedCategory;
  String _searchQuery = '';
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<PackageDoc> get _filteredPackages {
    var packages = PackageDocs.all;

    if (_selectedCategory != null) {
      packages = packages
          .where((pkg) => pkg.category == _selectedCategory)
          .toList();
    }

    if (_searchQuery.isNotEmpty) {
      final query = _searchQuery.toLowerCase();
      packages = packages.where((pkg) {
        return pkg.name.toLowerCase().contains(query) ||
            pkg.description.toLowerCase().contains(query);
      }).toList();
    }

    return packages;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;
    final isWide = screenWidth > 900;

    return Row(
      children: [
        // Sidebar with categories (wide screens only)
        if (isWide)
          Container(
            width: 280,
            decoration: BoxDecoration(
              color: isDark
                  ? theme.colorScheme.surfaceContainerHighest
                  : theme.colorScheme.surfaceContainerLow,
              border: Border(
                right: BorderSide(
                  color: isDark ? Colors.grey.shade800 : Colors.grey.shade200,
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Documentation',
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'API reference and usage guides',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(height: 1),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(12),
                    children: [
                      _CategoryItem(
                        label: 'All Packages',
                        icon: Icons.apps,
                        isSelected: _selectedCategory == null,
                        count: PackageDocs.all.length,
                        onTap: () => setState(() => _selectedCategory = null),
                      ),
                      const SizedBox(height: 8),
                      ...PackageCategory.values.map((cat) {
                        final count = PackageDocs.all
                            .where((pkg) => pkg.category == cat)
                            .length;
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: _CategoryItem(
                            label: cat.label,
                            icon: cat.icon,
                            isSelected: _selectedCategory == cat,
                            count: count,
                            onTap: () =>
                                setState(() => _selectedCategory = cat),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),

        // Main content
        Expanded(
          child: Column(
            children: [
              // Search bar and filter (narrow screens)
              Container(
                padding: EdgeInsets.all(isWide ? 24 : 16),
                decoration: BoxDecoration(
                  color: theme.scaffoldBackgroundColor,
                  border: Border(
                    bottom: BorderSide(
                      color:
                          isDark ? Colors.grey.shade800 : Colors.grey.shade200,
                    ),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (!isWide) ...[
                      Text(
                        'Documentation',
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                    TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Search packages...',
                        prefixIcon: const Icon(Icons.search, size: 20),
                        suffixIcon: _searchQuery.isNotEmpty
                            ? IconButton(
                                icon: const Icon(Icons.clear, size: 20),
                                onPressed: () {
                                  _searchController.clear();
                                  setState(() => _searchQuery = '');
                                },
                              )
                            : null,
                      ),
                      onChanged: (value) =>
                          setState(() => _searchQuery = value),
                    ),
                    if (!isWide) ...[
                      const SizedBox(height: 12),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            _FilterChip(
                              label: 'All',
                              isSelected: _selectedCategory == null,
                              onTap: () =>
                                  setState(() => _selectedCategory = null),
                            ),
                            ...PackageCategory.values.map((cat) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: _FilterChip(
                                  label: cat.label,
                                  isSelected: _selectedCategory == cat,
                                  onTap: () =>
                                      setState(() => _selectedCategory = cat),
                                ),
                              );
                            }),
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
              ),

              // Package list
              Expanded(
                child: _filteredPackages.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.search_off,
                              size: 64,
                              color: theme.colorScheme.onSurfaceVariant
                                  .withAlpha(100),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'No packages found',
                              style: theme.textTheme.titleMedium?.copyWith(
                                color: theme.colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      )
                    : ListView.separated(
                        padding: EdgeInsets.all(isWide ? 24 : 16),
                        itemCount: _filteredPackages.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 12),
                        itemBuilder: (context, index) {
                          final pkg = _filteredPackages[index];
                          return _PackageCard(
                            package: pkg,
                            onTap: () => _openPackageDetail(pkg),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _openPackageDetail(PackageDoc package) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => PackageDetailPage(package: package),
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isSelected;
  final int count;
  final VoidCallback onTap;

  const _CategoryItem({
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.count,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected
              ? GalleryTheme.accentTeal.withAlpha(20)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 20,
              color: isSelected
                  ? GalleryTheme.accentTeal
                  : theme.colorScheme.onSurfaceVariant,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                label,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                  color: isSelected
                      ? GalleryTheme.accentTeal
                      : theme.colorScheme.onSurface,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                '$count',
                style: theme.textTheme.bodySmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _FilterChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (_) => onTap(),
      selectedColor: GalleryTheme.accentTeal.withAlpha(30),
      checkmarkColor: GalleryTheme.accentTeal,
    );
  }
}

class _PackageCard extends StatelessWidget {
  final PackageDoc package;
  final VoidCallback onTap;

  const _PackageCard({
    required this.package,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isDark
              ? theme.colorScheme.surfaceContainerHighest
              : theme.colorScheme.surfaceContainerLow,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isDark ? Colors.grey.shade800 : Colors.grey.shade200,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: package.category.color.withAlpha(20),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                package.category.icon,
                size: 24,
                color: package.category.color,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    package.name,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'monospace',
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    package.description,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Icon(
              Icons.chevron_right,
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ],
        ),
      ),
    );
  }
}
