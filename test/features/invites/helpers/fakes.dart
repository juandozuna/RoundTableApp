import 'dart:async';

import 'package:gold_roundtables/core/models/user_role.dart';
import 'package:gold_roundtables/core/services/clock/clock_service.dart';
import 'package:gold_roundtables/core/services/connectivity/connectivity_service.dart';
import 'package:gold_roundtables/core/services/session_context/session_context.dart';
import 'package:gold_roundtables/core/services/session_context/session_context_service.dart';
import 'package:gold_roundtables/features/auth/domain/models/access_state.dart';
import 'package:gold_roundtables/features/auth/domain/models/account_context.dart';
import 'package:gold_roundtables/features/auth/domain/models/auth_failure.dart';
import 'package:gold_roundtables/features/auth/domain/models/auth_provider.dart';
import 'package:gold_roundtables/features/auth/domain/models/person_status.dart';
import 'package:gold_roundtables/features/auth/domain/models/signed_in_user.dart';
import 'package:gold_roundtables/features/auth/domain/services/access_session_service.dart';
import 'package:gold_roundtables/features/auth/domain/services/auth_service.dart';
import 'package:gold_roundtables/features/invites/domain/models/invite.dart';
import 'package:gold_roundtables/features/invites/domain/models/invite_person.dart';
import 'package:gold_roundtables/features/invites/domain/models/invite_preview.dart';
import 'package:gold_roundtables/features/invites/domain/models/invite_problem.dart';
import 'package:gold_roundtables/features/invites/domain/models/invite_role_kind.dart';
import 'package:gold_roundtables/features/invites/domain/models/invite_scope.dart';
import 'package:gold_roundtables/features/invites/domain/models/invite_status.dart';
import 'package:gold_roundtables/features/invites/domain/models/invite_target_organization.dart';
import 'package:gold_roundtables/features/invites/domain/models/invite_target_table.dart';
import 'package:gold_roundtables/features/invites/domain/models/new_invite.dart';
import 'package:gold_roundtables/features/invites/domain/models/redeem_profile.dart';
import 'package:gold_roundtables/features/invites/domain/models/redeem_result.dart';
import 'package:gold_roundtables/features/invites/domain/services/invite_directory_service.dart';
import 'package:gold_roundtables/features/invites/domain/services/invite_service.dart';

class FixedClock implements ClockService {
  FixedClock(this.now);

  DateTime now;

  @override
  DateTime nowUtc() => now;
}

class FakeConnectivity implements ConnectivityService {
  final StreamController<bool> controller = StreamController<bool>.broadcast();
  bool online = true;

  @override
  Future<bool> isOnline() async => online;

  @override
  Stream<bool> watchOnline() async* {
    yield online;
    yield* controller.stream;
  }
}

class FakeSessionContext implements SessionContextService {
  FakeSessionContext([this._current]);

  SessionContext? _current;
  final StreamController<SessionContext?> _changes =
      StreamController<SessionContext?>.broadcast();

  @override
  SessionContext? get current => _current;

  @override
  Stream<SessionContext?> watch() async* {
    yield _current;
    yield* _changes.stream;
  }

  @override
  Future<void> select(SessionContext context) async {
    _current = context;
    _changes.add(context);
  }

  @override
  Future<void> clear() async {
    _current = null;
    _changes.add(null);
  }
}

const adminSession = SessionContext(
  role: UserRole.administrator,
  personId: 'p-admin',
);

const coordinatorSession = SessionContext(
  role: UserRole.coordinator,
  personId: 'p-coord',
  organizationId: 'org-luz',
  organizationName: 'Fundación Luz',
);

const facilitatorSession = SessionContext(
  role: UserRole.facilitator,
  personId: 'p-fac',
  organizationId: 'org-luz',
  tableId: 'table-esperanza',
  tableName: 'Mesa Esperanza 03',
);

const memberSession = SessionContext(
  role: UserRole.member,
  personId: 'p-mem',
  organizationId: 'org-luz',
  tableId: 'table-esperanza',
);

Invite makeInvite(
  String id, {
  InviteStatus status = InviteStatus.pending,
  String first = 'Valeria',
  String last = 'Cordero',
  InviteRoleKind role = InviteRoleKind.member,
  String code = 'MESA34',
}) => Invite(
  id: id,
  code: code,
  roleKind: role,
  status: status,
  organizationId: 'org-luz',
  organizationName: 'Fundación Luz',
  roundTableId: role == InviteRoleKind.coordinator ? null : 'table-esperanza',
  roundTableName: role == InviteRoleKind.coordinator
      ? null
      : 'Mesa Esperanza 03',
  person: InvitePerson(
    id: 'person-$id',
    firstName: first,
    lastName: last,
    email: '${first.toLowerCase()}@ejemplo.org',
    phone: '+573005550148',
    status: PersonStatus.invited,
  ),
  expiresAt: DateTime.utc(2026, 11, 8),
  inviteUrl: 'http://127.0.0.1:3000/invite/$code',
);

