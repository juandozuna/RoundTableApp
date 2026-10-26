import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/models/profile_update.dart';
import '../../../../domain/use_cases/profile/load_profile_use_case.dart';
import '../../../../domain/use_cases/profile/update_profile_use_case.dart';
import 'profile_edit_state.dart';

@injectable
class ProfileEditCubit extends Cubit<ProfileEditState> {
  ProfileEditCubit(this._loadProfile, this._updateProfile)
    : super(const ProfileEditState.loading());

  final LoadProfileUseCase _loadProfile;
  final UpdateProfileUseCase _updateProfile;

  Future<void> load() async {
    emit(const ProfileEditState.loading());
    try {
      final profile = await _loadProfile();
      emit(
        profile == null
            ? const ProfileEditState.unavailable()
            : ProfileEditState.editing(profile: profile),
      );
    } on Object catch (error) {
      emit(ProfileEditState.unavailable(error: error));
    }
  }

  Future<void> save(ProfileUpdate update) async {
    final current = state;
    if (current is! ProfileEditEditing || current.saving) return;
    emit(current.copyWith(saving: true, error: null));
    try {
      emit(ProfileEditState.saved(await _updateProfile(update)));
    } on Object catch (error) {
      emit(current.copyWith(saving: false, error: error));
    }
  }
}
