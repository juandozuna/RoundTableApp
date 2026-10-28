import 'package:freezed_annotation/freezed_annotation.dart';

import 'upcoming_session.dart';

part 'upcoming_sessions.freezed.dart';

/// Whose sessions the calendar lists, which decides whether it can be
/// filtered.
enum UpcomingScope {
  /// Coordinator or administrator: every table they manage, filterable.
  manager,

  /// Facilitator: the table they lead, from the local database.
  facilitator,

  /// The active context has no calendar (member, or no context yet).
  unavailable,
}

/// A selectable value of a filter.
@freezed
abstract class UpcomingOption with _$UpcomingOption {
  const factory UpcomingOption({required String id, required String label}) =
      _UpcomingOption;
}

/// The sessions of the active context, soonest first.
@freezed
abstract class UpcomingSessions with _$UpcomingSessions {
  const UpcomingSessions._();

  const factory UpcomingSessions({
    required UpcomingScope scope,
    @Default([]) List<UpcomingSession> sessions,
  }) = _UpcomingSessions;

  bool get canFilter => scope == UpcomingScope.manager;

  List<UpcomingOption> get locations =>
      _options((s) => s.locationId, (s) => s.locationName);

  List<UpcomingOption> get facilitators =>
      _options((s) => s.facilitatorId, (s) => s.facilitatorName);

  List<UpcomingOption> get tables =>
      _options((s) => s.roundTableId, (s) => s.tableName);

  List<UpcomingOption> _options(
    String? Function(UpcomingSession) id,
    String? Function(UpcomingSession) label,
  ) {
    final byId = <String, String>{};
    for (final session in sessions) {
      final key = id(session);
      if (key != null) byId.putIfAbsent(key, () => label(session) ?? key);
    }
    return [
      for (final entry in byId.entries)
        UpcomingOption(id: entry.key, label: entry.value),
    ]..sort((a, b) => a.label.toLowerCase().compareTo(b.label.toLowerCase()));
  }
}
