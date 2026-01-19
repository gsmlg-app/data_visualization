import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A widget that displays source code with syntax highlighting
class SourceCodeViewer extends StatelessWidget {
  final String sourceCode;
  final String? title;
  final Color accentColor;

  const SourceCodeViewer({
    super.key,
    required this.sourceCode,
    this.title,
    required this.accentColor,
  });

  void _copyToClipboard(BuildContext context) {
    Clipboard.setData(ClipboardData(text: sourceCode));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Source code copied to clipboard'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Column(
      children: [
        // Header with copy button
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: isDark ? Colors.grey.shade900 : Colors.grey.shade800,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
          ),
          child: Row(
            children: [
              Icon(
                Icons.code,
                size: 18,
                color: accentColor,
              ),
              const SizedBox(width: 8),
              Text(
                title ?? 'source.dart',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: Colors.white70,
                  fontFamily: 'monospace',
                ),
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.copy, size: 18),
                color: Colors.white70,
                tooltip: 'Copy source code',
                onPressed: () => _copyToClipboard(context),
                visualDensity: VisualDensity.compact,
              ),
            ],
          ),
        ),
        // Code content
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF1E1E1E) : const Color(0xFF2D2D2D),
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(8)),
            ),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: SelectableText.rich(
                _buildHighlightedCode(sourceCode),
                style: const TextStyle(
                  fontFamily: 'monospace',
                  fontSize: 13,
                  height: 1.5,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  static TextSpan _buildHighlightedCode(String code) {
    final spans = <TextSpan>[];
    final lines = code.split('\n');

    for (int i = 0; i < lines.length; i++) {
      final line = lines[i];
      spans.addAll(_highlightLine(line));
      if (i < lines.length - 1) {
        spans.add(const TextSpan(text: '\n'));
      }
    }

    return TextSpan(children: spans);
  }

  static List<TextSpan> _highlightLine(String line) {
    final spans = <TextSpan>[];

    // Keywords
    const keywords = [
      'import',
      'class',
      'extends',
      'implements',
      'with',
      'const',
      'final',
      'var',
      'void',
      'return',
      'if',
      'else',
      'for',
      'while',
      'do',
      'switch',
      'case',
      'default',
      'break',
      'continue',
      'new',
      'this',
      'super',
      'null',
      'true',
      'false',
      'static',
      'abstract',
      'override',
      'required',
      'late',
      'async',
      'await',
      'try',
      'catch',
      'finally',
      'throw',
      'enum',
      'typedef',
      'mixin',
      'extension',
      'get',
      'set',
    ];

    // Types
    const types = [
      'Widget',
      'State',
      'BuildContext',
      'StatelessWidget',
      'StatefulWidget',
      'Container',
      'Text',
      'Column',
      'Row',
      'Expanded',
      'Center',
      'Scaffold',
      'AppBar',
      'IconButton',
      'Icon',
      'Color',
      'Colors',
      'EdgeInsets',
      'BorderRadius',
      'BoxDecoration',
      'TextStyle',
      'List',
      'Map',
      'Set',
      'String',
      'int',
      'double',
      'bool',
      'num',
      'dynamic',
      'Object',
      'Future',
      'Stream',
      'Duration',
      'Size',
      'Offset',
      'Rect',
      'Path',
      'Paint',
      'Canvas',
      'CustomPainter',
    ];

    // Simple tokenizer
    final buffer = StringBuffer();
    int i = 0;

    while (i < line.length) {
      // Comments
      if (i < line.length - 1 && line.substring(i, i + 2) == '//') {
        if (buffer.isNotEmpty) {
          spans.add(TextSpan(
            text: buffer.toString(),
            style: const TextStyle(color: Color(0xFFD4D4D4)),
          ));
          buffer.clear();
        }
        spans.add(TextSpan(
          text: line.substring(i),
          style: const TextStyle(color: Color(0xFF6A9955)),
        ));
        return spans;
      }

      // Strings
      if (line[i] == "'" || line[i] == '"') {
        if (buffer.isNotEmpty) {
          _addTokenSpan(spans, buffer.toString(), keywords, types);
          buffer.clear();
        }
        final quote = line[i];
        final stringBuffer = StringBuffer(quote);
        i++;
        while (i < line.length && line[i] != quote) {
          if (line[i] == '\\' && i + 1 < line.length) {
            stringBuffer.write(line[i]);
            i++;
          }
          stringBuffer.write(line[i]);
          i++;
        }
        if (i < line.length) {
          stringBuffer.write(line[i]);
          i++;
        }
        spans.add(TextSpan(
          text: stringBuffer.toString(),
          style: const TextStyle(color: Color(0xFFCE9178)),
        ));
        continue;
      }

      // Numbers
      if (RegExp(r'\d').hasMatch(line[i]) &&
          (buffer.isEmpty ||
              !RegExp(r'[a-zA-Z_]').hasMatch(buffer.toString()))) {
        if (buffer.isNotEmpty) {
          _addTokenSpan(spans, buffer.toString(), keywords, types);
          buffer.clear();
        }
        final numBuffer = StringBuffer();
        while (i < line.length && RegExp(r'[\d.]').hasMatch(line[i])) {
          numBuffer.write(line[i]);
          i++;
        }
        spans.add(TextSpan(
          text: numBuffer.toString(),
          style: const TextStyle(color: Color(0xFFB5CEA8)),
        ));
        continue;
      }

      // Identifiers and keywords
      if (RegExp(r'[a-zA-Z_]').hasMatch(line[i])) {
        buffer.write(line[i]);
        i++;
        continue;
      }

      // Operators and punctuation
      if (buffer.isNotEmpty) {
        _addTokenSpan(spans, buffer.toString(), keywords, types);
        buffer.clear();
      }

      // Annotations
      if (line[i] == '@') {
        final annotationBuffer = StringBuffer('@');
        i++;
        while (i < line.length && RegExp(r'[a-zA-Z_]').hasMatch(line[i])) {
          annotationBuffer.write(line[i]);
          i++;
        }
        spans.add(TextSpan(
          text: annotationBuffer.toString(),
          style: const TextStyle(color: Color(0xFFDCDCAA)),
        ));
        continue;
      }

      spans.add(TextSpan(
        text: line[i],
        style: const TextStyle(color: Color(0xFFD4D4D4)),
      ));
      i++;
    }

    if (buffer.isNotEmpty) {
      _addTokenSpan(spans, buffer.toString(), keywords, types);
    }

    return spans;
  }

  static void _addTokenSpan(
    List<TextSpan> spans,
    String token,
    List<String> keywords,
    List<String> types,
  ) {
    Color color;
    if (keywords.contains(token)) {
      color = const Color(0xFF569CD6); // Blue for keywords
    } else if (types.contains(token)) {
      color = const Color(0xFF4EC9B0); // Cyan for types
    } else if (token.isNotEmpty &&
        token[0].toUpperCase() == token[0] &&
        RegExp(r'^[A-Z]').hasMatch(token)) {
      color = const Color(0xFF4EC9B0); // Cyan for type-like identifiers
    } else {
      color = const Color(0xFFD4D4D4); // Default gray
    }

    spans.add(TextSpan(
      text: token,
      style: TextStyle(color: color),
    ));
  }
}
