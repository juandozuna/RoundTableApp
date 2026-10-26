import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/injection.dart';
import '../../../../core/extensions/build_context_x.dart';
import '../../../../core/widgets/app_toast.dart';
import '../../../home/home_routes.dart';
import '../../domain/models/app_notification.dart';
import '../../domain/models/notification_kind.dart';
import '../../domain/models/notification_target.dart';
import '../cubit/notifications_host_cubit.dart';
import '../cubit/notifications_host_state.dart';

/// Starts push handling for the whole app: foreground pushes become toasts
/// and tapped notifications deep-link through [router]. Mount it once, above
/// the router's pages.
class NotificationsHost extends StatelessWidget {
  const NotificationsHost({
    super.key,
    required this.router,
    required this.child,
  });

  final GoRouter router;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<NotificationsHostCubit>()..start(),
      child: BlocListener<NotificationsHostCubit, NotificationsHostState>(
        listener: _onEvent,
        child: child,
      ),
    );
  }

  void _onEvent(BuildContext context, NotificationsHostState state) {
    final foreground = state.foreground;
    if (foreground != null) {
      AppToast.show(context, _messageFor(context, foreground));
    }
    final target = state.target;
    if (target != null) router.go(_locationFor(target));
  }

  String _messageFor(BuildContext context, AppNotification notification) {
    final l10n = context.l10n;
    final title = notification.title;
    final body = notification.body;
    if (title != null && body != null) return '$title · $body';
    if (title != null || body != null) return (title ?? body)!;
    return switch (notification.kind) {
      NotificationKind.sessionReminder => l10n.notificationsSessionReminder,
      NotificationKind.commitmentNudge => l10n.notificationsCommitmentNudge,
      NotificationKind.stageOpened => l10n.notificationsStageOpened,
      NotificationKind.unsyncedData || null => l10n.notificationsGeneric,
    };
  }

  String _locationFor(NotificationTarget target) => switch (target) {
    NotificationTargetSession(:final roundTableId, :final sessionId) =>
      HomeRoutes.session(tableId: roundTableId, sessionId: sessionId),
    NotificationTargetHome() => HomeRoutes.home,
  };
}
