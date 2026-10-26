import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/services/session_context/session_context.dart';
import '../../../../core/services/session_context/watch_session_context_use_case.dart';
import 'context_chip_state.dart';

/// Follows the active context for the header chip.
@injectable
class ContextChipCubit extends Cubit<ContextChipState> {
  ContextChipCubit(this._watchContext) : super(const ContextChipState()) {
    _subscription = _watchContext().listen(_onContext);
  }

  final WatchSessionContextUseCase _watchContext;
  late final StreamSubscription<SessionContext?> _subscription;

  void _onContext(SessionContext? context) =>
      emit(ContextChipState(context: context));

  @override
  Future<void> close() async {
    await _subscription.cancel();
    return super.close();
  }
}
