import 'package:injectable/injectable.dart';

import '../../models/session_draft.dart';
import '../../services/session_draft_service.dart';

@injectable
class SaveSessionDraftUseCase {
  const SaveSessionDraftUseCase(this._drafts);

  final SessionDraftService _drafts;

  Future<void> call({
    required String sessionId,
    required String personId,
    required SessionDraft draft,
  }) => _drafts.save(sessionId: sessionId, personId: personId, draft: draft);
}
