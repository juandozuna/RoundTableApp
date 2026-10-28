import 'package:freezed_annotation/freezed_annotation.dart';

import 'admin_location.dart';
import 'admin_organization.dart';
import 'admin_person.dart';
import 'admin_table.dart';
import 'program_value.dart';

part 'table_form_data.freezed.dart';

@freezed
abstract class TableFormData with _$TableFormData {
  const factory TableFormData({
    AdminTable? table,
    @Default([]) List<AdminOrganization> organizations,
    @Default([]) List<AdminLocation> locations,
    @Default([]) List<AdminPerson> people,
    @Default([]) List<AdminTable> organizationTables,
    @Default([]) List<ProgramValue> programValues,
  }) = _TableFormData;
}
