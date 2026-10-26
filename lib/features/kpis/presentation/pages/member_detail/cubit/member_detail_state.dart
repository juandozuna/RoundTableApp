import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../core/network/api_exception.dart';
import '../../../../domain/models/kpi_member_detail.dart';
import '../../../../domain/models/revealed_answers.dart';

part 'member_detail_state.freezed.dart';

enum MemberDetailStatus { loading, ready, failure }

@freezed
abstract class MemberDetailState with _$MemberDetailState {
  const factory MemberDetailState({
    @Default(MemberDetailStatus.loading) MemberDetailStatus status,
    KpiMemberDetail? member,
    ApiException? error,

    /// Individual answers, only after the user pressed "Mostrar respuestas".
    RevealedPerson? revealed,
    @Default(false) bool revealing,
    ApiException? revealError,
  }) = _MemberDetailState;
}
