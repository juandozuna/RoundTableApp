import 'package:freezed_annotation/freezed_annotation.dart';

part 'explorer_query.freezed.dart';

enum ExplorerEntity { tables, organizations, people }

/// Built-in views of the Explorador. Saved views use ids `custom:<id>`.
enum ExplorerView {
  all,
  delayed,
  lowAttendance,
  fewPeople,
  syncedLate,
  paused,
  withoutTables,
  withoutCoordinator,
  coordinators,
  facilitators,
  members,
  pendingInvites,
  inactive;

  static const String customPrefix = 'custom:';

  String get id => name;

  static List<ExplorerView> forEntity(ExplorerEntity entity) =>
      switch (entity) {
        ExplorerEntity.tables => const [
          all,
          delayed,
          lowAttendance,
          fewPeople,
          syncedLate,
        ],
        ExplorerEntity.organizations => const [
          all,
          paused,
          withoutTables,
          withoutCoordinator,
        ],
        ExplorerEntity.people => const [
          all,
          coordinators,
          facilitators,
          members,
          pendingInvites,
          inactive,
        ],
      };

  static ExplorerView? tryParse(String id) {
    for (final view in values) {
      if (view.id == id) return view;
    }
    return null;
  }
}

/// Filter keys per entity (`ExplorerQuery.filters`).
abstract final class ExplorerFilterKeys {
  static const String country = 'country';
  static const String organization = 'organization';
  static const String location = 'location';
  static const String status = 'status';
  static const String facilitator = 'facilitator';
  static const String role = 'role';
}

@freezed
abstract class ExplorerQuery with _$ExplorerQuery {
  const ExplorerQuery._();

  const factory ExplorerQuery({
    @Default(ExplorerEntity.tables) ExplorerEntity entity,
    @Default('all') String viewId,
    @Default({}) Map<String, String> filters,
    @Default('') String search,
    @Default('code') String sortKey,
    @Default(true) bool ascending,
  }) = _ExplorerQuery;

  int get activeFilterCount => filters.values.where((v) => v.isNotEmpty).length;

  bool get hasRefinements => activeFilterCount > 0 || search.isNotEmpty;
}
