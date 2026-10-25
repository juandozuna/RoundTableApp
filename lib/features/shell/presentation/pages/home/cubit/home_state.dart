import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../core/sync/domain/sync_snapshot.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    @Default(true) bool online,
    @Default(SyncSnapshot.unavailable) SyncSnapshot sync,
  }) = _HomeState;
}
