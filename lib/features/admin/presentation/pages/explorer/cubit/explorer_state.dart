import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../core/network/api_exception.dart';
import '../../../../domain/explorer/explorer_engine.dart';
import '../../../../domain/models/admin_person.dart';
import '../../../../domain/models/explorer_data.dart';
import '../../../../domain/models/explorer_organization.dart';
import '../../../../domain/models/explorer_query.dart';
import '../../../../domain/models/explorer_table.dart';
import '../../../../domain/models/saved_explorer_view.dart';
import '../../../../domain/models/table_aggregate.dart';

part 'explorer_state.freezed.dart';

enum ExplorerStatus { loading, ready, failure }

@freezed
abstract class ExplorerState with _$ExplorerState {
  const ExplorerState._();

  const factory ExplorerState({
    @Default(ExplorerStatus.loading) ExplorerStatus status,
    ApiException? error,

    /// A reload is in flight while the previous rows stay on screen.
    @Default(false) bool refreshing,
    @Default(ExplorerData()) ExplorerData data,
    @Default(ExplorerEntity.tables) ExplorerEntity entity,
    @Default({}) Map<ExplorerEntity, ExplorerQuery> queries,
    @Default({}) Set<String> selection,
    @Default(false) bool compact,
    @Default([]) List<SavedExplorerView> savedViews,

    // Rows of the current entity after search, filters, view and sort.
    @Default([]) List<ExplorerTable> tables,
    @Default([]) List<ExplorerOrganization> organizations,
    @Default([]) List<AdminPerson> people,
    @Default({}) Map<String, int> viewCounts,
    @Default({}) Map<String, List<ExplorerFilterOption>> filterOptions,
    @Default(TableAggregate()) TableAggregate aggregate,
  }) = _ExplorerState;

  ExplorerQuery get query => queries[entity] ?? defaultQueryFor(entity);

  int get visibleCount => switch (entity) {
    ExplorerEntity.tables => tables.length,
    ExplorerEntity.organizations => organizations.length,
    ExplorerEntity.people => people.length,
  };

  int get totalCount => switch (entity) {
    ExplorerEntity.tables => data.tables.length,
    ExplorerEntity.organizations => data.organizations.length,
    ExplorerEntity.people => data.people.length,
  };

  bool get hasSelection => selection.isNotEmpty;

  /// Saved view currently applied, if any.
  SavedExplorerView? get activeSavedView {
    for (final view in savedViews) {
      if (view.id == query.viewId) return view;
    }
    return null;
  }

  static ExplorerQuery defaultQueryFor(ExplorerEntity entity) => ExplorerQuery(
    entity: entity,
    sortKey: switch (entity) {
      ExplorerEntity.tables => 'code',
      ExplorerEntity.organizations || ExplorerEntity.people => 'name',
    },
  );
}
