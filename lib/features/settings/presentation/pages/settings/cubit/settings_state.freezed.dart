// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SettingsState {
  SessionContext? get context;
  UserProfile? get profile;
  ProfileStatus get profileStatus;
  AppInfo? get appInfo;
  bool get online;
  SyncSnapshot get sync;
  SignOutStatus get signOutStatus;

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SettingsStateCopyWith<SettingsState> get copyWith =>
      _$SettingsStateCopyWithImpl<SettingsState>(
        this as SettingsState,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SettingsState &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.profile, profile) || other.profile == profile) &&
            (identical(other.profileStatus, profileStatus) ||
                other.profileStatus == profileStatus) &&
            (identical(other.appInfo, appInfo) || other.appInfo == appInfo) &&
            (identical(other.online, online) || other.online == online) &&
            (identical(other.sync, sync) || other.sync == sync) &&
            (identical(other.signOutStatus, signOutStatus) ||
                other.signOutStatus == signOutStatus));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    context,
    profile,
    profileStatus,
    appInfo,
    online,
    sync,
    signOutStatus,
  );

  @override
  String toString() {
    return 'SettingsState(context: $context, profile: $profile, profileStatus: $profileStatus, appInfo: $appInfo, online: $online, sync: $sync, signOutStatus: $signOutStatus)';
  }
}

/// @nodoc
abstract mixin class $SettingsStateCopyWith<$Res> {
  factory $SettingsStateCopyWith(
    SettingsState value,
    $Res Function(SettingsState) _then,
  ) = _$SettingsStateCopyWithImpl;
  @useResult
  $Res call({
    SessionContext? context,
    UserProfile? profile,
    ProfileStatus profileStatus,
    AppInfo? appInfo,
    bool online,
    SyncSnapshot sync,
    SignOutStatus signOutStatus,
  });

  $SessionContextCopyWith<$Res>? get context;
  $UserProfileCopyWith<$Res>? get profile;
  $AppInfoCopyWith<$Res>? get appInfo;
  $SyncSnapshotCopyWith<$Res> get sync;
}

/// @nodoc
class _$SettingsStateCopyWithImpl<$Res>
    implements $SettingsStateCopyWith<$Res> {
  _$SettingsStateCopyWithImpl(this._self, this._then);

  final SettingsState _self;
  final $Res Function(SettingsState) _then;

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? context = freezed,
    Object? profile = freezed,
    Object? profileStatus = null,
    Object? appInfo = freezed,
    Object? online = null,
    Object? sync = null,
    Object? signOutStatus = null,
  }) {
    return _then(
      _self.copyWith(
        context: freezed == context
            ? _self.context
            : context // ignore: cast_nullable_to_non_nullable
                  as SessionContext?,
        profile: freezed == profile
            ? _self.profile
            : profile // ignore: cast_nullable_to_non_nullable
                  as UserProfile?,
        profileStatus: null == profileStatus
            ? _self.profileStatus
            : profileStatus // ignore: cast_nullable_to_non_nullable
                  as ProfileStatus,
        appInfo: freezed == appInfo
            ? _self.appInfo
            : appInfo // ignore: cast_nullable_to_non_nullable
                  as AppInfo?,
        online: null == online
            ? _self.online
            : online // ignore: cast_nullable_to_non_nullable
                  as bool,
        sync: null == sync
            ? _self.sync
            : sync // ignore: cast_nullable_to_non_nullable
                  as SyncSnapshot,
        signOutStatus: null == signOutStatus
            ? _self.signOutStatus
            : signOutStatus // ignore: cast_nullable_to_non_nullable
                  as SignOutStatus,
      ),
    );
  }

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SessionContextCopyWith<$Res>? get context {
    if (_self.context == null) {
      return null;
    }

    return $SessionContextCopyWith<$Res>(_self.context!, (value) {
      return _then(_self.copyWith(context: value));
    });
  }

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserProfileCopyWith<$Res>? get profile {
    if (_self.profile == null) {
      return null;
    }

    return $UserProfileCopyWith<$Res>(_self.profile!, (value) {
      return _then(_self.copyWith(profile: value));
    });
  }

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppInfoCopyWith<$Res>? get appInfo {
    if (_self.appInfo == null) {
      return null;
    }

    return $AppInfoCopyWith<$Res>(_self.appInfo!, (value) {
      return _then(_self.copyWith(appInfo: value));
    });
  }

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SyncSnapshotCopyWith<$Res> get sync {
    return $SyncSnapshotCopyWith<$Res>(_self.sync, (value) {
      return _then(_self.copyWith(sync: value));
    });
  }
}

