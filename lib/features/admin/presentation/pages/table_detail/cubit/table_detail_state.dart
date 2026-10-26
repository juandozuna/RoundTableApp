import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../core/network/api_exception.dart';
import '../../../../domain/models/invite_share.dart';
import '../../../../domain/models/table_detail.dart';

part 'table_detail_state.freezed.dart';

enum TableDetailStatus { loading, ready, failure }

/// What the last successful change was (drives the success toast).
enum TableNotice {
  facilitatorChanged,
  memberAdded,
  memberMoved,
  memberDeactivated,
}

@freezed
abstract class TableDetailState with _$TableDetailState {
  const factory TableDetailState({
    @Default(TableDetailStatus.loading) TableDetailStatus status,
    TableDetail? detail,
    ApiException? error,
    @Default(false) bool working,
    TableNotice? notice,

    /// Name of the person the notice is about.
    String? noticeName,
    ApiException? actionError,
    InviteShare? facilitatorInvite,
  }) = _TableDetailState;
}
