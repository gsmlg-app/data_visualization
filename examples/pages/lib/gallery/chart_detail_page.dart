import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'gallery_item.dart';
import 'gallery_registry.dart';
import 'source_code_viewer.dart';

/// Detail page for viewing a chart example with documentation and source code
class ChartDetailPage extends StatefulWidget {
  final GalleryItem item;

  const ChartDetailPage({
    super.key,
    required this.item,
  });

  @override
  State<ChartDetailPage> createState() => _ChartDetailPageState();
}

class _ChartDetailPageState extends State<ChartDetailPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedTab = 0; // 0: Preview, 1: Documentation, 2: Source Code

  @override
  void initState() {
    super.initState();
    final tabCount = widget.item.sourcePath != null ? 3 : 2;
    _tabController = TabController(length: tabCount, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final hasDoc = widget.item.documentation != null;
    final hasSource = widget.item.sourcePath != null;
    final isWide = MediaQuery.of(context).size.width > 1200;
    final isMedium = MediaQuery.of(context).size.width > 900;

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
                color: widget.item.primaryColor,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: 12),
            Text(widget.item.title),
          ],
        ),
        actions: [
          // Category chip
          Container(
            margin: const EdgeInsets.only(right: 8),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: widget.item.primaryColor.withAlpha(20),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  widget.item.category.icon,
                  size: 16,
                  color: widget.item.primaryColor,
                ),
                const SizedBox(width: 6),
                Text(
                  widget.item.category.label,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: widget.item.primaryColor,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
        ],
        bottom: !isWide
            ? TabBar(
                controller: _tabController,
                onTap: (index) => setState(() => _selectedTab = index),
                tabs: [
                  const Tab(icon: Icon(Icons.show_chart), text: 'Preview'),
                  if (hasDoc)
                    const Tab(icon: Icon(Icons.menu_book), text: 'Docs'),
                  if (hasSource)
                    const Tab(icon: Icon(Icons.code), text: 'Source'),
                ],
              )
            : null,
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
                    widget.item.description,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                // Tags
                Wrap(
                  spacing: 8,
                  children: widget.item.tags.map((tag) {
                    return Chip(
                      label: Text(tag),
                      backgroundColor: widget.item.primaryColor.withAlpha(20),
                      labelStyle: TextStyle(
                        fontSize: 12,
                        color: widget.item.primaryColor,
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
          // Content
          Expanded(
            child: isWide
                ? _buildWideLayout(isDark, theme, hasDoc, hasSource)
                : isMedium && hasDoc
                    ? _buildMediumLayout(isDark, theme, hasSource)
                    : _buildNarrowLayout(isDark, theme, hasDoc, hasSource),
          ),
        ],
      ),
    );
  }

  /// Wide layout: Chart + Docs side panel + Source below
  Widget _buildWideLayout(
      bool isDark, ThemeData theme, bool hasDoc, bool hasSource) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Row(
            children: [
              // Chart preview
              Expanded(
                flex: 3,
                child: Container(
                  color: isDark ? theme.colorScheme.surface : Colors.white,
                  child: widget.item.builder(),
                ),
              ),
              // Documentation panel
              if (hasDoc)
                Container(
                  width: 400,
                  decoration: BoxDecoration(
                    color: isDark
                        ? theme.colorScheme.surfaceContainerHighest
                        : theme.colorScheme.surfaceContainerLow,
                    border: Border(
                      left: BorderSide(
                        color:
                            isDark ? Colors.grey.shade800 : Colors.grey.shade200,
                      ),
                    ),
                  ),
                  child: _buildDocumentation(isDark, theme),
                ),
            ],
          ),
        ),
        // Source code section
        if (hasSource)
          _ExpandableSourceSection(
            sourcePath: widget.item.sourcePath!,
            accentColor: widget.item.primaryColor,
            isDark: isDark,
          ),
      ],
    );
  }

  /// Medium layout: Chart with docs panel, tabs for source
  Widget _buildMediumLayout(bool isDark, ThemeData theme, bool hasSource) {
    if (_selectedTab == 2 && hasSource) {
      return _buildSourceView(isDark, theme);
    }

    return Row(
      children: [
        // Chart preview
        Expanded(
          flex: 3,
          child: Container(
            color: isDark ? theme.colorScheme.surface : Colors.white,
            child: widget.item.builder(),
          ),
        ),
        // Documentation panel
        Container(
          width: 400,
          decoration: BoxDecoration(
            color: isDark
                ? theme.colorScheme.surfaceContainerHighest
                : theme.colorScheme.surfaceContainerLow,
            border: Border(
              left: BorderSide(
                color: isDark ? Colors.grey.shade800 : Colors.grey.shade200,
              ),
            ),
          ),
          child: _buildDocumentation(isDark, theme),
        ),
      ],
    );
  }

  /// Narrow layout: Tabs for all content
  Widget _buildNarrowLayout(
      bool isDark, ThemeData theme, bool hasDoc, bool hasSource) {
    switch (_selectedTab) {
      case 0:
        return Container(
          color: isDark ? theme.colorScheme.surface : Colors.white,
          child: widget.item.builder(),
        );
      case 1:
        if (hasDoc) {
          return _buildDocumentation(isDark, theme);
        } else if (hasSource) {
          return _buildSourceView(isDark, theme);
        }
        break;
      case 2:
        if (hasSource) {
          return _buildSourceView(isDark, theme);
        }
        break;
    }
    return Container(
      color: isDark ? theme.colorScheme.surface : Colors.white,
      child: widget.item.builder(),
    );
  }

  Widget _buildSourceView(bool isDark, ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SourceCodeViewer(
        sourcePath: widget.item.sourcePath!,
        accentColor: widget.item.primaryColor,
      ),
    );
  }

  Widget _buildDocumentation(bool isDark, ThemeData theme) {
    final doc = widget.item.documentation!;

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        // Overview
        _DocSection(
          title: 'Overview',
          icon: Icons.info_outline,
          color: widget.item.primaryColor,
          child: Text(
            doc.overview,
            style: theme.textTheme.bodyMedium?.copyWith(
              height: 1.6,
            ),
          ),
        ),
        const SizedBox(height: 20),

        // Use Cases
        _DocSection(
          title: 'When to Use',
          icon: Icons.lightbulb_outline,
          color: widget.item.primaryColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: doc.useCases.map((useCase) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.check_circle,
                      size: 18,
                      color: widget.item.primaryColor,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        useCase,
                        style: theme.textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 20),

        // Features
        _DocSection(
          title: 'Key Features',
          icon: Icons.star_outline,
          color: widget.item.primaryColor,
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: doc.features.map((feature) {
              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: widget.item.primaryColor.withAlpha(15),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: widget.item.primaryColor.withAlpha(40),
                  ),
                ),
                child: Text(
                  feature,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: isDark ? Colors.white70 : Colors.black87,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 20),

        // Data Format
        _DocSection(
          title: 'Data Format',
          icon: Icons.data_array,
          color: widget.item.primaryColor,
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isDark ? Colors.black26 : Colors.grey.shade100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              doc.dataFormat,
              style: theme.textTheme.bodySmall?.copyWith(
                fontFamily: 'monospace',
                height: 1.5,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),

        // Code Snippet
        _DocSection(
          title: 'Code Example',
          icon: Icons.code,
          color: widget.item.primaryColor,
          trailing: IconButton(
            icon: const Icon(Icons.copy, size: 18),
            tooltip: 'Copy code',
            onPressed: () {
              Clipboard.setData(ClipboardData(text: doc.codeSnippet));
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Code copied to clipboard'),
                  duration: Duration(seconds: 2),
                ),
              );
            },
          ),
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isDark ? Colors.black38 : Colors.grey.shade900,
              borderRadius: BorderRadius.circular(8),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text(
                doc.codeSnippet,
                style: theme.textTheme.bodySmall?.copyWith(
                  fontFamily: 'monospace',
                  color: Colors.lightGreenAccent.shade400,
                  height: 1.5,
                ),
              ),
            ),
          ),
        ),

        // Related Charts
        if (doc.relatedCharts.isNotEmpty) ...[
          const SizedBox(height: 20),
          _DocSection(
            title: 'Related Charts',
            icon: Icons.link,
            color: widget.item.primaryColor,
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: doc.relatedCharts.map((chartId) {
                final relatedItem = GalleryRegistry.getById(chartId);
                if (relatedItem == null) return const SizedBox.shrink();
                return ActionChip(
                  avatar: Icon(
                    relatedItem.category.icon,
                    size: 16,
                    color: relatedItem.primaryColor,
                  ),
                  label: Text(relatedItem.title),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (_) => ChartDetailPage(item: relatedItem),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ),
        ],
        const SizedBox(height: 40),
      ],
    );
  }
}

