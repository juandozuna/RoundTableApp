import 'package:injectable/injectable.dart';

import '../../models/session_draft.dart';
import '../../services/session_draft_service.dart';

@injectable
class LoadSessionDraftUseCase {
  const LoadSessionDraftUseCase(this._drafts);

  final SessionDraftService _drafts;

  Future<SessionDraft?> call({
    required String sessionId,
    required String personId,
  }) => _drafts.load(sessionId: sessionId, personId: personId);
}
