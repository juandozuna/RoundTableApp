import 'package:injectable/injectable.dart';

import '../../domain/models/audit_event.dart';
import '../../domain/models/audit_query.dart';
import '../../domain/services/audit_service.dart';
import '../datasources/audit_remote_data_source.dart';

@LazySingleton(as: AuditService)
class AuditServiceImpl implements AuditService {
  AuditServiceImpl(this._remote);

  final AuditRemoteDataSource _remote;

  @override
  Future<List<AuditEvent>> events(AuditQuery query) => _remote.events(query);
}
