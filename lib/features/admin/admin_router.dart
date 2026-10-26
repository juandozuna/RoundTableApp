import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../core/config/injection.dart';
import '../../core/extensions/go_router_state_x.dart';
import '../../core/models/user_role.dart';
import '../../core/routing/app_page_transitions.dart';
import '../../core/routing/feature_router.dart';
import 'admin_routes.dart';
import 'domain/models/invite_request.dart';
import 'domain/models/invite_share.dart';
import 'presentation/pages/explorer/cubit/explorer_cubit.dart';
import 'presentation/pages/explorer/explorer_page.dart';
import 'presentation/pages/invite_person/cubit/invite_person_cubit.dart';
import 'presentation/pages/invite_person/invite_person_page.dart';
import 'presentation/pages/location_form/cubit/location_form_cubit.dart';
import 'presentation/pages/location_form/location_form_page.dart';
import 'presentation/pages/organization_detail/cubit/organization_detail_cubit.dart';
import 'presentation/pages/organization_detail/organization_detail_page.dart';
import 'presentation/pages/organization_form/cubit/organization_form_cubit.dart';
import 'presentation/pages/organization_form/organization_form_page.dart';
import 'presentation/pages/person_detail/cubit/person_detail_cubit.dart';
import 'presentation/pages/person_detail/person_detail_page.dart';
import 'presentation/pages/table_detail/cubit/table_detail_cubit.dart';
import 'presentation/pages/table_detail/table_detail_page.dart';
import 'presentation/pages/table_form/cubit/table_form_cubit.dart';
import 'presentation/pages/table_form/table_form_page.dart';

/// Explorador de mesas and the management screens (online only, ADR 0003).
class AdminFeatureRouter extends FeatureRouter {
  const AdminFeatureRouter();

  @override
  List<RouteBase> get shellRoutes => [
    GoRoute(
      path: AdminRoutes.explorer,
      pageBuilder: (context, state) {
        final viewId = state.uri.queryParameters[AdminRoutes.viewQuery];
        return AppPageTransitions.fade(
          state: state,
          child: BlocProvider(
            // A palette jump to another view builds a fresh cubit.
            key: ValueKey('explorer-$viewId'),
            create: (_) => getIt<ExplorerCubit>()..load(viewId: viewId),
            child: const ExplorerPage(),
          ),
        );
      },
    ),
  ];

  @override
  List<RouteBase> get routes => [
    GoRoute(
      path: AdminRoutes.organizationNew,
      pageBuilder: (context, state) => AppPageTransitions.slideUp(
        state: state,
        child: BlocProvider(
          create: (_) => getIt<OrganizationFormCubit>(),
          child: const OrganizationFormPage(),
        ),
      ),
    ),
    GoRoute(
      path: AdminRoutes.organization,
      pageBuilder: (context, state) {
        final id = state.pathParameters[AdminRoutes.organizationIdParam]!;
        return AppPageTransitions.slideUp(
          state: state,
          child: BlocProvider(
            create: (_) => getIt<OrganizationDetailCubit>()..load(id),
            child: OrganizationDetailPage(organizationId: id),
          ),
        );
      },
    ),
    GoRoute(
      path: AdminRoutes.organizationEdit,
      pageBuilder: (context, state) {
        final id = state.pathParameters[AdminRoutes.organizationIdParam]!;
        return AppPageTransitions.slideUp(
          state: state,
          child: BlocProvider(
            create: (_) =>
                getIt<OrganizationFormCubit>()..init(organizationId: id),
            child: OrganizationFormPage(organizationId: id),
          ),
        );
      },
    ),
    GoRoute(
      path: AdminRoutes.locationNew,
      pageBuilder: (context, state) {
        final orgId = state.pathParameters[AdminRoutes.organizationIdParam]!;
        return AppPageTransitions.slideUp(
          state: state,
          child: BlocProvider(
            create: (_) => getIt<LocationFormCubit>(),
            child: LocationFormPage(organizationId: orgId),
          ),
        );
      },
    ),
    GoRoute(
      path: AdminRoutes.locationEdit,
      pageBuilder: (context, state) {
        final orgId = state.pathParameters[AdminRoutes.organizationIdParam]!;
        final locationId = state.pathParameters[AdminRoutes.locationIdParam]!;
        return AppPageTransitions.slideUp(
          state: state,
          child: BlocProvider(
            create: (_) =>
                getIt<LocationFormCubit>()..init(locationId: locationId),
            child: LocationFormPage(
              organizationId: orgId,
              locationId: locationId,
            ),
          ),
        );
      },
    ),
    GoRoute(
      path: AdminRoutes.tableNew,
      pageBuilder: (context, state) {
        final orgId = state.uri.queryParameters[AdminRoutes.organizationQuery];
        return AppPageTransitions.slideUp(
          state: state,
          child: BlocProvider(
            create: (_) => getIt<TableFormCubit>()..init(organizationId: orgId),
            child: const TableFormPage(),
          ),
        );
      },
    ),
    GoRoute(
      path: AdminRoutes.table,
      pageBuilder: (context, state) {
        final id = state.pathParameters[AdminRoutes.tableIdParam]!;
        return AppPageTransitions.slideUp(
          state: state,
          child: BlocProvider(
            create: (_) => getIt<TableDetailCubit>()..load(id),
            child: TableDetailPage(tableId: id),
          ),
        );
      },
    ),
    GoRoute(
      path: AdminRoutes.tableEdit,
      pageBuilder: (context, state) {
        final id = state.pathParameters[AdminRoutes.tableIdParam]!;
        return AppPageTransitions.slideUp(
          state: state,
          child: BlocProvider(
            create: (_) => getIt<TableFormCubit>()..init(tableId: id),
            child: TableFormPage(tableId: id),
          ),
        );
      },
    ),
    GoRoute(
      path: AdminRoutes.person,
      pageBuilder: (context, state) {
        final id = state.pathParameters[AdminRoutes.personIdParam]!;
        return AppPageTransitions.slideUp(
          state: state,
          child: BlocProvider(
            create: (_) => getIt<PersonDetailCubit>()..load(id),
            child: PersonDetailPage(personId: id),
          ),
        );
      },
    ),
    GoRoute(
      path: AdminRoutes.invite,
      pageBuilder: (context, state) {
        final query = state.uri.queryParameters;
        final role = InviteRoleKind.values.firstWhere(
          (r) => r.name == query[AdminRoutes.roleQuery],
          orElse: () => InviteRoleKind.facilitator,
        );
        return AppPageTransitions.slideUp(
          state: state,
          child: BlocProvider(
            create: (_) => getIt<InvitePersonCubit>()
              ..init(
                role: role,
                organizationId: query[AdminRoutes.organizationQuery],
                tableId: query[AdminRoutes.tableQuery],
                existing: state.extraAs<InviteShare>(),
              ),
            child: const InvitePersonPage(),
          ),
        );
      },
    ),
  ];

  @override
  List<ShellDestination> get destinations => [
    ShellDestination(
      location: AdminRoutes.explorer,
      icon: Icons.grid_view_outlined,
      selectedIcon: Icons.grid_view_rounded,
      label: (l10n) => l10n.adminNavExplorer,
      roles: const {UserRole.administrator, UserRole.coordinator},
      order: 20,
    ),
  ];
}
