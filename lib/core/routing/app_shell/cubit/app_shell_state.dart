import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../models/user_role.dart';

part 'app_shell_state.freezed.dart';

@freezed
abstract class AppShellState with _$AppShellState {
  const factory AppShellState({UserRole? role}) = _AppShellState;
}
