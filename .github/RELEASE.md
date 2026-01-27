# Release Process

This document describes how to release new versions of the data_visualization packages.

## Automated Release (Recommended)

Use the GitHub Actions workflow for automated releases:

1. Go to **Actions** → **Release** workflow
2. Click **Run workflow**
3. Select:
   - **Version bump type**: `patch`, `minor`, or `major`
   - **Dry run**: Check to preview changes without publishing
4. Click **Run workflow**

### What the workflow does

1. ✅ Runs tests and analysis
2. 🔢 Bumps version numbers using Melos
3. 📝 Generates changelog from git commits
4. 💾 Commits version changes to main branch
5. 🏷️ Creates git tag (e.g., `v1.0.1`)
6. 📦 Publishes all packages to pub.dev
7. 🎉 Creates GitHub release with notes

### Version bump types

- **patch** (1.0.0 → 1.0.1): Bug fixes, documentation updates
- **minor** (1.0.0 → 1.1.0): New features, backward compatible changes
- **major** (1.0.0 → 2.0.0): Breaking changes

### Dry run mode

Always do a **dry run first** to preview:
- Which packages will be published
- What the new versions will be
- Whether there are any validation issues

## Manual Release

If you need to release manually:

### 1. Update versions

```bash
# Bump patch version (1.0.0 → 1.0.1)
melos version --yes --no-git-tag-version patch

# Bump minor version (1.0.0 → 1.1.0)
melos version --yes --no-git-tag-version minor

# Bump major version (1.0.0 → 2.0.0)
melos version --yes --no-git-tag-version major
```

### 2. Commit and tag

```bash
# Get the new version
VERSION=$(grep "^version:" packages/data_visualization/pubspec.yaml | sed 's/version: //')

# Commit version changes
git add .
git commit -m "chore(release): publish packages v${VERSION}"

# Create and push tag
git tag -a "v${VERSION}" -m "Release v${VERSION}"
git push origin main --tags
```

### 3. Publish to pub.dev

```bash
# Dry run first
melos publish --no-private --dry-run

# Publish for real
melos publish --no-private --no-dry-run -y
```

### 4. Create GitHub release

Go to [Releases](https://github.com/gsmlg-dev/data_visualization/releases) and create a new release:
- Tag: `v${VERSION}`
- Title: `Release v${VERSION}`
- Description: Copy from CHANGELOG.md or write release notes

## Prerequisites

### Required secrets

The following GitHub secrets must be configured:

- `PUB_CREDENTIALS`: Pub.dev OAuth credentials (JSON file content)
  - Get from `~/.config/dart/pub-credentials.json` after `dart pub token add`

### Required permissions

The workflow needs:
- `contents: write` - To push commits and create releases
- `id-token: write` - For secure pub.dev publishing

## Troubleshooting

### Publishing fails with rate limit

pub.dev has a rate limit of **12 packages per 24-hour rolling window**.

If you hit the limit:
1. Wait for the rolling window to pass
2. Resume publishing the remaining packages manually

### Version conflicts

If packages already exist with the same version:
1. Bump versions again with a higher increment
2. Make sure previous publish completed successfully

### Authentication issues

If `dart pub publish` fails with authentication errors:
1. Verify `PUB_CREDENTIALS` secret is set correctly
2. Token should be valid JSON from `~/.config/dart/pub-credentials.json`
3. Token must have `https://pub.dev` scope

## Post-release checklist

After a successful release:

- ✅ Verify packages on [pub.dev](https://pub.dev/publishers/gsmlg.dev/packages)
- ✅ Check that GitHub release was created
- ✅ Test installation: `flutter pub add data_visualization:^${VERSION}`
- ✅ Update demo site if needed
- ✅ Announce on social media / changelog

## Notes

- All packages use **independent versioning** (each has its own version)
- The `data_visualization` umbrella package version is used for releases
- Packages maintain workspace dependencies (no version constraints)
- After publishing, consider transferring new packages to `gsmlg.dev` publisher
