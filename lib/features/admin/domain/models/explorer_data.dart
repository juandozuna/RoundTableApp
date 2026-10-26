import 'package:freezed_annotation/freezed_annotation.dart';

import 'admin_person.dart';
import 'explorer_organization.dart';
import 'explorer_table.dart';

part 'explorer_data.freezed.dart';

/// Everything the Explorador grids draw, loaded once per refresh.
@freezed
abstract class ExplorerData with _$ExplorerData {
  const factory ExplorerData({
    @Default([]) List<ExplorerTable> tables,
    @Default([]) List<ExplorerOrganization> organizations,
    @Default([]) List<AdminPerson> people,
    DateTime? loadedAt,
  }) = _ExplorerData;
}
