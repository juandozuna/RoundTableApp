import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/network/api_exception.dart';
import '../../../../domain/use_cases/directory/load_organizations_use_case.dart';
import '../../../../domain/use_cases/directory/load_tables_use_case.dart';
import '../../../../domain/use_cases/views/load_saved_views_use_case.dart';
import 'command_palette_state.dart';

/// Data the ⌘/Ctrl+K palette searches: organizations, tables, saved views.
/// Loading is best effort; actions and navigation work without it.
@injectable
class CommandPaletteCubit extends Cubit<CommandPaletteState> {
  CommandPaletteCubit(this._organizations, this._tables, this._views)
    : super(const CommandPaletteState());

  final LoadOrganizationsUseCase _organizations;
  final LoadTablesUseCase _tables;
  final LoadSavedViewsUseCase _views;

  Future<void> load() async {
    try {
      final views = await _views();
      emit(state.copyWith(savedViews: views));
      final organizations = _organizations();
      final tables = _tables();
      emit(
        state.copyWith(
          loading: false,
          organizations: await organizations,
          tables: await tables,
        ),
      );
    } on ApiException {
      emit(state.copyWith(loading: false));
    }
  }
}
