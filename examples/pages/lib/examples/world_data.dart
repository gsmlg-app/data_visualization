/// Simplified world land boundaries GeoJSON
/// Low-resolution outline for demonstration purposes
const worldLandGeoJson = {
  "type": "FeatureCollection",
  "features": [
    // North America
    {
      "type": "Feature",
      "properties": {"name": "North America"},
      "geometry": {
        "type": "Polygon",
        "coordinates": [[
          [-168, 65], [-168, 72], [-141, 70], [-130, 72], [-117, 70],
          [-95, 82], [-75, 83], [-60, 82], [-45, 82], [-60, 65],
          [-75, 58], [-80, 45], [-82, 30], [-98, 26], [-105, 22],
          [-118, 32], [-125, 48], [-140, 60], [-168, 65]
        ]]
      }
    },
    // South America
    {
      "type": "Feature",
      "properties": {"name": "South America"},
      "geometry": {
        "type": "Polygon",
        "coordinates": [[
          [-82, 12], [-60, 12], [-35, -5], [-35, -22], [-40, -22],
          [-55, -22], [-58, -38], [-68, -55], [-75, -50], [-78, -42],
          [-75, -18], [-70, -15], [-80, 0], [-82, 12]
        ]]
      }
    },
    // Europe
    {
      "type": "Feature",
      "properties": {"name": "Europe"},
      "geometry": {
        "type": "Polygon",
        "coordinates": [[
          [-10, 36], [-10, 60], [0, 62], [10, 72], [25, 71],
          [30, 70], [40, 68], [60, 70], [70, 68], [65, 55],
          [50, 45], [40, 42], [28, 36], [10, 36], [-10, 36]
        ]]
      }
    },
    // Africa
    {
      "type": "Feature",
      "properties": {"name": "Africa"},
      "geometry": {
        "type": "Polygon",
        "coordinates": [[
          [-18, 28], [-18, 15], [-5, 5], [10, 5], [12, -5],
          [42, 12], [52, 12], [50, 0], [42, -12], [35, -22],
          [28, -35], [18, -35], [15, -28], [12, -18], [-5, -18],
          [-12, 5], [-18, 15], [-18, 28]
        ]]
      }
    },
    // Asia
    {
      "type": "Feature",
      "properties": {"name": "Asia"},
      "geometry": {
        "type": "Polygon",
        "coordinates": [[
          [40, 42], [50, 45], [65, 55], [70, 68], [100, 78],
          [140, 75], [170, 70], [180, 65], [175, 52], [155, 50],
          [145, 45], [130, 35], [125, 32], [105, 22], [95, 20],
          [88, 22], [80, 28], [77, 35], [68, 38], [55, 25],
          [48, 30], [35, 32], [28, 36], [40, 42]
        ]]
      }
    },
    // Australia
    {
      "type": "Feature",
      "properties": {"name": "Australia"},
      "geometry": {
        "type": "Polygon",
        "coordinates": [[
          [113, -22], [130, -12], [142, -11], [153, -25],
          [153, -28], [150, -38], [145, -40], [136, -35],
          [129, -35], [115, -35], [113, -26], [113, -22]
        ]]
      }
    },
    // Antarctica (simplified)
    {
      "type": "Feature",
      "properties": {"name": "Antarctica"},
      "geometry": {
        "type": "Polygon",
        "coordinates": [[
          [-180, -62], [-180, -90], [180, -90], [180, -62],
          [150, -67], [90, -67], [30, -70], [-30, -70],
          [-90, -75], [-150, -75], [-180, -62]
        ]]
      }
    }
  ]
};
