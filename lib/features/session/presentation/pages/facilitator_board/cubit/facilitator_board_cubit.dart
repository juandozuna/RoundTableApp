import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/models/attendance_status.dart';
import '../../../../../../core/services/logging/app_log.dart';
import '../../../../domain/models/facilitator_stage.dart';
import '../../../../domain/use_cases/attendance/mark_attendance_use_case.dart';
import '../../../../domain/use_cases/attendance/mark_everyone_present_use_case.dart';
import 'facilitator_board_state.dart';

/// View state of the facilitator's board and attendance taking.
@injectable
class FacilitatorBoardCubit extends Cubit<FacilitatorBoardState> {
  FacilitatorBoardCubit(this._markAttendance, this._markEveryonePresent)
    : super(const FacilitatorBoardState());

  final MarkAttendanceUseCase _markAttendance;
  final MarkEveryonePresentUseCase _markEveryonePresent;

  void selectTab(FacilitatorTab tab) => emit(state.copyWith(tab: tab));

  /// Looks at another stage's progress. Only stages already reached can be
  /// viewed; the current one resets the view.
  void view(FacilitatorStage stage, {required FacilitatorStage current}) {
    if (stage.index > current.index) return;
    emit(state.copyWith(viewing: stage == current ? null : stage));
  }

  /// The session moved to another stage: follow it.
  void followCurrentStage() => emit(state.copyWith(viewing: null));

  Future<void> mark({
    required String sessionId,
    required String personId,
    required AttendanceStatus status,
  }) => _save(
    () => _markAttendance(
      sessionId: sessionId,
      personId: personId,
      status: status,
    ),
  );

  Future<void> markEveryonePresent({
    required String sessionId,
    required List<String> personIds,
  }) => _save(
    () => _markEveryonePresent(sessionId: sessionId, personIds: personIds),
  );

  void consumeFailure() => emit(state.copyWith(failure: null));

  Future<void> _save(Future<void> Function() save) async {
    emit(state.copyWith(isSaving: true, failure: null));
    try {
      await save();
      emit(state.copyWith(isSaving: false));
    } on Object catch (error, stackTrace) {
      AppLog.error('session', 'Saving attendance failed', error, stackTrace);
      emit(state.copyWith(isSaving: false, failure: error));
    }
  }
}
