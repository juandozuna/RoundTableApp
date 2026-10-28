import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../kpis/domain/models/kpi_table_row.dart';
import 'admin_person.dart';
import 'admin_table.dart';
import 'schedule_version.dart';
import 'table_membership.dart';

part 'table_detail.freezed.dart';

@freezed
abstract class TableDetail with _$TableDetail {
  const TableDetail._();

  const factory TableDetail({
    required AdminTable table,
    @Default([]) List<TableMembership> memberships,
    @Default([]) List<AdminTable> organizationTables,
    @Default([]) List<AdminPerson> organizationPeople,
    @Default([]) List<ScheduleVersion> scheduleVersions,
    KpiTableRow? kpi,
  }) = _TableDetail;

  List<TableMembership> get activeMembers =>
      memberships.where((m) => m.isActive).toList();

  /// Past seats, for the history timeline.
  List<TableMembership> get pastMembers =>
      memberships.where((m) => !m.isActive).toList();
}
