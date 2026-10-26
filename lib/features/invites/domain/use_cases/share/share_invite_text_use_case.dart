import 'package:injectable/injectable.dart';

import '../../../../../core/services/share/share_service.dart';

@injectable
class ShareInviteTextUseCase {
  const ShareInviteTextUseCase(this._share);

  final ShareService _share;

  Future<void> call(String text, {String? subject}) =>
      _share.shareText(text, subject: subject);
}
