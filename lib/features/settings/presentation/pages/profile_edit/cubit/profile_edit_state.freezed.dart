// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_edit_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfileEditState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ProfileEditState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProfileEditState()';
  }
}

/// @nodoc
class $ProfileEditStateCopyWith<$Res> {
  $ProfileEditStateCopyWith(
    ProfileEditState _,
    $Res Function(ProfileEditState) __,
  );
}

/// Adds pattern-matching-related methods to [ProfileEditState].
extension ProfileEditStatePatterns on ProfileEditState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileEditLoading value)? loading,
    TResult Function(ProfileEditEditing value)? editing,
    TResult Function(ProfileEditSaved value)? saved,
    TResult Function(ProfileEditUnavailable value)? unavailable,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ProfileEditLoading() when loading != null:
        return loading(_that);
      case ProfileEditEditing() when editing != null:
        return editing(_that);
      case ProfileEditSaved() when saved != null:
        return saved(_that);
      case ProfileEditUnavailable() when unavailable != null:
        return unavailable(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProfileEditLoading value) loading,
    required TResult Function(ProfileEditEditing value) editing,
    required TResult Function(ProfileEditSaved value) saved,
    required TResult Function(ProfileEditUnavailable value) unavailable,
  }) {
    final _that = this;
    switch (_that) {
      case ProfileEditLoading():
        return loading(_that);
      case ProfileEditEditing():
        return editing(_that);
      case ProfileEditSaved():
        return saved(_that);
      case ProfileEditUnavailable():
        return unavailable(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProfileEditLoading value)? loading,
    TResult? Function(ProfileEditEditing value)? editing,
    TResult? Function(ProfileEditSaved value)? saved,
    TResult? Function(ProfileEditUnavailable value)? unavailable,
  }) {
    final _that = this;
    switch (_that) {
      case ProfileEditLoading() when loading != null:
        return loading(_that);
      case ProfileEditEditing() when editing != null:
        return editing(_that);
      case ProfileEditSaved() when saved != null:
        return saved(_that);
      case ProfileEditUnavailable() when unavailable != null:
        return unavailable(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(UserProfile profile, bool saving, Object? error)? editing,
    TResult Function(UserProfile profile)? saved,
    TResult Function(Object? error)? unavailable,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ProfileEditLoading() when loading != null:
        return loading();
      case ProfileEditEditing() when editing != null:
        return editing(_that.profile, _that.saving, _that.error);
      case ProfileEditSaved() when saved != null:
        return saved(_that.profile);
      case ProfileEditUnavailable() when unavailable != null:
        return unavailable(_that.error);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(UserProfile profile, bool saving, Object? error)
    editing,
    required TResult Function(UserProfile profile) saved,
    required TResult Function(Object? error) unavailable,
  }) {
    final _that = this;
    switch (_that) {
      case ProfileEditLoading():
        return loading();
      case ProfileEditEditing():
        return editing(_that.profile, _that.saving, _that.error);
      case ProfileEditSaved():
        return saved(_that.profile);
      case ProfileEditUnavailable():
        return unavailable(_that.error);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(UserProfile profile, bool saving, Object? error)? editing,
    TResult? Function(UserProfile profile)? saved,
    TResult? Function(Object? error)? unavailable,
  }) {
    final _that = this;
    switch (_that) {
      case ProfileEditLoading() when loading != null:
        return loading();
      case ProfileEditEditing() when editing != null:
        return editing(_that.profile, _that.saving, _that.error);
      case ProfileEditSaved() when saved != null:
        return saved(_that.profile);
      case ProfileEditUnavailable() when unavailable != null:
        return unavailable(_that.error);
      case _:
        return null;
    }
  }
}

/// @nodoc

class ProfileEditLoading implements ProfileEditState {
  const ProfileEditLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ProfileEditLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProfileEditState.loading()';
  }
}

/// @nodoc

class ProfileEditEditing implements ProfileEditState {
  const ProfileEditEditing({
    required this.profile,
    this.saving = false,
    this.error,
  });

  final UserProfile profile;
  @JsonKey()
  final bool saving;
  final Object? error;

  /// Create a copy of ProfileEditState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProfileEditEditingCopyWith<ProfileEditEditing> get copyWith =>
      _$ProfileEditEditingCopyWithImpl<ProfileEditEditing>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProfileEditEditing &&
            (identical(other.profile, profile) || other.profile == profile) &&
            (identical(other.saving, saving) || other.saving == saving) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    profile,
    saving,
    const DeepCollectionEquality().hash(error),
  );

  @override
  String toString() {
    return 'ProfileEditState.editing(profile: $profile, saving: $saving, error: $error)';
  }
}

