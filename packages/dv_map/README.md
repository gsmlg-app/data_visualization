# dv_map

Prebuilt Natural Earth Admin 0 GeoJSON maps packaged for Flutter.

## Data source

These GeoJSON files are derived from the Natural Earth Admin 0 – Countries datasets:

- https://naciscdn.org/naturalearth/110m/cultural/ne_110m_admin_0_countries.zip
- https://naciscdn.org/naturalearth/50m/cultural/ne_50m_admin_0_countries.zip
- https://naciscdn.org/naturalearth/10m/cultural/ne_10m_admin_0_countries.zip

The assets in this package are the Natural Earth country boundaries converted to GeoJSON at scales 110m, 50m, and 10m.

## Usage

```dart
import 'package:dv_map/dv_map.dart';

final world = await DvMapLoader.loadWorld(MapScale.m110);
final usa = await DvMapLoader.loadCountry(
  scale: MapScale.m110,
  isoA3: 'USA',
);
```

## Assets

Assets live under `assets/` in this package and include:
- `assets/world.<scale>.json`
- `assets/<continent>/<country>.<scale>.json`

Scales: `110m`, `50m`, `10m`.
