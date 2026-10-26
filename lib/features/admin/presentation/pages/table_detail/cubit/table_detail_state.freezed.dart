// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'table_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TableDetailState {
  TableDetailStatus get status;
  TableDetail? get detail;
  ApiException? get error;
  bool get working;
  TableNotice? get notice;

  /// Name of the person the notice is about.
  String? get noticeName;
  ApiException? get actionError;
  InviteShare? get facilitatorInvite;

  /// Create a copy of TableDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TableDetailStateCopyWith<TableDetailState> get copyWith =>
      _$TableDetailStateCopyWithImpl<TableDetailState>(
        this as TableDetailState,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TableDetailState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.detail, detail) || other.detail == detail) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.working, working) || other.working == working) &&
            (identical(other.notice, notice) || other.notice == notice) &&
            (identical(other.noticeName, noticeName) ||
                other.noticeName == noticeName) &&
            (identical(other.actionError, actionError) ||
                other.actionError == actionError) &&
            (identical(other.facilitatorInvite, facilitatorInvite) ||
                other.facilitatorInvite == facilitatorInvite));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    detail,
    error,
    working,
    notice,
    noticeName,
    actionError,
    facilitatorInvite,
  );

  @override
  String toString() {
    return 'TableDetailState(status: $status, detail: $detail, error: $error, working: $working, notice: $notice, noticeName: $noticeName, actionError: $actionError, facilitatorInvite: $facilitatorInvite)';
  }
}

/// @nodoc
abstract mixin class $TableDetailStateCopyWith<$Res> {
  factory $TableDetailStateCopyWith(
    TableDetailState value,
    $Res Function(TableDetailState) _then,
  ) = _$TableDetailStateCopyWithImpl;
  @useResult
  $Res call({
    TableDetailStatus status,
    TableDetail? detail,
    ApiException? error,
    bool working,
    TableNotice? notice,
    String? noticeName,
    ApiException? actionError,
    InviteShare? facilitatorInvite,
  });

  $TableDetailCopyWith<$Res>? get detail;
  $InviteShareCopyWith<$Res>? get facilitatorInvite;
}

/// @nodoc
class _$TableDetailStateCopyWithImpl<$Res>
    implements $TableDetailStateCopyWith<$Res> {
  _$TableDetailStateCopyWithImpl(this._self, this._then);

  final TableDetailState _self;
  final $Res Function(TableDetailState) _then;

  /// Create a copy of TableDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? detail = freezed,
    Object? error = freezed,
    Object? working = null,
    Object? notice = freezed,
    Object? noticeName = freezed,
    Object? actionError = freezed,
    Object? facilitatorInvite = freezed,
  }) {
    return _then(
      _self.copyWith(
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as TableDetailStatus,
        detail: freezed == detail
            ? _self.detail
            : detail // ignore: cast_nullable_to_non_nullable
                  as TableDetail?,
        error: freezed == error
            ? _self.error
            : error // ignore: cast_nullable_to_non_nullable
                  as ApiException?,
        working: null == working
            ? _self.working
            : working // ignore: cast_nullable_to_non_nullable
                  as bool,
        notice: freezed == notice
            ? _self.notice
            : notice // ignore: cast_nullable_to_non_nullable
                  as TableNotice?,
        noticeName: freezed == noticeName
            ? _self.noticeName
            : noticeName // ignore: cast_nullable_to_non_nullable
                  as String?,
        actionError: freezed == actionError
            ? _self.actionError
            : actionError // ignore: cast_nullable_to_non_nullable
                  as ApiException?,
        facilitatorInvite: freezed == facilitatorInvite
            ? _self.facilitatorInvite
            : facilitatorInvite // ignore: cast_nullable_to_non_nullable
                  as InviteShare?,
      ),
    );
  }

  /// Create a copy of TableDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TableDetailCopyWith<$Res>? get detail {
    if (_self.detail == null) {
      return null;
    }

    return $TableDetailCopyWith<$Res>(_self.detail!, (value) {
      return _then(_self.copyWith(detail: value));
    });
  }

  /// Create a copy of TableDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InviteShareCopyWith<$Res>? get facilitatorInvite {
    if (_self.facilitatorInvite == null) {
      return null;
    }

    return $InviteShareCopyWith<$Res>(_self.facilitatorInvite!, (value) {
      return _then(_self.copyWith(facilitatorInvite: value));
    });
  }
}

