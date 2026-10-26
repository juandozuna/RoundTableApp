import 'package:injectable/injectable.dart';

import '../../models/saved_explorer_view.dart';
import '../../services/saved_views_service.dart';

@injectable
class LoadSavedViewsUseCase {
  const LoadSavedViewsUseCase(this._views);

  final SavedViewsService _views;

  Future<List<SavedExplorerView>> call() => _views.load();
}
