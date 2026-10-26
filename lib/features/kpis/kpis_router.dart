import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../core/config/injection.dart';
import '../../core/models/user_role.dart';
import '../../core/routing/app_page_transitions.dart';
import '../../core/routing/feature_router.dart';
import 'kpis_routes.dart';
import 'presentation/pages/member_detail/cubit/member_detail_cubit.dart';
import 'presentation/pages/member_detail/member_detail_page.dart';
import 'presentation/pages/reports/cubit/reports_cubit.dart';
import 'presentation/pages/reports/reports_page.dart';

/// KPI dashboards (Informes) and the member drill-down (online only).
class KpisFeatureRouter extends FeatureRouter {
  const KpisFeatureRouter();

  @override
  List<RouteBase> get shellRoutes => [
    GoRoute(
      path: KpisRoutes.reports,
      pageBuilder: (context, state) {
        final query = state.uri.queryParameters;
        return AppPageTransitions.fade(
          state: state,
          child: BlocProvider(
            key: ValueKey(state.uri.toString()),
            create: (_) => getIt<ReportsCubit>()
              ..load(
                country: query[KpisRoutes.countryQuery],
                organizationId: query[KpisRoutes.organizationQuery],
                tableId: query[KpisRoutes.tableQuery],
              ),
            child: const ReportsPage(),
          ),
        );
      },
    ),
  ];

  @override
  List<RouteBase> get routes => [
    GoRoute(
      path: KpisRoutes.memberDetail,
      pageBuilder: (context, state) {
        final tableId = state.pathParameters[KpisRoutes.tableIdParam]!;
        final personId = state.pathParameters[KpisRoutes.personIdParam]!;
        return AppPageTransitions.slideUp(
          state: state,
          child: BlocProvider(
            create: (_) =>
                getIt<MemberDetailCubit>()
                  ..load(tableId: tableId, personId: personId),
            child: MemberDetailPage(tableId: tableId, personId: personId),
          ),
        );
      },
    ),
  ];

  @override
  List<ShellDestination> get destinations => [
    ShellDestination(
      location: KpisRoutes.reports,
      icon: Icons.bar_chart_outlined,
      selectedIcon: Icons.bar_chart_rounded,
      label: (l10n) => l10n.kpiNavReports,
      roles: const {UserRole.administrator, UserRole.coordinator},
      order: 21,
    ),
  ];
}
