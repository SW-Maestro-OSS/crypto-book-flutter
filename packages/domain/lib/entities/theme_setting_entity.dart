/// Theme setting entity
///
/// Represents the user's theme preference
class ThemeSettingEntity {
  /// Theme mode: light, dark, system
  final ThemeMode themeMode;

  const ThemeSettingEntity({
    required this.themeMode,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ThemeSettingEntity &&
          runtimeType == other.runtimeType &&
          themeMode == other.themeMode;

  @override
  int get hashCode => themeMode.hashCode;

  @override
  String toString() => 'ThemeSettingEntity(themeMode: $themeMode)';
}

/// Theme mode enum
enum ThemeMode {
  light,
  dark,
  system,
}