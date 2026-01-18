import 'package:flutter/material.dart';

import 'gallery_item.dart';
import 'gallery_registry.dart';
import 'gallery_card.dart';
import 'chart_detail_page.dart';
import 'theme_provider.dart';

/// Main gallery home page with grid view and filtering
class GalleryHome extends StatefulWidget {
  final ThemeModeNotifier themeNotifier;

  const GalleryHome({
    super.key,
    required this.themeNotifier,
  });

  @override
  State<GalleryHome> createState() => _GalleryHomeState();
}

class _GalleryHomeState extends State<GalleryHome>
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

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // App bar with title and theme toggle
          SliverAppBar(
            floating: true,
            pinned: true,
            expandedHeight: isWide ? 180 : 140,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
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
                child: SafeArea(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                      isWide ? 32 : 20,
                      16,
                      isWide ? 32 : 20,
                      0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.auto_graph,
                              size: isWide ? 36 : 28,
                              color: GalleryTheme.accentTeal,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Data Visualization',
                                    style: theme.textTheme.headlineSmall
                                        ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  if (isWide)
                                    Text(
                                      'Interactive gallery of visualization examples',
                                      style:
                                          theme.textTheme.bodyMedium?.copyWith(
                                        color:
                                            theme.colorScheme.onSurfaceVariant,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            // Theme toggle
                            IconButton(
                              icon: Icon(
                                isDark
                                    ? Icons.light_mode_outlined
                                    : Icons.dark_mode_outlined,
                              ),
                              onPressed: widget.themeNotifier.toggleTheme,
                              tooltip: isDark
                                  ? 'Switch to light mode'
                                  : 'Switch to dark mode',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(100),
              child: Container(
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
                        onChanged: (value) =>
                            setState(() => _searchQuery = value),
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
                          final count =
                              GalleryRegistry.getByCategory(cat).length;
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
                  ],
                ),
              ),
            ),
          ),

          // Results count
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                isWide ? 32 : 16,
                20,
                isWide ? 32 : 16,
                12,
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
          ),

          // Grid
          _filteredItems.isEmpty
              ? SliverFillRemaining(
                  child: Center(
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
                  ),
                )
              : SliverPadding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isWide ? 32 : 16,
                    vertical: 8,
                  ),
                  sliver: SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20,
                      childAspectRatio: 0.85,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final item = _filteredItems[index];
                        return GalleryCard(
                          item: item,
                          onTap: () => _openChart(item),
                        );
                      },
                      childCount: _filteredItems.length,
                    ),
                  ),
                ),

          // Bottom padding
          const SliverToBoxAdapter(
            child: SizedBox(height: 32),
          ),
        ],
      ),
    );
  }
}
