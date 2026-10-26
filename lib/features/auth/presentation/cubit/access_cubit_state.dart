import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/models/access_state.dart';
import '../../domain/models/signed_in_user.dart';

part 'access_cubit_state.freezed.dart';

@freezed
abstract class AccessCubitState with _$AccessCubitState {
  const factory AccessCubitState({
    @Default(AccessState()) AccessState access,
    SignedInUser? user,
    @Default(false) bool refreshing,
  }) = _AccessCubitState;

  const AccessCubitState._();

  /// Name to greet: the active person's, else the provider's.
  String get displayName {
    final personId = access.active?.personId;
    for (final person in access.people) {
      if (person.id == personId || personId == null) {
        final full = '${person.firstName} ${person.lastName}'.trim();
        if (full.isNotEmpty) return full;
      }
    }
    return user?.displayName ?? '';
  }

  String get firstName {
    final name = displayName;
    return name.isEmpty ? '' : name.split(' ').first;
  }
}
