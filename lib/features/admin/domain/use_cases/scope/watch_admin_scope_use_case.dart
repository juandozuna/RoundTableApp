import 'package:injectable/injectable.dart';

import '../../models/admin_scope.dart';
import '../../services/admin_scope_service.dart';

@injectable
class WatchAdminScopeUseCase {
  const WatchAdminScopeUseCase(this._scope);

  final AdminScopeService _scope;

  Stream<AdminScope?> call() => _scope.watch();
}
