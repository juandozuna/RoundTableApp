import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../services/session_context/session_context.dart';
import '../../../services/session_context/watch_session_context_use_case.dart';
import 'app_shell_state.dart';

/// Tracks the active role so the shell shows the right destinations.
@injectable
class AppShellCubit extends Cubit<AppShellState> {
  AppShellCubit(this._watchSessionContext) : super(const AppShellState()) {
    _subscription = _watchSessionContext().listen(_onContext);
  }

  final WatchSessionContextUseCase _watchSessionContext;
  late final StreamSubscription<SessionContext?> _subscription;

  void _onContext(SessionContext? context) =>
      emit(state.copyWith(role: context?.role));

  @override
  Future<void> close() async {
    await _subscription.cancel();
    return super.close();
  }
}