/// Adds pattern-matching-related methods to [TableDetailState].
extension TableDetailStatePatterns on TableDetailState {
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
    TResult Function(_TableDetailState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TableDetailState() when $default != null:
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
    TResult Function(_TableDetailState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TableDetailState():
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
    TResult? Function(_TableDetailState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TableDetailState() when $default != null:
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
      TableDetailStatus status,
      TableDetail? detail,
      ApiException? error,
      bool working,
      TableNotice? notice,
      String? noticeName,
      ApiException? actionError,
      InviteShare? facilitatorInvite,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TableDetailState() when $default != null:
        return $default(
          _that.status,
          _that.detail,
          _that.error,
          _that.working,
          _that.notice,
          _that.noticeName,
          _that.actionError,
          _that.facilitatorInvite,
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
      TableDetailStatus status,
      TableDetail? detail,
      ApiException? error,
      bool working,
      TableNotice? notice,
      String? noticeName,
      ApiException? actionError,
      InviteShare? facilitatorInvite,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TableDetailState():
        return $default(
          _that.status,
          _that.detail,
          _that.error,
          _that.working,
          _that.notice,
          _that.noticeName,
          _that.actionError,
          _that.facilitatorInvite,
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
      TableDetailStatus status,
      TableDetail? detail,
      ApiException? error,
      bool working,
      TableNotice? notice,
      String? noticeName,
      ApiException? actionError,
      InviteShare? facilitatorInvite,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TableDetailState() when $default != null:
        return $default(
          _that.status,
          _that.detail,
          _that.error,
          _that.working,
          _that.notice,
          _that.noticeName,
          _that.actionError,
          _that.facilitatorInvite,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _TableDetailState implements TableDetailState {
  const _TableDetailState({
    this.status = TableDetailStatus.loading,
    this.detail,
    this.error,
    this.working = false,
    this.notice,
    this.noticeName,
    this.actionError,
    this.facilitatorInvite,
  });

  @override
  @JsonKey()
  final TableDetailStatus status;
  @override
  final TableDetail? detail;
  @override
  final ApiException? error;
  @override
  @JsonKey()
  final bool working;
  @override
  final TableNotice? notice;

  /// Name of the person the notice is about.
  @override
  final String? noticeName;
  @override
  final ApiException? actionError;
  @override
  final InviteShare? facilitatorInvite;

  /// Create a copy of TableDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TableDetailStateCopyWith<_TableDetailState> get copyWith =>
      __$TableDetailStateCopyWithImpl<_TableDetailState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TableDetailState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.detail, detail) || other.detail == detail) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.working, working) || other.working == working) &&
            (identical(other.notice, notice) || other.notice == notice) &&
            (identical(other.noticeName, noticeName) ||
                other.noticeName == noticeName) &&
            (identical(other.actionError, actionError) ||
                other.actionError == actionError) &&
            (identical(other.facilitatorInvite, facilitatorInvite) ||
                other.facilitatorInvite == facilitatorInvite));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    detail,
    error,
    working,
    notice,
    noticeName,
    actionError,
    facilitatorInvite,
  );

  @override
  String toString() {
    return 'TableDetailState(status: $status, detail: $detail, error: $error, working: $working, notice: $notice, noticeName: $noticeName, actionError: $actionError, facilitatorInvite: $facilitatorInvite)';
  }
}

/// @nodoc
abstract mixin class _$TableDetailStateCopyWith<$Res>
    implements $TableDetailStateCopyWith<$Res> {
  factory _$TableDetailStateCopyWith(
    _TableDetailState value,
    $Res Function(_TableDetailState) _then,
  ) = __$TableDetailStateCopyWithImpl;
  @override
  @useResult
  $Res call({
    TableDetailStatus status,
    TableDetail? detail,
    ApiException? error,
    bool working,
    TableNotice? notice,
    String? noticeName,
    ApiException? actionError,
    InviteShare? facilitatorInvite,
  });

  @override
  $TableDetailCopyWith<$Res>? get detail;
  @override
  $InviteShareCopyWith<$Res>? get facilitatorInvite;
}

/// @nodoc
class __$TableDetailStateCopyWithImpl<$Res>
    implements _$TableDetailStateCopyWith<$Res> {
  __$TableDetailStateCopyWithImpl(this._self, this._then);

  final _TableDetailState _self;
  final $Res Function(_TableDetailState) _then;

  /// Create a copy of TableDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? detail = freezed,
    Object? error = freezed,
    Object? working = null,
    Object? notice = freezed,
    Object? noticeName = freezed,
    Object? actionError = freezed,
    Object? facilitatorInvite = freezed,
  }) {
    return _then(
      _TableDetailState(
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as TableDetailStatus,
        detail: freezed == detail
            ? _self.detail
            : detail // ignore: cast_nullable_to_non_nullable
                  as TableDetail?,
        error: freezed == error
            ? _self.error
            : error // ignore: cast_nullable_to_non_nullable
                  as ApiException?,
        working: null == working
            ? _self.working
            : working // ignore: cast_nullable_to_non_nullable
                  as bool,
        notice: freezed == notice
            ? _self.notice
            : notice // ignore: cast_nullable_to_non_nullable
                  as TableNotice?,
        noticeName: freezed == noticeName
            ? _self.noticeName
            : noticeName // ignore: cast_nullable_to_non_nullable
                  as String?,
        actionError: freezed == actionError
            ? _self.actionError
            : actionError // ignore: cast_nullable_to_non_nullable
                  as ApiException?,
        facilitatorInvite: freezed == facilitatorInvite
            ? _self.facilitatorInvite
            : facilitatorInvite // ignore: cast_nullable_to_non_nullable
                  as InviteShare?,
      ),
    );
  }

  /// Create a copy of TableDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TableDetailCopyWith<$Res>? get detail {
    if (_self.detail == null) {
      return null;
    }

    return $TableDetailCopyWith<$Res>(_self.detail!, (value) {
      return _then(_self.copyWith(detail: value));
    });
  }

  /// Create a copy of TableDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InviteShareCopyWith<$Res>? get facilitatorInvite {
    if (_self.facilitatorInvite == null) {
      return null;
    }

    return $InviteShareCopyWith<$Res>(_self.facilitatorInvite!, (value) {
      return _then(_self.copyWith(facilitatorInvite: value));
    });
  }
}
