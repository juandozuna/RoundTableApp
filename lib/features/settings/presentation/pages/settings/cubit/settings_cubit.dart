import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/services/connectivity/watch_connectivity_use_case.dart';
import '../../../../../../core/services/logging/app_log.dart';
import '../../../../../../core/services/session_context/session_context.dart';
import '../../../../../../core/services/session_context/watch_session_context_use_case.dart';
import '../../../../../../core/sync/domain/sync_snapshot.dart';
import '../../../../../../core/sync/domain/watch_sync_status_use_case.dart';
import '../../../../domain/use_cases/account/sign_out_use_case.dart';
import '../../../../domain/use_cases/profile/load_app_info_use_case.dart';
import '../../../../domain/use_cases/profile/load_profile_use_case.dart';
import 'settings_state.dart';

@injectable
class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit(
    this._watchContext,
    this._watchConnectivity,
    this._watchSyncStatus,
    this._loadProfile,
    this._loadAppInfo,
    this._signOut,
  ) : super(const SettingsState()) {
    _subscriptions
      ..add(_watchContext().listen(_onContext))
      ..add(_watchConnectivity().listen(_onConnectivity))
      ..add(_watchSyncStatus().listen(_onSync));
  }

  final WatchSessionContextUseCase _watchContext;
  final WatchConnectivityUseCase _watchConnectivity;
  final WatchSyncStatusUseCase _watchSyncStatus;
  final LoadProfileUseCase _loadProfile;
  final LoadAppInfoUseCase _loadAppInfo;
  final SignOutUseCase _signOut;
  final List<StreamSubscription<Object?>> _subscriptions = [];

  Future<void> load() async {
    emit(state.copyWith(profileStatus: ProfileStatus.loading));
    final info = await _loadAppInfo();
    emit(state.copyWith(appInfo: info));
    try {
      final profile = await _loadProfile();
      emit(
        state.copyWith(
          profile: profile,
          profileStatus: profile == null
              ? ProfileStatus.unavailable
              : ProfileStatus.ready,
        ),
      );
    } on Object catch (error) {
      AppLog.info('settings', 'Profile not loaded: $error');
      emit(state.copyWith(profileStatus: ProfileStatus.unavailable));
    }
  }

  Future<void> signOut() async {
    emit(state.copyWith(signOutStatus: SignOutStatus.inProgress));
    try {
      await _signOut();
      emit(state.copyWith(signOutStatus: SignOutStatus.done));
    } on Object catch (error, stackTrace) {
      AppLog.error('settings', 'Sign-out failed', error, stackTrace);
      emit(state.copyWith(signOutStatus: SignOutStatus.failed));
    }
  }

  void _onContext(SessionContext? context) =>
      emit(state.copyWith(context: context));

  void _onConnectivity(bool online) => emit(state.copyWith(online: online));

  void _onSync(SyncSnapshot sync) => emit(state.copyWith(sync: sync));

  @override
  Future<void> close() async {
    for (final subscription in _subscriptions) {
      await subscription.cancel();
    }
    return super.close();
  }
}
