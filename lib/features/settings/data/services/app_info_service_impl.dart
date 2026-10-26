import 'package:injectable/injectable.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../domain/models/app_info.dart';
import '../../domain/services/app_info_service.dart';

@LazySingleton(as: AppInfoService)
class AppInfoServiceImpl implements AppInfoService {
  @override
  Future<AppInfo> read() async {
    final info = await PackageInfo.fromPlatform();
    return AppInfo(
      appName: info.appName,
      version: info.version,
      buildNumber: info.buildNumber,
    );
  }
}