const previewMesa34 = InvitePreview(
  code: 'MESA34',
  roleKind: InviteRoleKind.member,
  organizationName: 'Fundación Luz',
  roundTableName: 'Mesa Esperanza 03',
  personFirstName: 'Rodrigo',
  invitedByName: 'Sofía Herrera',
);

class FakeInviteService implements InviteService {
  final Map<String, InviteFailure> previewFailures = {};
  InviteFailure? redeemFailure;
  InviteFailure? listFailure;
  InviteFailure? createFailure;
  List<Invite> invites = [];
  RedeemResult? redeemResult;
  final List<String> calls = [];
  NewInvite? lastCreated;
  RedeemProfile? lastProfile;

  @override
  Future<InvitePreview> preview(String code) async {
    calls.add('preview:$code');
    final failure = previewFailures[code];
    if (failure != null) throw failure;
    return previewMesa34.copyWith(code: code);
  }

  @override
  Future<RedeemResult> redeem(String code, RedeemProfile profile) async {
    calls.add('redeem:$code');
    lastProfile = profile;
    final failure = redeemFailure;
    if (failure != null) throw failure;
    return redeemResult!;
  }

  @override
  Future<Invite> create(NewInvite input) async {
    calls.add('create');
    lastCreated = input;
    final failure = createFailure;
    if (failure != null) throw failure;
    return makeInvite(
      'new',
      first: input.person.firstName,
      role: input.roleKind,
    );
  }

  @override
  Future<List<Invite>> list(InviteScope scope, {InviteStatus? status}) async {
    calls.add('list:${scope.organizationId ?? ''}:${scope.roundTableId ?? ''}');
    final failure = listFailure;
    if (failure != null) throw failure;
    return invites;
  }

  @override
  Future<Invite> revoke(String inviteId) async {
    calls.add('revoke:$inviteId');
    final current = invites.firstWhere((i) => i.id == inviteId);
    return current.copyWith(status: InviteStatus.revoked);
  }

  @override
  Future<Invite> renew(String inviteId, {int? expiresInDays}) async {
    calls.add('renew:$inviteId');
    final current = invites.firstWhere((i) => i.id == inviteId);
    return current.copyWith(status: InviteStatus.pending, code: 'NEWC0D');
  }
}

class FakeDirectory implements InviteDirectoryService {
  List<InviteTargetOrganization> orgs = const [
    InviteTargetOrganization(id: 'org-luz', name: 'Fundación Luz'),
    InviteTargetOrganization(id: 'org-hor', name: 'Colegio Horizonte'),
  ];
  Map<String, List<InviteTargetTable>> tablesByOrg = {
    'org-luz': [
      const InviteTargetTable(
        id: 'table-esperanza',
        organizationId: 'org-luz',
        name: 'Mesa Esperanza 03',
        activePeople: 8,
        facilitatorPersonId: 'p-fac',
      ),
      const InviteTargetTable(
        id: 'table-fe',
        organizationId: 'org-luz',
        name: 'Mesa Fe 01',
        activePeople: 9,
      ),
    ],
    'org-hor': [
      const InviteTargetTable(
        id: 'table-hor',
        organizationId: 'org-hor',
        name: 'Mesa Horizonte 02',
        activePeople: 4,
      ),
    ],
  };

  @override
  Future<List<InviteTargetOrganization>> organizations() async => orgs;

  @override
  Future<List<InviteTargetTable>> tables({
    String? organizationId,
    String? tableId,
  }) async {
    final all = tablesByOrg.values.expand((t) => t);
    return [
      for (final table in all)
        if ((organizationId == null ||
                table.organizationId == organizationId) &&
            (tableId == null || table.id == tableId))
          table,
    ];
  }
}

class FakeAuthService implements AuthService {
  FakeAuthService([SignedInUser? user]) : _user = user;

  SignedInUser? _user;
  final StreamController<SignedInUser?> _users =
      StreamController<SignedInUser?>.broadcast();
  final StreamController<AuthFailure> failureController =
      StreamController<AuthFailure>.broadcast();
  AuthFailure? throwOnSignIn;
  String? lastReturnPath;
  int signOuts = 0;

  void emitUser(SignedInUser? user) {
    _user = user;
    _users.add(user);
  }

  @override
  SignedInUser? get currentUser => _user;

  @override
  Stream<AuthFailure> get failures => failureController.stream;

  @override
  Future<void> signInWithProvider(
    AuthProvider provider, {
    String? returnPath,
  }) async {
    lastReturnPath = returnPath;
    final failure = throwOnSignIn;
    if (failure != null) throw failure;
  }

  @override
  Future<void> signOut() async {
    signOuts++;
    emitUser(null);
  }

  @override
  Stream<SignedInUser?> watchUser() => _users.stream;
}

class FakeAccess implements AccessSessionService {
  final List<String?> refreshes = [];

  @override
  AccessState get state => const AccessState();

  @override
  Stream<AccessState> watch() => const Stream.empty();

  @override
  Future<void> refresh({String? preferPersonId}) async =>
      refreshes.add(preferPersonId);

  @override
  Future<void> selectContext(AccountContext context) async {}
}
