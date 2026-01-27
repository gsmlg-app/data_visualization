/// Available Natural Earth map scales.
enum MapScale {
  /// 1:110m scale (low resolution).
  m110('110m'),

  /// 1:50m scale (medium resolution).
  m50('50m'),

  /// 1:10m scale (high resolution).
  m10('10m');

  const MapScale(this.suffix);

  /// Scale suffix used in filenames.
  final String suffix;
}
