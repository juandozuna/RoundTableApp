import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/models/invite_problem.dart';
import '../../../../domain/services/invite_attempts_service.dart';
import '../../../../domain/use_cases/redeem/get_remaining_attempts_use_case.dart';
import '../../../../domain/use_cases/redeem/preview_invite_use_case.dart';
import 'code_entry_state.dart';

@injectable
class CodeEntryCubit extends Cubit<CodeEntryState> {
  CodeEntryCubit(this._preview, this._remainingAttempts)
    : super(CodeEntryState(remainingAttempts: _remainingAttempts()));

  final PreviewInviteUseCase _preview;
  final GetRemainingAttemptsUseCase _remainingAttempts;
  Timer? _unlock;

  /// Checks a typed [code]. Wrong codes count towards the lock.
  Future<void> submit(String code) async {
    if (state.status == CodeEntryStatus.checking || state.isLocked) return;
    emit(
      state.copyWith(
        status: CodeEntryStatus.checking,
        problem: null,
        code: code,
      ),
    );
    try {
      final preview = await _preview(code, typed: true);
      if (isClosed) return;
      emit(
        CodeEntryState(
          status: CodeEntryStatus.verified,
          verified: preview,
          remainingAttempts: _remainingAttempts(),
        ),
      );
    } on InviteFailure catch (failure) {
      if (isClosed) return;
      emit(
        CodeEntryState(
          status: CodeEntryStatus.failed,
          code: code,
          problem: failure.problem,
          lockedUntil: failure.lockedUntil,
          remainingAttempts: _remainingAttempts(),
        ),
      );
      if (failure.problem == InviteProblem.lockedOut) _scheduleUnlock();
    }
  }

  /// Clears the error while the person keeps typing.
  void edited() {
    if (state.status == CodeEntryStatus.failed && !state.isLocked) {
      emit(CodeEntryState(remainingAttempts: _remainingAttempts()));
    }
  }

  /// The page consumed [CodeEntryState.verified].
  void reset() => emit(CodeEntryState(remainingAttempts: _remainingAttempts()));

  void _scheduleUnlock() {
    _unlock?.cancel();
    _unlock = Timer(InviteAttemptsService.lockDuration, () {
      if (!isClosed) {
        emit(CodeEntryState(remainingAttempts: _remainingAttempts()));
      }
    });
  }

  @override
  Future<void> close() {
    _unlock?.cancel();
    return super.close();
  }
}
