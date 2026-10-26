import 'package:injectable/injectable.dart';

import '../../../../../core/services/share/share_service.dart';

/// Opens the platform share sheet with an invite message (WhatsApp, mail…).
@injectable
class ShareInviteUseCase {
  const ShareInviteUseCase(this._share);

  final ShareService _share;

  Future<void> call(String message, {String? subject}) =>
      _share.shareText(message, subject: subject);
}
