// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audit_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuditEvent _$AuditEventFromJson(Map<String, dynamic> json) => _AuditEvent(
  id: json['id'] as String,
  organizationId: json['organization_id'] as String?,
  organizationName: json['organization_name'] as String?,
  actorPersonId: json['actor_person_id'] as String?,
  actorName: json['actor_name'] as String?,
  eventType: json['event_type'] as String,
  entityType: json['entity_type'] as String?,
  entityId: json['entity_id'] as String?,
  payload: json['payload'] as Map<String, dynamic>? ?? const {},
  createdAt: DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$AuditEventToJson(_AuditEvent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'organization_id': ?instance.organizationId,
      'organization_name': ?instance.organizationName,
      'actor_person_id': ?instance.actorPersonId,
      'actor_name': ?instance.actorName,
      'event_type': instance.eventType,
      'entity_type': ?instance.entityType,
      'entity_id': ?instance.entityId,
      'payload': instance.payload,
      'created_at': instance.createdAt.toIso8601String(),
    };
