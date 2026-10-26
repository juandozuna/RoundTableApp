import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../core/config/injection.dart';
import '../../core/extensions/go_router_state_x.dart';
import '../../core/models/user_role.dart';
import '../../core/routing/app_page_transitions.dart';
import '../../core/routing/feature_router.dart';
import 'domain/models/invite.dart';
import 'domain/models/invite_preview.dart';
import 'invites_routes.dart';
import 'presentation/pages/code_entry/code_entry_page.dart';
import 'presentation/pages/code_entry/cubit/code_entry_cubit.dart';
import 'presentation/pages/form/cubit/invite_form_cubit.dart';
import 'presentation/pages/form/invite_form_page.dart';
import 'presentation/pages/manager/cubit/invites_manager_cubit.dart';
import 'presentation/pages/manager/invites_manager_page.dart';
import 'presentation/pages/redeem/cubit/redeem_cubit.dart';
import 'presentation/pages/redeem/redeem_page.dart';
import 'presentation/pages/scan/cubit/scan_cubit.dart';
import 'presentation/pages/scan/scan_page.dart';
import 'presentation/pages/share/cubit/share_cubit.dart';
import 'presentation/pages/share/invite_share_page.dart';

/// Redeeming invitations (public) and inviting (coordinators, facilitators,
/// administrators).
class InvitesFeatureRouter extends FeatureRouter {
  const InvitesFeatureRouter();

  static const Set<UserRole> _inviters = {
    UserRole.administrator,
    UserRole.coordinator,
    UserRole.facilitator,
  };

  @override
  List<String> get publicLocations => [
    InvitesRoutes.redeem,
    InvitesRoutes.legacyRedeem,
  ];

  @override
  List<RouteBase> get routes => [
    GoRoute(
      path: InvitesRoutes.redeem,
      pageBuilder: (context, state) => AppPageTransitions.slideUp(
        state: state,
        child: BlocProvider(
          create: (_) => getIt<CodeEntryCubit>(),
          child: const CodeEntryPage(),
        ),
      ),
    ),
    GoRoute(
      path: InvitesRoutes.scan,
      pageBuilder: (context, state) => AppPageTransitions.slideUp(
        state: state,
        child: BlocProvider(
          create: (_) => getIt<ScanCubit>(),
          child: const ScanPage(),
        ),
      ),
    ),
    GoRoute(
      path: InvitesRoutes.redeemWithCode,
      pageBuilder: (context, state) {
        final preview = state.extraAs<InvitePreview>();
        return AppPageTransitions.slideUp(
          state: state,
          child: BlocProvider(
            create: (_) => getIt<RedeemCubit>()
              ..load(
                state.pathParameters[InvitesRoutes.codeParam]!,
                preloaded: preview,
              ),
            child: const RedeemPage(),
          ),
        );
      },
    ),
    GoRoute(
      path: InvitesRoutes.legacyRedeemWithCode,
      redirect: (context, state) => InvitesRoutes.redeemFor(
        state.pathParameters[InvitesRoutes.codeParam]!,
      ),
    ),
  ];

  @override
  List<RouteBase> get shellRoutes => [
    GoRoute(
      path: InvitesRoutes.manager,
      pageBuilder: (context, state) => AppPageTransitions.fade(
        state: state,
        child: BlocProvider(
          create: (_) => getIt<InvitesManagerCubit>(),
          child: const InvitesManagerPage(),
        ),
      ),
    ),
    GoRoute(
      path: InvitesRoutes.create,
      pageBuilder: (context, state) => AppPageTransitions.fade(
        state: state,
        child: BlocProvider(
          create: (_) => getIt<InviteFormCubit>(),
          child: const InviteFormPage(),
        ),
      ),
    ),
    GoRoute(
      path: InvitesRoutes.share,
      pageBuilder: (context, state) => AppPageTransitions.fade(
        state: state,
        child: BlocProvider(
          create: (_) => getIt<ShareCubit>()
            ..load(
              state.pathParameters[InvitesRoutes.idParam]!,
              preloaded: state.extraAs<Invite>(),
            ),
          child: const InviteSharePage(),
        ),
      ),
    ),
  ];

  @override
  List<ShellDestination> get destinations => [
    ShellDestination(
      location: InvitesRoutes.manager,
      icon: Icons.mail_outline_rounded,
      selectedIcon: Icons.mail_rounded,
      label: (l10n) => l10n.navInvites,
      roles: _inviters,
      order: 40,
    ),
  ];
}
