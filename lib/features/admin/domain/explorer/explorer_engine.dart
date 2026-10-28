import '../../../../core/models/health_status.dart';
import '../models/admin_person.dart';
import '../models/explorer_data.dart';
import '../models/explorer_organization.dart';
import '../models/explorer_query.dart';
import '../models/explorer_table.dart';
import '../models/organization_status.dart';
import '../models/person_status.dart';
import '../models/table_aggregate.dart';

/// What a person is in the platform, for the Personas grid.
enum PersonKind { administrator, coordinator, facilitator, member, unassigned }

typedef ExplorerFilterOption = ({String value, String label});

/// Pure search, filter, view and sort logic of the Explorador grids.
abstract final class ExplorerEngine {
  static PersonKind personKind(AdminPerson person) {
    if (person.isStaff) return PersonKind.administrator;
    if (person.isCoordinator) return PersonKind.coordinator;
    if (person.isFacilitator) return PersonKind.facilitator;
    if (person.tables.isNotEmpty) return PersonKind.member;
    return PersonKind.unassigned;
  }

  /// Lower-cases and strips Spanish diacritics so "Peña" matches "pena".
  static String fold(String value) {
    const from = 'áàäâéèëêíìïîóòöôúùüûñ';
    const to = 'aaaaeeeeiiiioooouuuun';
    final buffer = StringBuffer();
    for (final rune in value.toLowerCase().runes) {
      final char = String.fromCharCode(rune);
      final index = from.indexOf(char);
      buffer.write(index < 0 ? char : to[index]);
    }
    return buffer.toString();
  }

  // ── Tables ──────────────────────────────────────────────────────────────

  /// Rows after search and filters, before the view predicate.
  static List<ExplorerTable> tableBase(ExplorerData data, ExplorerQuery q) {
    final search = fold(q.search);
    final f = q.filters;
    return data.tables.where((t) {
      if (_set(f, ExplorerFilterKeys.country) &&
          t.countryCode != f[ExplorerFilterKeys.country]) {
        return false;
      }
      if (_set(f, ExplorerFilterKeys.organization) &&
          t.organizationId != f[ExplorerFilterKeys.organization]) {
        return false;
      }
      if (_set(f, ExplorerFilterKeys.location) &&
          t.locationId != f[ExplorerFilterKeys.location]) {
        return false;
      }
      if (_set(f, ExplorerFilterKeys.status) &&
          t.health.wireValue != f[ExplorerFilterKeys.status]) {
        return false;
      }
      if (_set(f, ExplorerFilterKeys.facilitator) &&
          t.facilitatorPersonId != f[ExplorerFilterKeys.facilitator]) {
        return false;
      }
      if (search.isEmpty) return true;
      final haystack = fold(
        '${t.code} ${t.name} ${t.organizationName} ${t.facilitatorName ?? ''}',
      );
      return haystack.contains(search);
    }).toList();
  }

  static bool tablePassesView(ExplorerTable t, String viewId) =>
      switch (ExplorerView.tryParse(viewId)) {
        ExplorerView.delayed => t.health == HealthStatus.delayed,
        ExplorerView.lowAttendance => t.hasLowAttendance,
        ExplorerView.fewPeople => t.hasFewPeople,
        ExplorerView.syncedLate => t.syncedLateRows > 0,
        _ => true,
      };

  static List<ExplorerTable> tables(ExplorerData data, ExplorerQuery q) {
    final rows = tableBase(
      data,
      q,
    ).where((t) => tablePassesView(t, q.viewId)).toList();
    rows.sort(_compare(q.ascending, (a, b) => _tableKey(q.sortKey, a, b)));
    return rows;
  }

  static int _tableKey(String key, ExplorerTable a, ExplorerTable b) =>
      switch (key) {
        'organization' => _text(a.organizationName, b.organizationName),
        'location' => _text(a.locationName, b.locationName),
        'facilitator' => _text(a.facilitatorName, b.facilitatorName),
        'seats' => a.activePeople.compareTo(b.activePeople),
        'status' => a.health.index.compareTo(b.health.index),
        'attendance' => _num(a.attendancePct, b.attendancePct),
        'values' => a.valuesCompleted.compareTo(b.valuesCompleted),
        'improvement' => _num(a.improvementAvg, b.improvementAvg),
        'late' => a.syncedLateRows.compareTo(b.syncedLateRows),
        'last' => _date(a.lastSessionAt, b.lastSessionAt),
        _ => _text(a.code, b.code),
      };