/// Adds pattern-matching-related methods to [SettingsState].
extension SettingsStatePatterns on SettingsState {
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
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SettingsState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SettingsState() when $default != null:
        return $default(_that);
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
  TResult map<TResult extends Object?>(
    TResult Function(_SettingsState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SettingsState():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
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
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_SettingsState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SettingsState() when $default != null:
        return $default(_that);
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
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      SessionContext? context,
      UserProfile? profile,
      ProfileStatus profileStatus,
      AppInfo? appInfo,
      bool online,
      SyncSnapshot sync,
      SignOutStatus signOutStatus,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SettingsState() when $default != null:
        return $default(
          _that.context,
          _that.profile,
          _that.profileStatus,
          _that.appInfo,
          _that.online,
          _that.sync,
          _that.signOutStatus,
        );
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
  TResult when<TResult extends Object?>(
    TResult Function(
      SessionContext? context,
      UserProfile? profile,
      ProfileStatus profileStatus,
      AppInfo? appInfo,
      bool online,
      SyncSnapshot sync,
      SignOutStatus signOutStatus,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SettingsState():
        return $default(
          _that.context,
          _that.profile,
          _that.profileStatus,
          _that.appInfo,
          _that.online,
          _that.sync,
          _that.signOutStatus,
        );
      case _:
        throw StateError('Unexpected subclass');
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
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      SessionContext? context,
      UserProfile? profile,
      ProfileStatus profileStatus,
      AppInfo? appInfo,
      bool online,
      SyncSnapshot sync,
      SignOutStatus signOutStatus,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SettingsState() when $default != null:
        return $default(
          _that.context,
          _that.profile,
          _that.profileStatus,
          _that.appInfo,
          _that.online,
          _that.sync,
          _that.signOutStatus,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _SettingsState implements SettingsState {
  const _SettingsState({
    this.context,
    this.profile,
    this.profileStatus = ProfileStatus.loading,
    this.appInfo,
    this.online = true,
    this.sync = SyncSnapshot.unavailable,
    this.signOutStatus = SignOutStatus.idle,
  });

  @override
  final SessionContext? context;
  @override
  final UserProfile? profile;
  @override
  @JsonKey()
  final ProfileStatus profileStatus;
  @override
  final AppInfo? appInfo;
  @override
  @JsonKey()
  final bool online;
  @override
  @JsonKey()
  final SyncSnapshot sync;
  @override
  @JsonKey()
  final SignOutStatus signOutStatus;

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SettingsStateCopyWith<_SettingsState> get copyWith =>
      __$SettingsStateCopyWithImpl<_SettingsState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SettingsState &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.profile, profile) || other.profile == profile) &&
            (identical(other.profileStatus, profileStatus) ||
                other.profileStatus == profileStatus) &&
            (identical(other.appInfo, appInfo) || other.appInfo == appInfo) &&
            (identical(other.online, online) || other.online == online) &&
            (identical(other.sync, sync) || other.sync == sync) &&
            (identical(other.signOutStatus, signOutStatus) ||
                other.signOutStatus == signOutStatus));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    context,
    profile,
    profileStatus,
    appInfo,
    online,
    sync,
    signOutStatus,
  );

  @override
  String toString() {
    return 'SettingsState(context: $context, profile: $profile, profileStatus: $profileStatus, appInfo: $appInfo, online: $online, sync: $sync, signOutStatus: $signOutStatus)';
  }
}

/// @nodoc
abstract mixin class _$SettingsStateCopyWith<$Res>
    implements $SettingsStateCopyWith<$Res> {
  factory _$SettingsStateCopyWith(
    _SettingsState value,
    $Res Function(_SettingsState) _then,
  ) = __$SettingsStateCopyWithImpl;
  @override
  @useResult
  $Res call({
    SessionContext? context,
    UserProfile? profile,
    ProfileStatus profileStatus,
    AppInfo? appInfo,
    bool online,
    SyncSnapshot sync,
    SignOutStatus signOutStatus,
  });

  @override
  $SessionContextCopyWith<$Res>? get context;
  @override
  $UserProfileCopyWith<$Res>? get profile;
  @override
  $AppInfoCopyWith<$Res>? get appInfo;
  @override
  $SyncSnapshotCopyWith<$Res> get sync;
}

/// @nodoc
class __$SettingsStateCopyWithImpl<$Res>
    implements _$SettingsStateCopyWith<$Res> {
  __$SettingsStateCopyWithImpl(this._self, this._then);

  final _SettingsState _self;
  final $Res Function(_SettingsState) _then;

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? context = freezed,
    Object? profile = freezed,
    Object? profileStatus = null,
    Object? appInfo = freezed,
    Object? online = null,
    Object? sync = null,
    Object? signOutStatus = null,
  }) {
    return _then(
      _SettingsState(
        context: freezed == context
            ? _self.context
            : context // ignore: cast_nullable_to_non_nullable
                  as SessionContext?,
        profile: freezed == profile
            ? _self.profile
            : profile // ignore: cast_nullable_to_non_nullable
                  as UserProfile?,
        profileStatus: null == profileStatus
            ? _self.profileStatus
            : profileStatus // ignore: cast_nullable_to_non_nullable
                  as ProfileStatus,
        appInfo: freezed == appInfo
            ? _self.appInfo
            : appInfo // ignore: cast_nullable_to_non_nullable
                  as AppInfo?,
        online: null == online
            ? _self.online
            : online // ignore: cast_nullable_to_non_nullable
                  as bool,
        sync: null == sync
            ? _self.sync
            : sync // ignore: cast_nullable_to_non_nullable
                  as SyncSnapshot,
        signOutStatus: null == signOutStatus
            ? _self.signOutStatus
            : signOutStatus // ignore: cast_nullable_to_non_nullable
                  as SignOutStatus,
      ),
    );
  }

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SessionContextCopyWith<$Res>? get context {
    if (_self.context == null) {
      return null;
    }

    return $SessionContextCopyWith<$Res>(_self.context!, (value) {
      return _then(_self.copyWith(context: value));
    });
  }

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserProfileCopyWith<$Res>? get profile {
    if (_self.profile == null) {
      return null;
    }

    return $UserProfileCopyWith<$Res>(_self.profile!, (value) {
      return _then(_self.copyWith(profile: value));
    });
  }

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppInfoCopyWith<$Res>? get appInfo {
    if (_self.appInfo == null) {
      return null;
    }

    return $AppInfoCopyWith<$Res>(_self.appInfo!, (value) {
      return _then(_self.copyWith(appInfo: value));
    });
  }

  /// Create a copy of SettingsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SyncSnapshotCopyWith<$Res> get sync {
    return $SyncSnapshotCopyWith<$Res>(_self.sync, (value) {
      return _then(_self.copyWith(sync: value));
    });
  }
}
