import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/models/invite.dart';
import '../../../../domain/models/invite_problem.dart';
import '../../../../domain/models/invite_status.dart';

part 'invites_manager_state.freezed.dart';

enum InvitesManagerStatus { loading, ready, denied, failed }

enum InvitesManagerEventKind { renewed, revoked, failed }

/// One-shot outcome for a toast. [serial] makes repeated identical outcomes
/// distinct states.
@freezed
abstract class InvitesManagerEvent with _$InvitesManagerEvent {
  const factory InvitesManagerEvent({
    required InvitesManagerEventKind kind,
    required int serial,
    @Default(1) int count,
    InviteProblem? problem,
  }) = _InvitesManagerEvent;
}

@freezed
abstract class InvitesManagerState with _$InvitesManagerState {
  const factory InvitesManagerState({
    @Default(InvitesManagerStatus.loading) InvitesManagerStatus status,
    @Default([]) List<Invite> invites,

    /// `null` shows every status.
    InviteStatus? filter,
    @Default('') String query,
    @Default({}) Set<String> selectedIds,

    /// A renew/revoke call is running.
    @Default(false) bool busy,
    InviteProblem? problem,
    @Default(true) bool online,
    InvitesManagerEvent? event,
  }) = _InvitesManagerState;

  const InvitesManagerState._();

  int countFor(InviteStatus? status) => status == null
      ? invites.length
      : invites.where((invite) => invite.status == status).length;

  /// Invites after the status filter and the search text.
  List<Invite> get visible {
    final text = query.trim().toLowerCase();
    return [
      for (final invite in invites)
        if ((filter == null || invite.status == filter) &&
            (text.isEmpty ||
                '${invite.person.fullName} ${invite.person.email ?? ''}'
                    .toLowerCase()
                    .contains(text)))
          invite,
    ];
  }

  List<Invite> get selected => [
    for (final invite in invites)
      if (selectedIds.contains(invite.id)) invite,
  ];

  bool get allVisibleSelected =>
      visible.isNotEmpty &&
      visible.every((invite) => selectedIds.contains(invite.id));
}