/// @nodoc
abstract mixin class $ProfileEditEditingCopyWith<$Res>
    implements $ProfileEditStateCopyWith<$Res> {
  factory $ProfileEditEditingCopyWith(
    ProfileEditEditing value,
    $Res Function(ProfileEditEditing) _then,
  ) = _$ProfileEditEditingCopyWithImpl;
  @useResult
  $Res call({UserProfile profile, bool saving, Object? error});

  $UserProfileCopyWith<$Res> get profile;
}

/// @nodoc
class _$ProfileEditEditingCopyWithImpl<$Res>
    implements $ProfileEditEditingCopyWith<$Res> {
  _$ProfileEditEditingCopyWithImpl(this._self, this._then);

  final ProfileEditEditing _self;
  final $Res Function(ProfileEditEditing) _then;

  /// Create a copy of ProfileEditState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? profile = null,
    Object? saving = null,
    Object? error = freezed,
  }) {
    return _then(
      ProfileEditEditing(
        profile: null == profile
            ? _self.profile
            : profile // ignore: cast_nullable_to_non_nullable
                  as UserProfile,
        saving: null == saving
            ? _self.saving
            : saving // ignore: cast_nullable_to_non_nullable
                  as bool,
        error: freezed == error ? _self.error : error,
      ),
    );
  }

  /// Create a copy of ProfileEditState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserProfileCopyWith<$Res> get profile {
    return $UserProfileCopyWith<$Res>(_self.profile, (value) {
      return _then(_self.copyWith(profile: value));
    });
  }
}

/// @nodoc

class ProfileEditSaved implements ProfileEditState {
  const ProfileEditSaved(this.profile);

  final UserProfile profile;

  /// Create a copy of ProfileEditState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProfileEditSavedCopyWith<ProfileEditSaved> get copyWith =>
      _$ProfileEditSavedCopyWithImpl<ProfileEditSaved>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProfileEditSaved &&
            (identical(other.profile, profile) || other.profile == profile));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profile);

  @override
  String toString() {
    return 'ProfileEditState.saved(profile: $profile)';
  }
}

/// @nodoc
abstract mixin class $ProfileEditSavedCopyWith<$Res>
    implements $ProfileEditStateCopyWith<$Res> {
  factory $ProfileEditSavedCopyWith(
    ProfileEditSaved value,
    $Res Function(ProfileEditSaved) _then,
  ) = _$ProfileEditSavedCopyWithImpl;
  @useResult
  $Res call({UserProfile profile});

  $UserProfileCopyWith<$Res> get profile;
}

/// @nodoc
class _$ProfileEditSavedCopyWithImpl<$Res>
    implements $ProfileEditSavedCopyWith<$Res> {
  _$ProfileEditSavedCopyWithImpl(this._self, this._then);

  final ProfileEditSaved _self;
  final $Res Function(ProfileEditSaved) _then;

  /// Create a copy of ProfileEditState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? profile = null}) {
    return _then(
      ProfileEditSaved(
        null == profile
            ? _self.profile
            : profile // ignore: cast_nullable_to_non_nullable
                  as UserProfile,
      ),
    );
  }

  /// Create a copy of ProfileEditState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserProfileCopyWith<$Res> get profile {
    return $UserProfileCopyWith<$Res>(_self.profile, (value) {
      return _then(_self.copyWith(profile: value));
    });
  }
}

/// @nodoc

class ProfileEditUnavailable implements ProfileEditState {
  const ProfileEditUnavailable({this.error});

  final Object? error;

  /// Create a copy of ProfileEditState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProfileEditUnavailableCopyWith<ProfileEditUnavailable> get copyWith =>
      _$ProfileEditUnavailableCopyWithImpl<ProfileEditUnavailable>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProfileEditUnavailable &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @override
  String toString() {
    return 'ProfileEditState.unavailable(error: $error)';
  }
}

/// @nodoc
abstract mixin class $ProfileEditUnavailableCopyWith<$Res>
    implements $ProfileEditStateCopyWith<$Res> {
  factory $ProfileEditUnavailableCopyWith(
    ProfileEditUnavailable value,
    $Res Function(ProfileEditUnavailable) _then,
  ) = _$ProfileEditUnavailableCopyWithImpl;
  @useResult
  $Res call({Object? error});
}

/// @nodoc
class _$ProfileEditUnavailableCopyWithImpl<$Res>
    implements $ProfileEditUnavailableCopyWith<$Res> {
  _$ProfileEditUnavailableCopyWithImpl(this._self, this._then);

  final ProfileEditUnavailable _self;
  final $Res Function(ProfileEditUnavailable) _then;

  /// Create a copy of ProfileEditState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? error = freezed}) {
    return _then(
      ProfileEditUnavailable(error: freezed == error ? _self.error : error),
    );
  }
}
