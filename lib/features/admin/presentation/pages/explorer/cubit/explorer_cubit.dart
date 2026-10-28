import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/network/api_exception.dart';
import '../../../../../kpis/domain/models/csv_document.dart';
import '../../../../../kpis/domain/use_cases/export/export_csv_use_case.dart';
import '../../../../domain/explorer/explorer_csv.dart';
import '../../../../domain/explorer/explorer_engine.dart';
import '../../../../domain/models/explorer_query.dart';
import '../../../../domain/models/explorer_table.dart';
import '../../../../domain/use_cases/directory/load_explorer_data_use_case.dart';
import '../../../../domain/use_cases/views/delete_explorer_view_use_case.dart';
import '../../../../domain/use_cases/views/load_saved_views_use_case.dart';
import '../../../../domain/use_cases/views/save_explorer_view_use_case.dart';
import 'explorer_state.dart';

/// Report scope that best describes the current selection (the KPI RPCs take
/// one country, organization or table).
typedef ExplorerReportScope = ({
  String? country,
  String? organizationId,
  String? tableId,
});

@injectable
class ExplorerCubit extends Cubit<ExplorerState> {
  ExplorerCubit(
    this._loadData,
    this._loadViews,
    this._saveView,
    this._deleteView,
    this._exportCsv,
  ) : super(const ExplorerState());

  final LoadExplorerDataUseCase _loadData;
  final LoadSavedViewsUseCase _loadViews;
  final SaveExplorerViewUseCase _saveView;
  final DeleteExplorerViewUseCase _deleteView;
  final ExportCsvUseCase _exportCsv;

  /// First load. [viewId] opens a view (built-in or `custom:…`) of Mesas.
  Future<void> load({String? viewId}) async {
    emit(state.copyWith(status: ExplorerStatus.loading, error: null));
    await _fetch(initialView: viewId);
  }

  /// Reloads keeping the rows on screen (pull to refresh, back online).
  Future<void> refresh() async {
    if (state.status == ExplorerStatus.loading) return;
    emit(state.copyWith(refreshing: true));
    await _fetch();
  }

  Future<void> _fetch({String? initialView}) async {
    try {
      final data = await _loadData();
      final views = await _loadViews();
      var next = state.copyWith(
        status: ExplorerStatus.ready,
        refreshing: false,
        error: null,
        data: data,
        savedViews: views,
      );
      if (initialView != null) {
        next = _withView(next, ExplorerEntity.tables, initialView);
      }
      emit(_derive(next));
    } on ApiException catch (error) {
      emit(
        state.copyWith(
          status: state.data.tables.isEmpty && state.data.people.isEmpty
              ? ExplorerStatus.failure
              : ExplorerStatus.ready,
          refreshing: false,
          error: error,
        ),
      );
    }
  }

  void selectEntity(ExplorerEntity entity) {
    emit(_derive(state.copyWith(entity: entity, selection: const {})));
  }

  void selectView(String viewId) {
    emit(_derive(_withView(state, state.entity, viewId)));
  }

  void search(String text) => _updateQuery((q) => q.copyWith(search: text));

  void setFilter(String key, String? value) => _updateQuery((q) {
    final filters = Map.of(q.filters);
    if (value == null || value.isEmpty) {
      filters.remove(key);
    } else {
      filters[key] = value;
    }
    // A saved view stops describing the grid once the user changes it.
    return q.copyWith(filters: filters, viewId: _detach(q.viewId));
  });

  void clearFilters() => _updateQuery(
    (q) =>
        q.copyWith(filters: const {}, search: '', viewId: ExplorerView.all.id),
  );

  void sortBy(String key) => _updateQuery(
    (q) => q.sortKey == key
        ? q.copyWith(ascending: !q.ascending)
        : q.copyWith(sortKey: key, ascending: true),
  );

  void toggleSelected(String id) {
    final next = Set.of(state.selection);
    if (!next.remove(id)) next.add(id);
    emit(_derive(state.copyWith(selection: next)));
  }

  void selectAllVisible(bool selected) {
    emit(
      _derive(
        state.copyWith(selection: selected ? _visibleIds(state) : const {}),
      ),
    );
  }

  void clearSelection() => emit(_derive(state.copyWith(selection: const {})));

  void toggleDensity() => emit(state.copyWith(compact: !state.compact));

  Future<void> saveCurrentView(String name) async {
    final views = await _saveView(name: name, query: state.query);
    final saved = views.last;
    emit(
      _derive(
        _updateQueryOf(
          state.copyWith(savedViews: views),
          (q) => q.copyWith(viewId: saved.id),
        ),
      ),
    );
  }

  Future<void> deleteView(String id) async {
    final views = await _deleteView(id);
    var next = state.copyWith(savedViews: views);
    if (state.query.viewId == id) {
      next = _updateQueryOf(
        next,
        (q) => q.copyWith(viewId: ExplorerView.all.id),
      );
    }
    emit(_derive(next));
  }

  /// Exports the selected rows, or every row of the current view.
  /// [headers] are the localized column titles of the current entity.
  Future<void> exportCsv(List<String> headers) {
    final CsvDocument document = switch (state.entity) {
      ExplorerEntity.tables => ExplorerCsv.tables(
        _selectedOrAll(state.tables, (t) => t.id),
        headers,
      ),
      ExplorerEntity.organizations => ExplorerCsv.organizations(
        _selectedOrAll(state.organizations, (o) => o.id),
        headers,
      ),
      ExplorerEntity.people => ExplorerCsv.people(
        _selectedOrAll(state.people, (p) => p.id),
        headers,
      ),
    };
    return _exportCsv(document);
  }

