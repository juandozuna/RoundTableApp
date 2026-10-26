import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_table.freezed.dart';

/// The round table that holds the session.
@freezed
abstract class SessionTable with _$SessionTable {
  const factory SessionTable({
    required String id,
    required String name,
    required String organizationName,
    required int durationMinutes,
    String? code,
  }) = _SessionTable;
}
