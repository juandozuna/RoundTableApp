import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/network/api_exception.dart';
import '../../../../../admin/domain/use_cases/directory/load_organizations_use_case.dart';
import '../../../../../kpis/domain/models/csv_document.dart';
import '../../../../../kpis/domain/use_cases/export/export_csv_use_case.dart';
import '../../../../domain/models/audit_category.dart';
import '../../../../domain/models/audit_event.dart';
import '../../../../domain/models/audit_query.dart';
import '../../../../domain/use_cases/load_audit_events_use_case.dart';
import 'audit_state.dart';

@injectable
class AuditCubit extends Cubit<AuditState> {
  AuditCubit(this._load, this._organizations, this._export)
    : super(const AuditState());

  final LoadAuditEventsUseCase _load;
  final LoadOrganizationsUseCase _organizations;
  final ExportCsvUseCase _export;

  static const int pageSize = 100;

  Future<void> load({String? organizationId}) async {
    emit(
      state.copyWith(
        status: AuditStatus.loading,
        error: null,
        organizationId: organizationId,
        limit: pageSize,
      ),
    );
    try {
      final organizations = await _organizations();
      emit(state.copyWith(organizations: organizations));
    } on ApiException {
      // The organization picker is optional; events still load.
    }
    await _fetch();
  }

  Future<void> refresh() async {
    if (state.status != AuditStatus.loading) await _fetch();
  }

  Future<void> _fetch() async {
    emit(state.copyWith(refreshing: true));
    try {
      final events = await _load(
        AuditQuery(
          category: state.category,
          organizationId: state.organizationId,
          limit: state.limit,
        ),
      );
      emit(
        state.copyWith(
          status: AuditStatus.ready,
          refreshing: false,
          events: events,
          hasMore: events.length >= state.limit,
          error: null,
        ),
      );
    } on ApiException catch (error) {
      emit(
        state.copyWith(
          status: state.events.isEmpty
              ? AuditStatus.failure
              : AuditStatus.ready,
          refreshing: false,
          error: error,
        ),
      );
    }
  }

  Future<void> setCategory(AuditCategory? category) {
    emit(state.copyWith(category: category, limit: pageSize));
    return _fetch();
  }

  Future<void> setOrganization(String? organizationId) {
    emit(state.copyWith(organizationId: organizationId, limit: pageSize));
    return _fetch();
  }

  /// Search is applied on the events already loaded.
  void search(String text) => emit(state.copyWith(search: text));

  Future<void> loadMore() {
    emit(state.copyWith(limit: state.limit + pageSize));
    return _fetch();
  }

  Future<void> clearFilters() {
    emit(
      state.copyWith(
        category: null,
        organizationId: null,
        search: '',
        limit: pageSize,
      ),
    );
    return _fetch();
  }

  Future<void> exportCsv(CsvDocument document) => _export(document);

  List<AuditEvent> visible(String Function(AuditEvent) text) {
    final needle = state.search.trim().toLowerCase();
    if (needle.isEmpty) return state.events;
    return state.events
        .where((e) => text(e).toLowerCase().contains(needle))
        .toList();
  }
}
