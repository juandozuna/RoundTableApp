import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/services/connectivity/watch_connectivity_use_case.dart';
import 'package:gold_roundtables/core/services/session_context/watch_session_context_use_case.dart';
import 'package:gold_roundtables/features/invites/domain/models/invite_problem.dart';
import 'package:gold_roundtables/features/invites/domain/models/invite_status.dart';
import 'package:gold_roundtables/features/invites/domain/use_cases/manage/list_invites_use_case.dart';
import 'package:gold_roundtables/features/invites/domain/use_cases/manage/renew_invite_use_case.dart';
import 'package:gold_roundtables/features/invites/domain/use_cases/manage/revoke_invite_use_case.dart';
import 'package:gold_roundtables/features/invites/presentation/pages/manager/cubit/invites_manager_cubit.dart';
import 'package:gold_roundtables/features/invites/presentation/pages/manager/cubit/invites_manager_state.dart';

import '../helpers/fakes.dart';

void main() {
  late FakeInviteService invites;
  late FakeSessionContext session;
  late FakeConnectivity connectivity;

  InvitesManagerCubit build() => InvitesManagerCubit(
    ListInvitesUseCase(invites),
    RevokeInviteUseCase(invites),
    RenewInviteUseCase(invites),
    WatchSessionContextUseCase(session),
    WatchConnectivityUseCase(connectivity),
  );

  Future<InvitesManagerCubit> loaded() async {
    final cubit = build();
    await cubit.stream.firstWhere(
      (s) => s.status == InvitesManagerStatus.ready,
    );
    return cubit;
  }

  setUp(() {
    invites = FakeInviteService()
      ..invites = [
        makeInvite('1'),
        makeInvite(
          '2',
          status: InviteStatus.accepted,
          first: 'Camila',
          last: 'Ortiz',
        ),
        makeInvite(
          '3',
          status: InviteStatus.expired,
          first: 'Rosa',
          last: 'Marte',
        ),
        makeInvite(
          '4',
          status: InviteStatus.revoked,
          first: 'Tomás',
          last: 'Quispe',
        ),
      ];
    session = FakeSessionContext(facilitatorSession);
    connectivity = FakeConnectivity();
  });

  test('a facilitator lists the invites of their own table', () async {
    final cubit = await loaded();
    expect(invites.calls, ['list::table-esperanza']);
    expect(cubit.state.invites, hasLength(4));
    await cubit.close();
  });

  test(
    'a coordinator lists the organization; switching context reloads',
    () async {
      session = FakeSessionContext(coordinatorSession);
      final cubit = await loaded();
      expect(invites.calls.single, 'list:org-luz:');

      await session.select(facilitatorSession);
      await cubit.stream.firstWhere(
        (s) => s.status == InvitesManagerStatus.ready,
      );
      expect(invites.calls.last, 'list::table-esperanza');
      await cubit.close();
    },
  );

  test('a member is denied', () async {
    session = FakeSessionContext(memberSession);
    final cubit = build();
    final state = await cubit.stream.firstWhere(
      (s) => s.status != InvitesManagerStatus.loading,
    );
    expect(state.status, InvitesManagerStatus.denied);
    expect(invites.calls, isEmpty);
    await cubit.close();
  });

  test(
    'filters by status, with counts, and searches by name or email',
    () async {
      final cubit = await loaded();

      expect(cubit.state.countFor(null), 4);
      expect(cubit.state.countFor(InviteStatus.accepted), 1);

      cubit.setFilter(InviteStatus.expired);
      expect(cubit.state.visible.map((i) => i.person.firstName), ['Rosa']);

      cubit.setFilter(null);
      cubit.setQuery('ortiz');
      expect(cubit.state.visible.map((i) => i.person.firstName), ['Camila']);
      cubit.setQuery('VALERIA@');
      expect(cubit.state.visible.map((i) => i.id), ['1']);
      await cubit.close();
    },
  );

  test('bulk selection covers the visible rows only', () async {
    final cubit = await loaded();
    cubit.setFilter(InviteStatus.pending);
    cubit.toggleAllVisible();
    expect(cubit.state.selectedIds, {'1'});
    cubit.toggleAllVisible();
    expect(cubit.state.selectedIds, isEmpty);
    cubit.toggleSelected('3');
    expect(cubit.state.selected.single.id, '3');
    await cubit.close();
  });

  test('revoking updates the rows in place and reports the count', () async {
    final cubit = await loaded();
    await cubit.revoke(['1', '3']);

    expect(invites.calls, containsAll(['revoke:1', 'revoke:3']));
    expect(cubit.state.countFor(InviteStatus.revoked), 3);
    expect(cubit.state.event?.kind, InvitesManagerEventKind.revoked);
    expect(cubit.state.event?.count, 2);
    expect(cubit.state.busy, isFalse);
    await cubit.close();
  });

  test('renewing a single invite hands it back for sharing', () async {
    final cubit = await loaded();
    final renewed = await cubit.renew(['3']);

    expect(renewed?.code, 'NEWC0D');
    expect(
      cubit.state.invites.firstWhere((i) => i.id == '3').status,
      InviteStatus.pending,
    );
    expect(cubit.state.event?.kind, InvitesManagerEventKind.renewed);
    await cubit.close();
  });

  test('bulk renew reports how many and returns nothing to share', () async {
    final cubit = await loaded();
    expect(await cubit.renew(['1', '3']), isNull);
    expect(cubit.state.event?.count, 2);
    await cubit.close();
  });

  test('load failures keep the reason and retry when back online', () async {
    invites.listFailure = const InviteFailure(InviteProblem.offline);
    final cubit = build();
    final failed = await cubit.stream.firstWhere(
      (s) => s.status == InvitesManagerStatus.failed,
    );
    expect(failed.problem, InviteProblem.offline);

    invites.listFailure = null;
    connectivity.controller.add(false);
    connectivity.controller.add(true);
    await cubit.stream.firstWhere(
      (s) => s.status == InvitesManagerStatus.ready,
    );
    await cubit.close();
  });
}