  static TableAggregate aggregate(List<ExplorerTable> tables) {
    var people = 0;
    var values = 0;
    var late = 0;
    var weightedAttendance = 0.0;
    var attendanceWeight = 0;
    var weightedImprovement = 0.0;
    var improvementWeight = 0;
    var active = 0;
    var delayed = 0;
    var inactive = 0;
    var low = 0;
    for (final t in tables) {
      people += t.activePeople;
      values += t.valuesCompleted;
      late += t.syncedLateRows;
      final attendance = t.attendancePct;
      if (attendance != null) {
        weightedAttendance += attendance * t.activePeople;
        attendanceWeight += t.activePeople;
      }
      final improvement = t.improvementAvg;
      if (improvement != null && t.valuesCompleted > 0) {
        weightedImprovement += improvement * t.valuesCompleted;
        improvementWeight += t.valuesCompleted;
      }
      switch (t.health) {
        case HealthStatus.active || HealthStatus.completed:
          active++;
        case HealthStatus.delayed:
          delayed++;
        case HealthStatus.inactive:
          inactive++;
      }
      if (t.hasLowAttendance) low++;
    }
    return TableAggregate(
      tables: tables.length,
      people: people,
      valuesCompleted: values,
      attendancePct: attendanceWeight == 0
          ? null
          : weightedAttendance / attendanceWeight,
      improvementAvg: improvementWeight == 0
          ? null
          : weightedImprovement / improvementWeight,
      syncedLateRows: late,
      active: active,
      delayed: delayed,
      inactive: inactive,
      lowAttendance: low,
    );
  }

  // ── Organizations ───────────────────────────────────────────────────────

  static List<ExplorerOrganization> organizationBase(
    ExplorerData data,
    ExplorerQuery q,
  ) {
    final search = fold(q.search);
    final f = q.filters;
    return data.organizations.where((o) {
      final org = o.organization;
      if (_set(f, ExplorerFilterKeys.country) &&
          org.countryCode != f[ExplorerFilterKeys.country]) {
        return false;
      }
      if (_set(f, ExplorerFilterKeys.status) &&
          org.status.wireValue != f[ExplorerFilterKeys.status]) {
        return false;
      }
      if (search.isEmpty) return true;
      return fold(
        '${org.name} ${org.region ?? ''} ${org.countryName}',
      ).contains(search);
    }).toList();
  }

  static bool organizationPassesView(ExplorerOrganization o, String viewId) =>
      switch (ExplorerView.tryParse(viewId)) {
        ExplorerView.paused =>
          o.organization.status != OrganizationStatus.active,
        ExplorerView.withoutTables => o.tablesTotal == 0,
        ExplorerView.withoutCoordinator => !o.hasActiveCoordinator,
        _ => true,
      };

  static List<ExplorerOrganization> organizations(
    ExplorerData data,
    ExplorerQuery q,
  ) {
    final rows = organizationBase(
      data,
      q,
    ).where((o) => organizationPassesView(o, q.viewId)).toList();
    rows.sort(
      _compare(
        q.ascending,
        (a, b) => switch (q.sortKey) {
          'country' => _text(
            a.organization.countryName,
            b.organization.countryName,
          ),
          'kind' => _text(a.organization.kind, b.organization.kind),
          'status' => a.organization.status.index.compareTo(
            b.organization.status.index,
          ),
          'tables' => a.tablesTotal.compareTo(b.tablesTotal),
          'people' => a.people.compareTo(b.people),
          'attendance' => _num(a.attendancePct, b.attendancePct),
          'improvement' => _num(a.improvementAvg, b.improvementAvg),
          _ => _text(a.organization.name, b.organization.name),
        },
      ),
    );
    return rows;
  }

  // ── People ──────────────────────────────────────────────────────────────

  static List<AdminPerson> peopleBase(ExplorerData data, ExplorerQuery q) {
    final search = fold(q.search);
    final f = q.filters;
    return data.people.where((p) {
      if (_set(f, ExplorerFilterKeys.organization) &&
          p.organizationId != f[ExplorerFilterKeys.organization]) {
        return false;
      }
      if (_set(f, ExplorerFilterKeys.role) &&
          personKind(p).name != f[ExplorerFilterKeys.role]) {
        return false;
      }
      if (_set(f, ExplorerFilterKeys.status) &&
          p.status.wireValue != f[ExplorerFilterKeys.status]) {
        return false;
      }
      if (search.isEmpty) return true;
      final tables = p.tables.map((t) => t.roundTableName ?? '').join(' ');
      return fold('${p.fullName} ${p.email ?? ''} $tables').contains(search);
    }).toList();
  }

  static bool personPassesView(AdminPerson p, String viewId) =>
      switch (ExplorerView.tryParse(viewId)) {
        ExplorerView.coordinators => personKind(p) == PersonKind.coordinator,
        ExplorerView.facilitators => personKind(p) == PersonKind.facilitator,
        ExplorerView.members => personKind(p) == PersonKind.member,
        ExplorerView.pendingInvites => p.status == PersonStatus.invited,
        ExplorerView.inactive => p.status == PersonStatus.inactive,
        _ => true,
      };

