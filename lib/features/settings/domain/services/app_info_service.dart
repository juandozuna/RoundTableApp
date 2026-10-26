import '../models/app_info.dart';

abstract interface class AppInfoService {
  Future<AppInfo> read();
}
