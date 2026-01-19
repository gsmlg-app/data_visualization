import 'package:flutter/material.dart';

import '../gallery/theme_provider.dart';
import '../home/home_page.dart';
import '../docs/docs_page.dart';
import '../gallery/gallery_page.dart';

/// Main navigation item
enum NavItem {
  home('Home', Icons.home_outlined, Icons.home),
  docs('Docs', Icons.menu_book_outlined, Icons.menu_book),
  gallery('Gallery', Icons.grid_view_outlined, Icons.grid_view);

  final String label;
  final IconData icon;
  final IconData selectedIcon;

  const NavItem(this.label, this.icon, this.selectedIcon);
}

/// Main app shell with navigation
class AppShell extends StatefulWidget {
  final ThemeModeNotifier themeNotifier;

  const AppShell({
    super.key,
    required this.themeNotifier,
  });

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  NavItem _selectedNav = NavItem.home;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;
    final isWide = screenWidth > 900;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: isDark
            ? theme.colorScheme.surface
            : theme.colorScheme.surfaceContainerLow,
        surfaceTintColor: Colors.transparent,
        toolbarHeight: 64,
        title: Row(
          children: [
            Icon(
              Icons.auto_graph,
              size: 28,
              color: GalleryTheme.accentTeal,
            ),
            const SizedBox(width: 12),
            Text(
              'Data Visualization',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          // Navigation tabs (for wide screens)
          if (isWide) ...[
            for (final nav in NavItem.values)
              _NavTab(
                nav: nav,
                isSelected: _selectedNav == nav,
                onTap: () => setState(() => _selectedNav = nav),
              ),
            const SizedBox(width: 16),
          ],
          // Theme toggle
          IconButton(
            icon: Icon(
              isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
            ),
            onPressed: widget.themeNotifier.toggleTheme,
            tooltip: isDark ? 'Switch to light mode' : 'Switch to dark mode',
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: _buildBody(),
      bottomNavigationBar: isWide
          ? null
          : NavigationBar(
              selectedIndex: _selectedNav.index,
              onDestinationSelected: (index) {
                setState(() => _selectedNav = NavItem.values[index]);
              },
              destinations: NavItem.values.map((nav) {
                return NavigationDestination(
                  icon: Icon(nav.icon),
                  selectedIcon: Icon(nav.selectedIcon),
                  label: nav.label,
                );
              }).toList(),
            ),
    );
  }

  Widget _buildBody() {
    switch (_selectedNav) {
      case NavItem.home:
        return const HomePage();
      case NavItem.docs:
        return const DocsPage();
      case NavItem.gallery:
        return const GalleryPage();
    }
  }
}

/// Navigation tab for wide screens
class _NavTab extends StatelessWidget {
  final NavItem nav;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavTab({
    required this.nav,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? GalleryTheme.accentTeal.withAlpha(20)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isSelected ? nav.selectedIcon : nav.icon,
              size: 20,
              color: isSelected
                  ? GalleryTheme.accentTeal
                  : theme.colorScheme.onSurfaceVariant,
            ),
            const SizedBox(width: 8),
            Text(
              nav.label,
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                color: isSelected
                    ? GalleryTheme.accentTeal
                    : theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
