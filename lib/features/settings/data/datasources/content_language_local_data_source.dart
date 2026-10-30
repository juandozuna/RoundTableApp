import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/services/device_language/device_language.dart';

/// Keeps the content language chosen on this device (ADR 0017). Never touches
/// the network; the list of available languages comes from the remote data
/// source.
@lazySingleton
class ContentLanguageLocalDataSource {
  ContentLanguageLocalDataSource(this._prefs, this._device);

  /// Shared with whatever resolves curriculum text for the chosen language.
  static const String selectedKey = 'settings.content_language';

  final SharedPreferencesAsync _prefs;
  final DeviceLanguage _device;

  /// The stored choice; on first run it is set from the device language
  /// (ADR 0017), so a phone in English shows English curriculum text when the
  /// church has a translation, and the Spanish base otherwise.
  Future<String> readSelected() async {
    final stored = await _prefs.getString(selectedKey);
    if (stored != null) return stored;
    final initial = _device.code;
    await saveSelected(initial);
    return initial;
  }

  Future<void> saveSelected(String code) => _prefs.setString(selectedKey, code);

  Future<void> clearSelected() => _prefs.remove(selectedKey);
}
