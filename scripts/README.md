# Scripts

Utility scripts for managing the data_visualization monorepo.

## sync_versions.dart

Synchronizes all package versions to a specific version.

**Purpose:** Ensures all 36 packages have the exact same version number, which is required for our release process.

### Usage

```bash
dart scripts/sync_versions.dart <new_version>
```

### Example

```bash
# Update all packages to version 1.0.1
dart scripts/sync_versions.dart 1.0.1
```

Output:
```
Synchronizing all packages to version: 1.0.1
  Updated: data_visualization -> 1.0.1
  Updated: dv_scale -> 1.0.1
  Updated: dv_curve -> 1.0.1
  ...
✓ Updated 36 packages to version 1.0.1
```

### How it works

1. Takes a version number as input (format: X.Y.Z)
2. Finds all `pubspec.yaml` files in `packages/`
3. Updates the `version:` field in each file
4. Prints confirmation for each updated package

### When to use

- **Manual releases**: When bumping versions manually
- **Automated releases**: Used by `.github/workflows/release.yml`
- **Version synchronization**: If packages drift out of sync

### Verification

After running, verify all packages have the same version:

```bash
grep -r "^version:" packages/*/pubspec.yaml
```

All lines should show the same version number.

## Why synchronized versioning?

This monorepo requires all packages to be published with the same version at the same time:

- ✅ **Consistency**: Users can trust all packages work together
- ✅ **Simplicity**: One version number to track
- ✅ **Release management**: Easier to coordinate releases
- ✅ **Documentation**: Clear about which versions are compatible

Example: Release v1.0.1 includes:
- data_visualization@1.0.1
- dv_scale@1.0.1
- dv_curve@1.0.1
- ... (all 36 packages at 1.0.1)
