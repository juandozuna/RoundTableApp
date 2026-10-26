import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/models/admin_organization.dart';
import '../../../../domain/models/admin_table.dart';
import '../../../../domain/models/saved_explorer_view.dart';

part 'command_palette_state.freezed.dart';

@freezed
abstract class CommandPaletteState with _$CommandPaletteState {
  const factory CommandPaletteState({
    @Default(true) bool loading,
    @Default([]) List<AdminOrganization> organizations,
    @Default([]) List<AdminTable> tables,
    @Default([]) List<SavedExplorerView> savedViews,
  }) = _CommandPaletteState;
}
