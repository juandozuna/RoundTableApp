import 'package:injectable/injectable.dart';

import '../../../../core/config/app_config.dart';
import '../../domain/models/auth_methods.dart';
import '../../domain/services/auth_methods_service.dart';

@LazySingleton(as: AuthMethodsService)
class AuthMethodsServiceImpl implements AuthMethodsService {
  AuthMethodsServiceImpl(AppConfig config)
    : enabled = EnabledAuthMethods.parse(config.authMethods);

  @override
  final EnabledAuthMethods enabled;
}
