import 'package:flutter/material.dart';

import 'gallery_item.dart';
import 'gallery_registry.dart';
import 'gallery_card.dart';
import 'chart_detail_page.dart';
import 'theme_provider.dart';

/// Gallery page showing all chart examples
class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage>
    with SingleTickerProviderStateMixin {
  ChartCategory? _selectedCategory;
  String _searchQuery = '';
  final _searchController = TextEditingController();
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    final categories = GalleryRegistry.activeCategories;
    _tabController = TabController(length: categories.length + 1, vsync: this);
    _tabController.addListener(_handleTabChange);
  }

  @override
  void dispose() {
    _searchController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabChange() {
    if (_tabController.indexIsChanging) return;

    setState(() {
      if (_tabController.index == 0) {
        _selectedCategory = null;
      } else {
        _selectedCategory =
            GalleryRegistry.activeCategories[_tabController.index - 1];
      }
    });
  }

  List<GalleryItem> get _filteredItems {
    var items = GalleryRegistry.items;

    if (_selectedCategory != null) {
      items = GalleryRegistry.getByCategory(_selectedCategory!);
    }

    if (_searchQuery.isNotEmpty) {
      items = items.where((item) {
        final query = _searchQuery.toLowerCase();
        return item.title.toLowerCase().contains(query) ||
            item.description.toLowerCase().contains(query) ||
            item.tags.any((tag) => tag.toLowerCase().contains(query));
      }).toList();
    }

    return items;
  }

  void _openChart(GalleryItem item) {
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return ChartDetailPage(item: item);
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.02, 0),
                end: Offset.zero,
              ).animate(CurvedAnimation(
                parent: animation,
                curve: Curves.easeOut,
              )),
              child: child,
            ),
          );
        },
        transitionDuration: const Duration(milliseconds: 300),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;
    final isWide = screenWidth > 800;
    final crossAxisCount = screenWidth > 1200
        ? 4
        : screenWidth > 900
            ? 3
            : screenWidth > 600
                ? 2
                : 1;

    return Column(
      children: [
        // Search and filter section
        Container(
          color: theme.scaffoldBackgroundColor,
          child: Column(
            children: [
              // Search bar
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isWide ? 32 : 16,
                  vertical: 12,
                ),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search charts...',
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
                  onChanged: (value) => setState(() => _searchQuery = value),
                ),
              ),
              // Category tabs
              TabBar(
                controller: _tabController,
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                padding: EdgeInsets.symmetric(
                  horizontal: isWide ? 24 : 8,
                ),
                labelPadding: const EdgeInsets.symmetric(horizontal: 12),
                indicatorColor: GalleryTheme.accentTeal,
                labelColor: GalleryTheme.accentTeal,
                unselectedLabelColor: theme.colorScheme.onSurfaceVariant,
                tabs: [
                  const Tab(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.grid_view, size: 18),
                        SizedBox(width: 8),
                        Text('All'),
                      ],
                    ),
                  ),
                  ...GalleryRegistry.activeCategories.map((cat) {
                    final count = GalleryRegistry.getByCategory(cat).length;
                    return Tab(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(cat.icon, size: 18),
                          const SizedBox(width: 8),
                          Text(cat.label),
                          const SizedBox(width: 6),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: theme.colorScheme.surfaceContainerHighest,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              '$count',
                              style: const TextStyle(fontSize: 11),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              ),
              const Divider(height: 1),
            ],
          ),
        ),

        // Results count
        Padding(
          padding: EdgeInsets.fromLTRB(
            isWide ? 32 : 16,
            16,
            isWide ? 32 : 16,
            8,
          ),
          child: Row(
            children: [
              Text(
                '${_filteredItems.length} visualization${_filteredItems.length == 1 ? '' : 's'}',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              if (_selectedCategory != null || _searchQuery.isNotEmpty) ...[
                const SizedBox(width: 8),
                InkWell(
                  onTap: () {
                    setState(() {
                      _selectedCategory = null;
                      _searchQuery = '';
                      _searchController.clear();
                      _tabController.animateTo(0);
                    });
                  },
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: GalleryTheme.accentCoral.withAlpha(20),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.close,
                          size: 14,
                          color: GalleryTheme.accentCoral,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'Clear filters',
                          style: TextStyle(
                            fontSize: 12,
                            color: GalleryTheme.accentCoral,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),

        // Grid
        Expanded(
          child: _filteredItems.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.search_off,
                        size: 64,
                        color:
                            theme.colorScheme.onSurfaceVariant.withAlpha(100),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'No visualizations found',
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Try adjusting your search or filters',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant
                              .withAlpha(150),
                        ),
                      ),
                    ],
                  ),
                )
              : GridView.builder(
                  padding: EdgeInsets.symmetric(
                    horizontal: isWide ? 32 : 16,
                    vertical: 8,
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 0.85,
                  ),
                  itemCount: _filteredItems.length,
                  itemBuilder: (context, index) {
                    final item = _filteredItems[index];
                    return GalleryCard(
                      item: item,
                      onTap: () => _openChart(item),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
