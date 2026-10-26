import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../core/sync/domain/sync_snapshot.dart';
import '../../../../domain/models/home_overview.dart';

part 'home_state.freezed.dart';

enum HomeStatus { loading, ready, failure }

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    @Default(HomeStatus.loading) HomeStatus status,
    @Default(HomeOverview.noContext()) HomeOverview overview,

    /// Why the overview could not load; mapped to copy by the page.
    Object? error,
    @Default(true) bool online,
    @Default(SyncSnapshot.unavailable) SyncSnapshot sync,
  }) = _HomeState;
}
