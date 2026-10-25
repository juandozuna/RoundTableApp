/// Paths and query keys of the placeholder shell feature.
abstract final class ShellRoutes {
  static const String home = '/';

  /// Dev-only component gallery (not registered in production).
  static const String componentGallery = '/dev/galeria';

  /// `?tema=oscuro|claro` forces the gallery theme (for screenshots).
  static const String themeQueryKey = 'tema';
  static const String themeDark = 'oscuro';
  static const String themeLight = 'claro';
}
