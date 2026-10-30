import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/services/device_language/device_language.dart';
import 'package:gold_roundtables/features/settings/data/datasources/content_language_local_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_platform_interface/in_memory_shared_preferences_async.dart';
import 'package:shared_preferences_platform_interface/shared_preferences_async_platform_interface.dart';

class _DeviceLanguage implements DeviceLanguage {
  _DeviceLanguage(this.code);

  @override
  String code;
}

/// First run takes the device language (ADR 0017); a stored choice wins.
void main() {
  late _DeviceLanguage device;
  late ContentLanguageLocalDataSource local;

  setUp(() {
    SharedPreferencesAsyncPlatform.instance =
        InMemorySharedPreferencesAsync.empty();
    device = _DeviceLanguage('en');
    local = ContentLanguageLocalDataSource(SharedPreferencesAsync(), device);
  });

  test('first run uses and keeps the device language', () async {
    expect(await local.readSelected(), 'en');

    device.code = 'es';
    expect(await local.readSelected(), 'en');
  });

  test('a chosen language wins over the device language', () async {
    await local.saveSelected('pt');

    expect(await local.readSelected(), 'pt');
  });

  test('clearing the choice takes the device language again', () async {
    await local.saveSelected('pt');
    await local.clearSelected();
    device.code = 'es';

    expect(await local.readSelected(), 'es');
  });
}
