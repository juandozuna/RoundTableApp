// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'curriculum_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CurriculumState {
  CurriculumStatus get status;
  CurriculumView? get view;

  /// Language being viewed; null is the Spanish base.
  String? get locale;
  bool get saving;
  ApiException? get error;
  CurriculumNotice? get notice;

  /// Create a copy of CurriculumState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CurriculumStateCopyWith<CurriculumState> get copyWith =>
      _$CurriculumStateCopyWithImpl<CurriculumState>(
        this as CurriculumState,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CurriculumState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.view, view) || other.view == view) &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.saving, saving) || other.saving == saving) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.notice, notice) || other.notice == notice));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, status, view, locale, saving, error, notice);

  @override
  String toString() {
    return 'CurriculumState(status: $status, view: $view, locale: $locale, saving: $saving, error: $error, notice: $notice)';
  }
}

/// @nodoc
abstract mixin class $CurriculumStateCopyWith<$Res> {
  factory $CurriculumStateCopyWith(
    CurriculumState value,
    $Res Function(CurriculumState) _then,
  ) = _$CurriculumStateCopyWithImpl;
  @useResult
  $Res call({
    CurriculumStatus status,
    CurriculumView? view,
    String? locale,
    bool saving,
    ApiException? error,
    CurriculumNotice? notice,
  });

  $CurriculumViewCopyWith<$Res>? get view;
}

/// @nodoc
class _$CurriculumStateCopyWithImpl<$Res>
    implements $CurriculumStateCopyWith<$Res> {
  _$CurriculumStateCopyWithImpl(this._self, this._then);

  final CurriculumState _self;
  final $Res Function(CurriculumState) _then;

  /// Create a copy of CurriculumState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? view = freezed,
    Object? locale = freezed,
    Object? saving = null,
    Object? error = freezed,
    Object? notice = freezed,
  }) {
    return _then(
      _self.copyWith(
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as CurriculumStatus,
        view: freezed == view
            ? _self.view
            : view // ignore: cast_nullable_to_non_nullable
                  as CurriculumView?,
        locale: freezed == locale
            ? _self.locale
            : locale // ignore: cast_nullable_to_non_nullable
                  as String?,
        saving: null == saving
            ? _self.saving
            : saving // ignore: cast_nullable_to_non_nullable
                  as bool,
        error: freezed == error
            ? _self.error
            : error // ignore: cast_nullable_to_non_nullable
                  as ApiException?,
        notice: freezed == notice
            ? _self.notice
            : notice // ignore: cast_nullable_to_non_nullable
                  as CurriculumNotice?,
      ),
    );
  }

  /// Create a copy of CurriculumState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CurriculumViewCopyWith<$Res>? get view {
    if (_self.view == null) {
      return null;
    }

    return $CurriculumViewCopyWith<$Res>(_self.view!, (value) {
      return _then(_self.copyWith(view: value));
    });
  }
}

/// Adds pattern-matching-related methods to [CurriculumState].
extension CurriculumStatePatterns on CurriculumState {
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
    TResult Function(_CurriculumState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CurriculumState() when $default != null:
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
    TResult Function(_CurriculumState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CurriculumState():
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
    TResult? Function(_CurriculumState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CurriculumState() when $default != null:
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
      CurriculumStatus status,
      CurriculumView? view,
      String? locale,
      bool saving,
      ApiException? error,
      CurriculumNotice? notice,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CurriculumState() when $default != null:
        return $default(
          _that.status,
          _that.view,
          _that.locale,
          _that.saving,
          _that.error,
          _that.notice,
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
      CurriculumStatus status,
      CurriculumView? view,
      String? locale,
      bool saving,
      ApiException? error,
      CurriculumNotice? notice,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CurriculumState():
        return $default(
          _that.status,
          _that.view,
          _that.locale,
          _that.saving,
          _that.error,
          _that.notice,
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
      CurriculumStatus status,
      CurriculumView? view,
      String? locale,
      bool saving,
      ApiException? error,
      CurriculumNotice? notice,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CurriculumState() when $default != null:
        return $default(
          _that.status,
          _that.view,
          _that.locale,
          _that.saving,
          _that.error,
          _that.notice,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _CurriculumState implements CurriculumState {
  const _CurriculumState({
    this.status = CurriculumStatus.loading,
    this.view,
    this.locale,
    this.saving = false,
    this.error,
    this.notice,
  });

  @override
  @JsonKey()
  final CurriculumStatus status;
  @override
  final CurriculumView? view;

  /// Language being viewed; null is the Spanish base.
  @override
  final String? locale;
  @override
  @JsonKey()
  final bool saving;
  @override
  final ApiException? error;
  @override
  final CurriculumNotice? notice;

  /// Create a copy of CurriculumState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CurriculumStateCopyWith<_CurriculumState> get copyWith =>
      __$CurriculumStateCopyWithImpl<_CurriculumState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CurriculumState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.view, view) || other.view == view) &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.saving, saving) || other.saving == saving) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.notice, notice) || other.notice == notice));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, status, view, locale, saving, error, notice);

  @override
  String toString() {
    return 'CurriculumState(status: $status, view: $view, locale: $locale, saving: $saving, error: $error, notice: $notice)';
  }
}

/// @nodoc
abstract mixin class _$CurriculumStateCopyWith<$Res>
    implements $CurriculumStateCopyWith<$Res> {
  factory _$CurriculumStateCopyWith(
    _CurriculumState value,
    $Res Function(_CurriculumState) _then,
  ) = __$CurriculumStateCopyWithImpl;
  @override
  @useResult
  $Res call({
    CurriculumStatus status,
    CurriculumView? view,
    String? locale,
    bool saving,
    ApiException? error,
    CurriculumNotice? notice,
  });

  @override
  $CurriculumViewCopyWith<$Res>? get view;
}

/// @nodoc
class __$CurriculumStateCopyWithImpl<$Res>
    implements _$CurriculumStateCopyWith<$Res> {
  __$CurriculumStateCopyWithImpl(this._self, this._then);

  final _CurriculumState _self;
  final $Res Function(_CurriculumState) _then;

  /// Create a copy of CurriculumState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? view = freezed,
    Object? locale = freezed,
    Object? saving = null,
    Object? error = freezed,
    Object? notice = freezed,
  }) {
    return _then(
      _CurriculumState(
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as CurriculumStatus,
        view: freezed == view
            ? _self.view
            : view // ignore: cast_nullable_to_non_nullable
                  as CurriculumView?,
        locale: freezed == locale
            ? _self.locale
            : locale // ignore: cast_nullable_to_non_nullable
                  as String?,
        saving: null == saving
            ? _self.saving
            : saving // ignore: cast_nullable_to_non_nullable
                  as bool,
        error: freezed == error
            ? _self.error
            : error // ignore: cast_nullable_to_non_nullable
                  as ApiException?,
        notice: freezed == notice
            ? _self.notice
            : notice // ignore: cast_nullable_to_non_nullable
                  as CurriculumNotice?,
      ),
    );
  }

  /// Create a copy of CurriculumState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CurriculumViewCopyWith<$Res>? get view {
    if (_self.view == null) {
      return null;
    }

    return $CurriculumViewCopyWith<$Res>(_self.view!, (value) {
      return _then(_self.copyWith(view: value));
    });
  }
}
