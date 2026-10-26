import 'package:freezed_annotation/freezed_annotation.dart';

import 'admin_organization.dart';

part 'explorer_organization.freezed.dart';

/// An organization with its roll-ups for the Explorador grid.
@freezed
abstract class ExplorerOrganization with _$ExplorerOrganization {
  const ExplorerOrganization._();

  const factory ExplorerOrganization({
    required AdminOrganization organization,
    @Default(0) int tablesTotal,
    @Default(0) int tablesActive,
    @Default(0) int tablesDelayed,
    @Default(0) int tablesInactive,
    @Default(0) int people,
    @Default(0) int valuesCompleted,
    double? attendancePct,
    double? improvementAvg,
    @Default(false) bool hasActiveCoordinator,
    String? coordinatorName,
  }) = _ExplorerOrganization;

  String get id => organization.id;
}
