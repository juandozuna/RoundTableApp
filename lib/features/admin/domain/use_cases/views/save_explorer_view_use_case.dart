import 'package:injectable/injectable.dart';

import '../../../../../core/services/id/id_generator.dart';
import '../../models/explorer_query.dart';
import '../../models/saved_explorer_view.dart';
import '../../services/saved_views_service.dart';

/// Saves the current table query as a named view and returns all views.
@injectable
class SaveExplorerViewUseCase {
  const SaveExplorerViewUseCase(this._views, this._ids);

  final SavedViewsService _views;
  final IdGenerator _ids;

  Future<List<SavedExplorerView>> call({
    required String name,
    required ExplorerQuery query,
  }) async {
    final view = SavedExplorerView(
      id: '${ExplorerView.customPrefix}${_ids.newId()}',
      name: name.trim(),
      filters: {
        for (final entry in query.filters.entries)
          if (entry.value.isNotEmpty) entry.key: entry.value,
      },
      search: query.search,
      sortKey: query.sortKey,
      ascending: query.ascending,
    );
    final next = [...await _views.load(), view];
    await _views.save(next);
    return next;
  }
}
