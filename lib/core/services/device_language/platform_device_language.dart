import 'dart:ui';

import 'package:injectable/injectable.dart';

import 'device_language.dart';

@LazySingleton(as: DeviceLanguage)
class PlatformDeviceLanguage implements DeviceLanguage {
  @override
  String get code =>
      PlatformDispatcher.instance.locale.languageCode.toLowerCase();
}
