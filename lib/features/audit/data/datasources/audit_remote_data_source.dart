import 'package:injectable/injectable.dart';

import '../../../../core/network/api_guard.dart';
import '../../domain/models/audit_event.dart';
import '../../domain/models/audit_query.dart';
import '../client/audit_client.dart';

@lazySingleton
class AuditRemoteDataSource {
  AuditRemoteDataSource(this._client);

  final AuditClient _client;

  Future<List<AuditEvent>> events(AuditQuery query) {
    final category = query.category;
    final organizationId = query.organizationId;
    return guardApiCall(
      () => _client.events({
        'select': '*',
        'order': 'created_at.desc',
        'limit': query.limit,
        if (category != null)
          'event_type': 'in.(${category.eventTypes.join(',')})',
        if (organizationId != null) 'organization_id': 'eq.$organizationId',
      }),
    );
  }
}
