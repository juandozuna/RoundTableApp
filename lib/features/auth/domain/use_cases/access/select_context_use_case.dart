import 'package:injectable/injectable.dart';

import '../../models/account_context.dart';
import '../../services/access_session_service.dart';

@injectable
class SelectContextUseCase {
  const SelectContextUseCase(this._access);

  final AccessSessionService _access;

  Future<void> call(AccountContext context) => _access.selectContext(context);
}
