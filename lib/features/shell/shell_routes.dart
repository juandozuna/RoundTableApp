/// Paths and query keys of the shell feature.
abstract final class ShellRoutes {
  /// Dev-only component gallery (not registered in production).
  static const String componentGallery = '/dev/galeria';

  /// `?tema=oscuro|claro` forces the gallery theme (for screenshots).
  static const String themeQueryKey = 'tema';
  static const String themeDark = 'oscuro';
  static const String themeLight = 'claro';
}
