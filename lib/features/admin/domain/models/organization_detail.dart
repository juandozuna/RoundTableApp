import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../audit/domain/models/audit_event.dart';
import '../../../kpis/domain/models/kpi_breakdown_row.dart';
import 'admin_location.dart';
import 'admin_organization.dart';
import 'admin_person.dart';
import 'admin_table.dart';

part 'organization_detail.freezed.dart';

@freezed
abstract class OrganizationDetail with _$OrganizationDetail {
  const factory OrganizationDetail({
    required AdminOrganization organization,
    @Default([]) List<AdminLocation> locations,
    @Default([]) List<AdminTable> tables,
    @Default([]) List<AdminPerson> people,
    KpiBreakdownRow? rollup,
    @Default([]) List<AuditEvent> recentActivity,
  }) = _OrganizationDetail;
}
