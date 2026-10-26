import 'package:injectable/injectable.dart';

import '../../models/app_info.dart';
import '../../services/app_info_service.dart';

@injectable
class LoadAppInfoUseCase {
  const LoadAppInfoUseCase(this._appInfo);

  final AppInfoService _appInfo;

  Future<AppInfo> call() => _appInfo.read();
}
