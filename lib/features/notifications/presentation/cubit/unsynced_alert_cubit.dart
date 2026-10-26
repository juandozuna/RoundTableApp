import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/models/unsynced_alert.dart';
import '../../domain/use_cases/unsynced/watch_unsynced_alert_use_case.dart';

/// `null` state means there is nothing to warn about.
@injectable
class UnsyncedAlertCubit extends Cubit<UnsyncedAlert?> {
  UnsyncedAlertCubit(this._watchAlert) : super(null) {
    _subscription = _watchAlert().listen(emit);
  }

  final WatchUnsyncedAlertUseCase _watchAlert;
  late final StreamSubscription<UnsyncedAlert?> _subscription;

  @override
  Future<void> close() async {
    await _subscription.cancel();
    return super.close();
  }
}
