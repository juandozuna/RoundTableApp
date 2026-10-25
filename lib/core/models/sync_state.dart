import 'package:json_annotation/json_annotation.dart';

part 'sync_state.g.dart';

/// Synchronization state of locally captured session data (ADR 0005).
///
/// Wire values must match `docs/implementation/api-contract.md`.
@JsonEnum(alwaysCreate: true)
enum SyncState {
  @JsonValue('pending')
  pending,
  @JsonValue('syncing')
  syncing,
  @JsonValue('synced')
  synced,
  @JsonValue('synced_late')
  syncedLate;

  String get wireValue => _$SyncStateEnumMap[this]!;

  static SyncState? tryParse(String? raw) => $enumDecodeNullable(
    _$SyncStateEnumMap,
    raw,
    unknownValue: JsonKey.nullForUndefinedEnumValue,
  );
}