/// An expandable section for source code in wide layout
class _ExpandableSourceSection extends StatefulWidget {
  final String sourcePath;
  final Color accentColor;
  final bool isDark;

  const _ExpandableSourceSection({
    required this.sourcePath,
    required this.accentColor,
    required this.isDark,
  });

  @override
  State<_ExpandableSourceSection> createState() =>
      _ExpandableSourceSectionState();
}

class _ExpandableSourceSectionState extends State<_ExpandableSourceSection> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      height: _isExpanded ? 400 : 48,
      decoration: BoxDecoration(
        color: widget.isDark
            ? theme.colorScheme.surfaceContainerHighest
            : theme.colorScheme.surfaceContainerLow,
        border: Border(
          top: BorderSide(
            color: widget.isDark ? Colors.grey.shade800 : Colors.grey.shade200,
          ),
        ),
      ),
      child: Column(
        children: [
          // Header
          InkWell(
            onTap: () => setState(() => _isExpanded = !_isExpanded),
            child: Container(
              height: 48,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Icon(
                    Icons.code,
                    size: 20,
                    color: widget.accentColor,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Source Code',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: widget.accentColor,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    _isExpanded
                        ? Icons.keyboard_arrow_down
                        : Icons.keyboard_arrow_up,
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ],
              ),
            ),
          ),
          // Content
          if (_isExpanded)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: SourceCodeViewer(
                  sourcePath: widget.sourcePath,
                  accentColor: widget.accentColor,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

/// A documentation section with title and icon
class _DocSection extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final Widget child;
  final Widget? trailing;

  const _DocSection({
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
            Icon(icon, size: 20, color: color),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                title,
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: color,
                ),
              ),
            ),
            if (trailing != null) trailing!,
          ],
        ),
        const SizedBox(height: 12),
        child,
      ],
    );
  }
}
