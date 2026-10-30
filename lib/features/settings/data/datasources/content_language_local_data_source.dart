import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Keeps the content language chosen on this device (ADR 0017). Never touches
/// the network; the list of available languages comes from the remote data
/// source.
@lazySingleton
class ContentLanguageLocalDataSource {
  ContentLanguageLocalDataSource(this._prefs);

  /// Shared with whatever resolves curriculum text for the chosen language.
  static const String selectedKey = 'settings.content_language';

  final SharedPreferencesAsync _prefs;

  Future<String?> readSelected() => _prefs.getString(selectedKey);

  Future<void> saveSelected(String code) => _prefs.setString(selectedKey, code);

  Future<void> clearSelected() => _prefs.remove(selectedKey);
}
