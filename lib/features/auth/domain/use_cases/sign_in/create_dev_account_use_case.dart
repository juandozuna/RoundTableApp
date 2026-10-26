import 'package:injectable/injectable.dart';

import '../../services/dev_auth_service.dart';

@injectable
class CreateDevAccountUseCase {
  const CreateDevAccountUseCase(this._dev);

  final DevAuthService _dev;

  Future<String> call() => _dev.createAccount();
}
