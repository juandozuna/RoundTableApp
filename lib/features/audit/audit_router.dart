import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../core/config/injection.dart';
import '../../core/models/user_role.dart';
import '../../core/routing/app_page_transitions.dart';
import '../../core/routing/feature_router.dart';
import 'audit_routes.dart';
import 'presentation/pages/audit/audit_page.dart';
import 'presentation/pages/audit/cubit/audit_cubit.dart';

/// Audit log of administration (online only).
class AuditFeatureRouter extends FeatureRouter {
  const AuditFeatureRouter();

  @override
  List<RouteBase> get shellRoutes => [
    GoRoute(
      path: AuditRoutes.audit,
      pageBuilder: (context, state) {
        final organizationId =
            state.uri.queryParameters[AuditRoutes.organizationQuery];
        return AppPageTransitions.fade(
          state: state,
          child: BlocProvider(
            key: ValueKey('audit-$organizationId'),
            create: (_) =>
                getIt<AuditCubit>()..load(organizationId: organizationId),
            child: const AuditPage(),
          ),
        );
      },
    ),
  ];

  @override
  List<ShellDestination> get destinations => [
    ShellDestination(
      location: AuditRoutes.audit,
      icon: Icons.list_alt_outlined,
      selectedIcon: Icons.list_alt_rounded,
      label: (l10n) => l10n.auditTitle,
      roles: const {UserRole.administrator, UserRole.coordinator},
      order: 22,
    ),
  ];
}
