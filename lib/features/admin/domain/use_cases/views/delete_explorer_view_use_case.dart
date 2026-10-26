import 'package:injectable/injectable.dart';

import '../../models/saved_explorer_view.dart';
import '../../services/saved_views_service.dart';

@injectable
class DeleteExplorerViewUseCase {
  const DeleteExplorerViewUseCase(this._views);

  final SavedViewsService _views;

  Future<List<SavedExplorerView>> call(String id) async {
    final next = [
      for (final view in await _views.load())
        if (view.id != id) view,
    ];
    await _views.save(next);
    return next;
  }
}
