import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_progress.freezed.dart';

/// Values of one curriculum module a member has scored.
@freezed
abstract class ModuleProgress with _$ModuleProgress {
  const factory ModuleProgress({
    required int number,
    required String name,
    required int completed,
    required int total,
  }) = _ModuleProgress;
}

/// A member's progress through the 48 values, by module.
@freezed
abstract class HomeProgress with _$HomeProgress {
  const factory HomeProgress({@Default([]) List<ModuleProgress> modules}) =
      _HomeProgress;

  const HomeProgress._();

  int get completed => modules.fold(0, (sum, m) => sum + m.completed);

  int get total => modules.fold(0, (sum, m) => sum + m.total);

  bool get isEmpty => total == 0;
}
