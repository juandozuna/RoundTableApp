import 'package:freezed_annotation/freezed_annotation.dart';

import 'invite_share.dart';

part 'table_change.freezed.dart';

/// Result of creating a table or changing its facilitator.
@freezed
abstract class TableChange with _$TableChange {
  const factory TableChange({
    required String tableId,
    InviteShare? facilitatorInvite,
  }) = _TableChange;
}
