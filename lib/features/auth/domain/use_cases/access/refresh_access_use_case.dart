import 'package:injectable/injectable.dart';

import '../../services/access_session_service.dart';

@injectable
class RefreshAccessUseCase {
  const RefreshAccessUseCase(this._access);

  final AccessSessionService _access;

  Future<void> call({String? preferPersonId}) =>
      _access.refresh(preferPersonId: preferPersonId);
}
