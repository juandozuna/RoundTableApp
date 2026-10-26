import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/services/session_context/session_context.dart';
import 'home_commitment.dart';
import 'home_kpi_summary.dart';
import 'home_progress.dart';
import 'home_session.dart';

part 'home_overview.freezed.dart';

/// What the home shows for the active context, one variant per kind of home.
@freezed
sealed class HomeOverview with _$HomeOverview {
  /// Signed in but no role/context selected yet.
  const factory HomeOverview.noContext() = HomeNoContext;

  const factory HomeOverview.facilitator({
    required SessionContext context,
    HomeSession? session,
  }) = HomeFacilitator;

  const factory HomeOverview.member({
    required SessionContext context,
    HomeSession? session,
    HomeCommitment? lastCommitment,
    @Default(HomeProgress()) HomeProgress progress,
  }) = HomeMember;

  const factory HomeOverview.manager({
    required SessionContext context,
    HomeKpiSummary? kpis,
    @Default(0) int pendingInvites,
  }) = HomeManager;
}
