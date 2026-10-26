// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'progress_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProgressState {
  ProgressStatus get status;
  MemberHistory? get member;
  TableHistory? get table;
  Object? get error;
  bool get online;

  /// Create a copy of ProgressState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProgressStateCopyWith<ProgressState> get copyWith =>
      _$ProgressStateCopyWithImpl<ProgressState>(
        this as ProgressState,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProgressState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.member, member) || other.member == member) &&
            (identical(other.table, table) || other.table == table) &&
            const DeepCollectionEquality().equals(other.error, error) &&
            (identical(other.online, online) || other.online == online));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    member,
    table,
    const DeepCollectionEquality().hash(error),
    online,
  );

  @override
  String toString() {
    return 'ProgressState(status: $status, member: $member, table: $table, error: $error, online: $online)';
  }
}

/// @nodoc
abstract mixin class $ProgressStateCopyWith<$Res> {
  factory $ProgressStateCopyWith(
    ProgressState value,
    $Res Function(ProgressState) _then,
  ) = _$ProgressStateCopyWithImpl;
  @useResult
  $Res call({
    ProgressStatus status,
    MemberHistory? member,
    TableHistory? table,
    Object? error,
    bool online,
  });

  $MemberHistoryCopyWith<$Res>? get member;
  $TableHistoryCopyWith<$Res>? get table;
}

/// @nodoc
class _$ProgressStateCopyWithImpl<$Res>
    implements $ProgressStateCopyWith<$Res> {
  _$ProgressStateCopyWithImpl(this._self, this._then);

  final ProgressState _self;
  final $Res Function(ProgressState) _then;

  /// Create a copy of ProgressState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? member = freezed,
    Object? table = freezed,
    Object? error = freezed,
    Object? online = null,
  }) {
    return _then(
      _self.copyWith(
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as ProgressStatus,
        member: freezed == member
            ? _self.member
            : member // ignore: cast_nullable_to_non_nullable
                  as MemberHistory?,
        table: freezed == table
            ? _self.table
            : table // ignore: cast_nullable_to_non_nullable
                  as TableHistory?,
        error: freezed == error ? _self.error : error,
        online: null == online
            ? _self.online
            : online // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }

  /// Create a copy of ProgressState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MemberHistoryCopyWith<$Res>? get member {
    if (_self.member == null) {
      return null;
    }

    return $MemberHistoryCopyWith<$Res>(_self.member!, (value) {
      return _then(_self.copyWith(member: value));
    });
  }

  /// Create a copy of ProgressState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TableHistoryCopyWith<$Res>? get table {
    if (_self.table == null) {
      return null;
    }

    return $TableHistoryCopyWith<$Res>(_self.table!, (value) {
      return _then(_self.copyWith(table: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ProgressState].
extension ProgressStatePatterns on ProgressState {
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
    TResult Function(_ProgressState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProgressState() when $default != null:
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
    TResult Function(_ProgressState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProgressState():
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
    TResult? Function(_ProgressState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProgressState() when $default != null:
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
      ProgressStatus status,
      MemberHistory? member,
      TableHistory? table,
      Object? error,
      bool online,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ProgressState() when $default != null:
        return $default(
          _that.status,
          _that.member,
          _that.table,
          _that.error,
          _that.online,
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
      ProgressStatus status,
      MemberHistory? member,
      TableHistory? table,
      Object? error,
      bool online,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProgressState():
        return $default(
          _that.status,
          _that.member,
          _that.table,
          _that.error,
          _that.online,
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
      ProgressStatus status,
      MemberHistory? member,
      TableHistory? table,
      Object? error,
      bool online,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ProgressState() when $default != null:
        return $default(
          _that.status,
          _that.member,
          _that.table,
          _that.error,
          _that.online,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ProgressState implements ProgressState {
  const _ProgressState({
    this.status = ProgressStatus.loading,
    this.member,
    this.table,
    this.error,
    this.online = true,
  });

  @override
  @JsonKey()
  final ProgressStatus status;
  @override
  final MemberHistory? member;
  @override
  final TableHistory? table;
  @override
  final Object? error;
  @override
  @JsonKey()
  final bool online;

  /// Create a copy of ProgressState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProgressStateCopyWith<_ProgressState> get copyWith =>
      __$ProgressStateCopyWithImpl<_ProgressState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProgressState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.member, member) || other.member == member) &&
            (identical(other.table, table) || other.table == table) &&
            const DeepCollectionEquality().equals(other.error, error) &&
            (identical(other.online, online) || other.online == online));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    member,
    table,
    const DeepCollectionEquality().hash(error),
    online,
  );

  @override
  String toString() {
    return 'ProgressState(status: $status, member: $member, table: $table, error: $error, online: $online)';
  }
}

/// @nodoc
abstract mixin class _$ProgressStateCopyWith<$Res>
    implements $ProgressStateCopyWith<$Res> {
  factory _$ProgressStateCopyWith(
    _ProgressState value,
    $Res Function(_ProgressState) _then,
  ) = __$ProgressStateCopyWithImpl;
  @override
  @useResult
  $Res call({
    ProgressStatus status,
    MemberHistory? member,
    TableHistory? table,
    Object? error,
    bool online,
  });

  @override
  $MemberHistoryCopyWith<$Res>? get member;
  @override
  $TableHistoryCopyWith<$Res>? get table;
}

/// @nodoc
class __$ProgressStateCopyWithImpl<$Res>
    implements _$ProgressStateCopyWith<$Res> {
  __$ProgressStateCopyWithImpl(this._self, this._then);

  final _ProgressState _self;
  final $Res Function(_ProgressState) _then;

  /// Create a copy of ProgressState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? member = freezed,
    Object? table = freezed,
    Object? error = freezed,
    Object? online = null,
  }) {
    return _then(
      _ProgressState(
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as ProgressStatus,
        member: freezed == member
            ? _self.member
            : member // ignore: cast_nullable_to_non_nullable
                  as MemberHistory?,
        table: freezed == table
            ? _self.table
            : table // ignore: cast_nullable_to_non_nullable
                  as TableHistory?,
        error: freezed == error ? _self.error : error,
        online: null == online
            ? _self.online
            : online // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }

  /// Create a copy of ProgressState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MemberHistoryCopyWith<$Res>? get member {
    if (_self.member == null) {
      return null;
    }

    return $MemberHistoryCopyWith<$Res>(_self.member!, (value) {
      return _then(_self.copyWith(member: value));
    });
  }

  /// Create a copy of ProgressState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TableHistoryCopyWith<$Res>? get table {
    if (_self.table == null) {
      return null;
    }

    return $TableHistoryCopyWith<$Res>(_self.table!, (value) {
      return _then(_self.copyWith(table: value));
    });
  }
}
