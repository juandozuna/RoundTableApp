import '../models/audit_event.dart';
import '../models/audit_query.dart';

/// Online read of the audit log, scoped by the server (platform admin: all;
/// coordinator: own organization). The log cannot be edited.
abstract interface class AuditService {
  Future<List<AuditEvent>> events(AuditQuery query);
}
