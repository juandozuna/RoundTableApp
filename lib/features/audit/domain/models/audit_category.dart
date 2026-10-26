/// The chips of the Auditoría tab: groups of server `event_type`s.
enum AuditCategory {
  created([
    'organization.created',
    'location.created',
    'table.created',
    'member.added',
    'invite.created',
    'invite.accepted',
  ]),
  removed([
    'organization.status_changed',
    'member.deactivated',
    'person.deactivated',
    'invite.revoked',
  ]),
  reassigned(['table.facilitator_changed', 'member.moved']),
  session(['session.opened', 'session.closed', 'session.cancelled']),
  role(['role.granted', 'role.revoked']),
  sensitive(['answers.revealed']),
  changed([
    'organization.updated',
    'location.updated',
    'table.updated',
    'person.updated',
    'invite.renewed',
  ]);

  const AuditCategory(this.eventTypes);

  final List<String> eventTypes;

  static AuditCategory? forEventType(String eventType) {
    for (final category in values) {
      if (category.eventTypes.contains(eventType)) return category;
    }
    return null;
  }
}