  static List<AdminPerson> people(ExplorerData data, ExplorerQuery q) {
    final rows = peopleBase(
      data,
      q,
    ).where((p) => personPassesView(p, q.viewId)).toList();
    final orgNames = organizationNames(data);
    rows.sort(
      _compare(
        q.ascending,
        (a, b) => switch (q.sortKey) {
          'role' => personKind(a).index.compareTo(personKind(b).index),
          'organization' => _text(
            orgNames[a.organizationId],
            orgNames[b.organizationId],
          ),
          'table' => _text(
            a.currentTable?.roundTableName,
            b.currentTable?.roundTableName,
          ),
          'status' => a.status.index.compareTo(b.status.index),
          _ => _text(a.fullName, b.fullName),
        },
      ),
    );
    return rows;
  }

  // ── Shared ──────────────────────────────────────────────────────────────

  static Map<String?, String> organizationNames(ExplorerData data) => {
    for (final o in data.organizations) o.id: o.organization.name,
  };

  /// Number of rows each built-in view would show for the current search and
  /// filters (the badge on the saved-view chips).
  static int viewCount(ExplorerData data, ExplorerQuery q, String viewId) =>
      switch (q.entity) {
        ExplorerEntity.tables => tableBase(
          data,
          q,
        ).where((t) => tablePassesView(t, viewId)).length,
        ExplorerEntity.organizations => organizationBase(
          data,
          q,
        ).where((o) => organizationPassesView(o, viewId)).length,
        ExplorerEntity.people => peopleBase(
          data,
          q,
        ).where((p) => personPassesView(p, viewId)).length,
      };

  /// Choices of each filter, narrowed by the filters already picked.
  static Map<String, List<ExplorerFilterOption>> filterOptions(
    ExplorerData data,
    ExplorerQuery q,
  ) {
    final countries = <String, String>{
      for (final o in data.organizations)
        o.organization.countryCode: o.organization.countryName,
    };
    final organizations = <ExplorerFilterOption>[
      for (final o in data.organizations)
        (value: o.id, label: o.organization.name),
    ];
    switch (q.entity) {
      case ExplorerEntity.tables:
        final org = q.filters[ExplorerFilterKeys.organization];
        final locations = <String, String>{};
        final facilitators = <String, String>{};
        for (final t in data.tables) {
          if (org != null && org.isNotEmpty && t.organizationId != org) {
            continue;
          }
          if (t.locationId != null) {
            locations[t.locationId!] = t.locationName ?? t.locationId!;
          }
          if (t.facilitatorPersonId != null) {
            facilitators[t.facilitatorPersonId!] =
                t.facilitatorName ?? t.facilitatorPersonId!;
          }
        }
        return {
          ExplorerFilterKeys.country: _options(countries),
          ExplorerFilterKeys.organization: organizations,
          ExplorerFilterKeys.location: _options(locations),
          ExplorerFilterKeys.facilitator: _options(facilitators),
          ExplorerFilterKeys.status: [
            for (final h in HealthStatus.values)
              (value: h.wireValue, label: h.wireValue),
          ],
        };
      case ExplorerEntity.organizations:
        return {
          ExplorerFilterKeys.country: _options(countries),
          ExplorerFilterKeys.status: [
            for (final s in OrganizationStatus.values)
              (value: s.wireValue, label: s.wireValue),
          ],
        };
      case ExplorerEntity.people:
        return {
          ExplorerFilterKeys.organization: organizations,
          ExplorerFilterKeys.role: [
            for (final k in PersonKind.values) (value: k.name, label: k.name),
          ],
          ExplorerFilterKeys.status: [
            for (final s in PersonStatus.values)
              (value: s.wireValue, label: s.wireValue),
          ],
        };
    }
  }

  static List<ExplorerFilterOption> _options(Map<String, String> map) {
    final list = [for (final e in map.entries) (value: e.key, label: e.value)];
    list.sort((a, b) => fold(a.label).compareTo(fold(b.label)));
    return list;
  }

  static bool _set(Map<String, String> filters, String key) =>
      (filters[key] ?? '').isNotEmpty;

  static int _text(String? a, String? b) {
    if (a == null && b == null) return 0;
    if (a == null) return 1;
    if (b == null) return -1;
    return fold(a).compareTo(fold(b));
  }

  static int _num(double? a, double? b) {
    if (a == null && b == null) return 0;
    if (a == null) return -1;
    if (b == null) return 1;
    return a.compareTo(b);
  }

  static int _date(DateTime? a, DateTime? b) {
    if (a == null && b == null) return 0;
    if (a == null) return -1;
    if (b == null) return 1;
    return a.compareTo(b);
  }

  static int Function(T, T) _compare<T>(
    bool ascending,
    int Function(T, T) by,
  ) =>
      (a, b) => ascending ? by(a, b) : by(b, a);
}
