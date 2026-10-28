import 'package:gold_roundtables/core/models/health_reason.dart';
import 'package:gold_roundtables/core/models/health_status.dart';
import 'package:gold_roundtables/features/admin/domain/models/admin_organization.dart';
import 'package:gold_roundtables/features/admin/domain/models/admin_person.dart';
import 'package:gold_roundtables/features/admin/domain/models/explorer_data.dart';
import 'package:gold_roundtables/features/admin/domain/models/explorer_organization.dart';
import 'package:gold_roundtables/features/admin/domain/models/explorer_table.dart';
import 'package:gold_roundtables/features/admin/domain/models/membership_role.dart';
import 'package:gold_roundtables/features/admin/domain/models/organization_status.dart';
import 'package:gold_roundtables/features/admin/domain/models/person_status.dart';
import 'package:gold_roundtables/features/admin/domain/models/round_table_status.dart';

ExplorerTable table(
  String code, {
  String org = 'org-luz',
  String orgName = 'Fundación Luz',
  String country = 'DO',
  HealthStatus health = HealthStatus.active,
  double? attendance = 90,
  int people = 6,
  int values = 5,
  double? improvement = 1,
  int late = 0,
  String? facilitator = 'Ana Pérez',
  DateTime? lastSession,
  List<HealthReason> reasons = const [],
}) => ExplorerTable(
  id: 'id-$code',
  code: code,
  name: 'Mesa $code',
  organizationId: org,
  organizationName: orgName,
  countryCode: country,
  locationId: 'loc-$org',
  locationName: 'Sede',
  weekday: 2,
  startTime: '19:00',
  timezone: 'America/Santo_Domingo',
  status: RoundTableStatus.active,
  health: health,
  facilitatorPersonId: facilitator == null ? null : 'fac-$facilitator',
  facilitatorName: facilitator,
  activePeople: people,
  maxPeople: 9,
  valuesCompleted: values,
  attendancePct: attendance,
  improvementAvg: improvement,
  syncedLateRows: late,
  lastSessionAt: lastSession,
  healthReasons: reasons,
);

AdminOrganization organization(
  String id,
  String name, {
  String country = 'DO',
  OrganizationStatus status = OrganizationStatus.active,
}) => AdminOrganization(
  id: id,
  name: name,
  kind: 'foundation',
  countryCode: country,
  countryName: country == 'DO' ? 'República Dominicana' : 'Colombia',
  region: 'Centro',
  status: status,
);

ExplorerOrganization explorerOrg(
  AdminOrganization org, {
  int tables = 2,
  bool coordinator = true,
}) => ExplorerOrganization(
  organization: org,
  tablesTotal: tables,
  hasActiveCoordinator: coordinator,
);

AdminPerson person(
  String id,
  String first,
  String last, {
  String? org = 'org-luz',
  PersonStatus status = PersonStatus.active,
  bool coordinator = false,
  MembershipRole? seat,
}) => AdminPerson(
  id: id,
  organizationId: org,
  firstName: first,
  lastName: last,
  email: '$first@x.test'.toLowerCase(),
  status: status,
  roles: coordinator
      ? [AdminPersonRole(id: 'r-$id', role: 'coordinator', organizationId: org)]
      : const [],
  tables: seat == null
      ? const []
      : [
          AdminPersonTable(
            tableMemberId: 'tm-$id',
            roundTableId: 'id-LUZ-01',
            roundTableName: 'Mesa LUZ-01',
            role: seat,
          ),
        ],
);

ExplorerData sampleData() {
  final luz = organization('org-luz', 'Fundación Luz');
  final hor = organization('org-hor', 'Colegio Horizonte', country: 'CO');
  return ExplorerData(
    tables: [
      table('LUZ-01', attendance: 92, late: 0),
      table(
        'LUZ-02',
        health: HealthStatus.delayed,
        attendance: 66,
        late: 3,
        lastSession: DateTime.utc(2026, 10, 1),
        reasons: const [HealthReason.lowAttendance],
      ),
      table(
        'HOR-01',
        org: 'org-hor',
        orgName: 'Colegio Horizonte',
        country: 'CO',
        health: HealthStatus.inactive,
        attendance: null,
        facilitator: null,
        people: 2,
        reasons: const [HealthReason.fewPeople],
      ),
    ],
    organizations: [
      explorerOrg(luz),
      explorerOrg(hor, tables: 0, coordinator: false),
    ],
    people: [
      person('p1', 'Ana', 'Peña', coordinator: true),
      person('p2', 'Luis', 'Ferrer', seat: MembershipRole.facilitator),
      person('p3', 'Marta', 'Quiroz', seat: MembershipRole.member),
      person('p4', 'Rodrigo', 'Paz', status: PersonStatus.invited),
      person('p5', 'Ernesto', 'Báez', status: PersonStatus.inactive),
    ],
  );
}