  List<T> _selectedOrAll<T>(List<T> rows, String Function(T) id) =>
      state.hasSelection
      ? rows.where((r) => state.selection.contains(id(r))).toList()
      : rows;

  /// Report scope for "Abrir en Informes", from the selection or the view.
  ExplorerReportScope reportScope() {
    final data = state.data;
    final tables = switch (state.entity) {
      ExplorerEntity.tables =>
        state.hasSelection
            ? data.tables.where((t) => state.selection.contains(t.id)).toList()
            : state.tables,
      ExplorerEntity.organizations =>
        data.tables
            .where(
              (t) => state.hasSelection
                  ? state.selection.contains(t.organizationId)
                  : state.organizations.any((o) => o.id == t.organizationId),
            )
            .toList(),
      ExplorerEntity.people => const <ExplorerTable>[],
    };
    if (tables.length == 1) {
      return (country: null, organizationId: null, tableId: tables.first.id);
    }
    final orgs = tables.map((t) => t.organizationId).toSet();
    if (orgs.length == 1) {
      return (country: null, organizationId: orgs.first, tableId: null);
    }
    final countries = tables.map((t) => t.countryCode).toSet();
    if (countries.length == 1 && countries.first != null) {
      return (country: countries.first, organizationId: null, tableId: null);
    }
    return (country: null, organizationId: null, tableId: null);
  }

  // ── Internals ───────────────────────────────────────────────────────────

  String _detach(String viewId) => viewId.startsWith(ExplorerView.customPrefix)
      ? ExplorerView.all.id
      : viewId;

  ExplorerState _withView(
    ExplorerState s,
    ExplorerEntity entity,
    String viewId,
  ) {
    final base = s.queries[entity] ?? ExplorerState.defaultQueryFor(entity);
    ExplorerQuery query;
    final saved = s.savedViews.where((v) => v.id == viewId).firstOrNull;
    if (saved != null) {
      query = base.copyWith(
        viewId: viewId,
        filters: saved.filters,
        search: saved.search,
        sortKey: saved.sortKey,
        ascending: saved.ascending,
      );
    } else {
      final view = ExplorerView.tryParse(viewId) ?? ExplorerView.all;
      final sort = _sortForView(view);
      query = base.copyWith(
        viewId: view.id,
        sortKey: sort?.$1 ?? ExplorerState.defaultQueryFor(entity).sortKey,
        ascending: sort?.$2 ?? true,
      );
    }
    return s.copyWith(
      entity: entity,
      selection: const {},
      queries: {...s.queries, entity: query},
    );
  }

  /// The built-in views come sorted by what they are about.
  (String, bool)? _sortForView(ExplorerView view) => switch (view) {
    ExplorerView.delayed => ('last', false),
    ExplorerView.lowAttendance => ('attendance', true),
    ExplorerView.fewPeople => ('seats', true),
    ExplorerView.syncedLate => ('late', false),
    _ => null,
  };

  void _updateQuery(ExplorerQuery Function(ExplorerQuery) change) {
    emit(_derive(_updateQueryOf(state, change)));
  }

  ExplorerState _updateQueryOf(
    ExplorerState s,
    ExplorerQuery Function(ExplorerQuery) change,
  ) => s.copyWith(queries: {...s.queries, s.entity: change(s.query)});

  Set<String> _visibleIds(ExplorerState s) => switch (s.entity) {
    ExplorerEntity.tables => {for (final t in s.tables) t.id},
    ExplorerEntity.organizations => {for (final o in s.organizations) o.id},
    ExplorerEntity.people => {for (final p in s.people) p.id},
  };

  /// Recomputes rows, counts, filter choices and the selection KPIs.
  ExplorerState _derive(ExplorerState s) {
    final query = s.query;
    final data = s.data;
    final isTables = s.entity == ExplorerEntity.tables;
    final isOrganizations = s.entity == ExplorerEntity.organizations;
    final isPeople = s.entity == ExplorerEntity.people;
    final next = s.copyWith(
      tables: isTables ? ExplorerEngine.tables(data, query) : const [],
      organizations: isOrganizations
          ? ExplorerEngine.organizations(data, query)
          : const [],
      people: isPeople ? ExplorerEngine.people(data, query) : const [],
      viewCounts: {
        for (final view in ExplorerView.forEntity(s.entity))
          view.id: ExplorerEngine.viewCount(data, query, view.id),
      },
      filterOptions: ExplorerEngine.filterOptions(data, query),
    );
    final visibleIds = _visibleIds(next);
    final selection = {
      for (final id in next.selection)
        if (visibleIds.contains(id)) id,
    };
    final withSelection = next.copyWith(selection: selection);
    return withSelection.copyWith(
      aggregate: ExplorerEngine.aggregate(_aggregatedTables(withSelection)),
    );
  }

  /// Tables the KPI panel adds up: the selection, or the whole current view.
  List<ExplorerTable> _aggregatedTables(ExplorerState s) {
    switch (s.entity) {
      case ExplorerEntity.tables:
        return s.hasSelection
            ? s.tables.where((t) => s.selection.contains(t.id)).toList()
            : s.tables;
      case ExplorerEntity.organizations:
        final orgIds = s.hasSelection
            ? s.selection
            : {for (final o in s.organizations) o.id};
        return s.data.tables
            .where((t) => orgIds.contains(t.organizationId))
            .toList();
      case ExplorerEntity.people:
        return const [];
    }
  }
}
