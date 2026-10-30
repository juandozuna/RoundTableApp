import 'package:injectable/injectable.dart';

import '../../models/auth_methods.dart';
import '../../services/auth_methods_service.dart';

@injectable
class GetEnabledAuthMethodsUseCase {
  const GetEnabledAuthMethodsUseCase(this._methods);

  final AuthMethodsService _methods;

  EnabledAuthMethods call() => _methods.enabled;
}
