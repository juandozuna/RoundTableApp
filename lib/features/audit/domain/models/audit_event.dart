import 'package:freezed_annotation/freezed_annotation.dart';

part 'audit_event.freezed.dart';
part 'audit_event.g.dart';

/// A row of the `audit_log` view: who did what to which entity.
@freezed
abstract class AuditEvent with _$AuditEvent {
  const factory AuditEvent({
    required String id,
    String? organizationId,
    String? organizationName,
    String? actorPersonId,
    String? actorName,
    required String eventType,
    String? entityType,
    String? entityId,
    @Default({}) Map<String, dynamic> payload,
    required DateTime createdAt,
  }) = _AuditEvent;

  factory AuditEvent.fromJson(Map<String, dynamic> json) =>
      _$AuditEventFromJson(json);
}
