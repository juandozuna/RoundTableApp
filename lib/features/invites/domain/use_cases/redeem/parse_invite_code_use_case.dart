import 'package:injectable/injectable.dart';

import '../../models/invite_code.dart';

@injectable
class ParseInviteCodeUseCase {
  const ParseInviteCodeUseCase();

  /// The code inside a QR or pasted text, or `null` when it is not an invite.
  String? call(String raw) => InviteCode.parse(raw);
}
