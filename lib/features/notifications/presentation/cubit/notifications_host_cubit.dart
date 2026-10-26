import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/models/app_notification.dart';
import '../../domain/models/notification_target.dart';
import '../../domain/use_cases/delivery/start_notifications_use_case.dart';
import '../../domain/use_cases/delivery/watch_foreground_notifications_use_case.dart';
import '../../domain/use_cases/delivery/watch_notification_targets_use_case.dart';
import 'notifications_host_state.dart';

@injectable
class NotificationsHostCubit extends Cubit<NotificationsHostState> {
  NotificationsHostCubit(this._start, this._watchForeground, this._watchTargets)
    : super(const NotificationsHostState());

  final StartNotificationsUseCase _start;
  final WatchForegroundNotificationsUseCase _watchForeground;
  final WatchNotificationTargetsUseCase _watchTargets;
  final List<StreamSubscription<Object?>> _subscriptions = [];

  Future<void> start() async {
    _subscriptions
      ..add(_watchForeground().listen(_onForeground))
      ..add(_watchTargets().listen(_onTarget));
    await _start();
  }

  void _onForeground(AppNotification notification) => emit(
    NotificationsHostState(
      sequence: state.sequence + 1,
      foreground: notification,
    ),
  );

  void _onTarget(NotificationTarget target) => emit(
    NotificationsHostState(sequence: state.sequence + 1, target: target),
  );

  @override
  Future<void> close() async {
    for (final subscription in _subscriptions) {
      await subscription.cancel();
    }
    return super.close();
  }
}
