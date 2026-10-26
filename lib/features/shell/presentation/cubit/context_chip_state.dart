import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/services/session_context/session_context.dart';

part 'context_chip_state.freezed.dart';

@freezed
abstract class ContextChipState with _$ContextChipState {
  const factory ContextChipState({SessionContext? context}) = _ContextChipState;
}
