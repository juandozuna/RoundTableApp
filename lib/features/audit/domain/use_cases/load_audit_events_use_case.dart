import 'package:injectable/injectable.dart';

import '../models/audit_event.dart';
import '../models/audit_query.dart';
import '../services/audit_service.dart';

@injectable
class LoadAuditEventsUseCase {
  const LoadAuditEventsUseCase(this._audit);

  final AuditService _audit;

  Future<List<AuditEvent>> call(AuditQuery query) => _audit.events(query);
}
