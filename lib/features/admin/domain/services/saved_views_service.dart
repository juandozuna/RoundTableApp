import '../models/saved_explorer_view.dart';

/// Saved Explorador views, kept on this device only.
abstract interface class SavedViewsService {
  Future<List<SavedExplorerView>> load();

  Future<void> save(List<SavedExplorerView> views);
}
