import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/models/facilitator_stage.dart';

part 'facilitator_board_state.freezed.dart';

/// Which of the facilitator's two tabs is open (ADR 0014).
enum FacilitatorTab { board, myAnswers }

@freezed
abstract class FacilitatorBoardState with _$FacilitatorBoardState {
  const factory FacilitatorBoardState({
    @Default(FacilitatorTab.board) FacilitatorTab tab,

    /// Stage whose progress the board shows; null follows the current one.
    FacilitatorStage? viewing,
    @Default(false) bool isSaving,
    Object? failure,
  }) = _FacilitatorBoardState;
}
