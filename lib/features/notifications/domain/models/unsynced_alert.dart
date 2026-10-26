import 'package:freezed_annotation/freezed_annotation.dart';

part 'unsynced_alert.freezed.dart';

/// Session data that has waited to upload for more than 24 hours.
@freezed
abstract class UnsyncedAlert with _$UnsyncedAlert {
  const factory UnsyncedAlert({required int pendingCount, DateTime? since}) =
      _UnsyncedAlert;
}
