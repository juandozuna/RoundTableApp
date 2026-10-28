import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../core/network/api_exception.dart';
import '../../../../domain/models/invite_share.dart';
import '../../../../domain/models/table_form_data.dart';
import '../../../../domain/models/table_input.dart';

part 'table_form_state.freezed.dart';

enum TableFormStatus { loading, editing, submitting, saved, failure }

@freezed
abstract class TableFormState with _$TableFormState {
  const factory TableFormState({
    @Default(TableFormStatus.loading) TableFormStatus status,
    @Default(TableFormData()) TableFormData data,

    /// Organization whose locations and people are offered.
    String? organizationId,
    ApiException? error,
    String? savedTableId,
    InviteShare? facilitatorInvite,

    /// Edit the server refused until the admin confirms moving the program
    /// back past completed sessions.
    TableInput? pendingRewind,
  }) = _TableFormState;
}
