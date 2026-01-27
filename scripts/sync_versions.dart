#!/usr/bin/env dart

import 'dart:io';

/// Synchronizes all package versions to match the main package version.
/// This ensures all packages are published with the same version.
void main(List<String> args) async {
  if (args.isEmpty) {
    print('Usage: dart sync_versions.dart <new_version>');
    print('Example: dart sync_versions.dart 1.0.1');
    exit(1);
  }

  final newVersion = args[0];
  if (!RegExp(r'^\d+\.\d+\.\d+').hasMatch(newVersion)) {
    print('Error: Invalid version format. Expected: X.Y.Z');
    exit(1);
  }

  print('Synchronizing all packages to version: $newVersion');

  // Find all pubspec.yaml files in packages/
  final packagesDir = Directory('packages');
  if (!packagesDir.existsSync()) {
    print('Error: packages/ directory not found');
    exit(1);
  }

  var count = 0;
  await for (final entity in packagesDir.list(recursive: true)) {
    if (entity is File && entity.path.endsWith('pubspec.yaml')) {
      await updateVersion(entity, newVersion);
      count++;
    }
  }

  print('✓ Updated $count packages to version $newVersion');
}

Future<void> updateVersion(File pubspecFile, String newVersion) async {
  final content = await pubspecFile.readAsString();
  final lines = content.split('\n');
  final updatedLines = <String>[];

  for (final line in lines) {
    if (line.startsWith('version:')) {
      updatedLines.add('version: $newVersion');
      final packageName = pubspecFile.parent.path.split('/').last;
      print('  Updated: $packageName -> $newVersion');
    } else {
      updatedLines.add(line);
    }
  }

  await pubspecFile.writeAsString(updatedLines.join('\n'));
}
