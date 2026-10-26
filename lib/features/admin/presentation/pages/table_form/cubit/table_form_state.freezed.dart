// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'table_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TableFormState {
  TableFormStatus get status;
  TableFormData get data;

  /// Organization whose locations and people are offered.
  String? get organizationId;
  ApiException? get error;
  String? get savedTableId;
  InviteShare? get facilitatorInvite;

  /// Create a copy of TableFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TableFormStateCopyWith<TableFormState> get copyWith =>
      _$TableFormStateCopyWithImpl<TableFormState>(
        this as TableFormState,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TableFormState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.savedTableId, savedTableId) ||
                other.savedTableId == savedTableId) &&
            (identical(other.facilitatorInvite, facilitatorInvite) ||
                other.facilitatorInvite == facilitatorInvite));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    data,
    organizationId,
    error,
    savedTableId,
    facilitatorInvite,
  );

  @override
  String toString() {
    return 'TableFormState(status: $status, data: $data, organizationId: $organizationId, error: $error, savedTableId: $savedTableId, facilitatorInvite: $facilitatorInvite)';
  }
}

/// @nodoc
abstract mixin class $TableFormStateCopyWith<$Res> {
  factory $TableFormStateCopyWith(
    TableFormState value,
    $Res Function(TableFormState) _then,
  ) = _$TableFormStateCopyWithImpl;
  @useResult
  $Res call({
    TableFormStatus status,
    TableFormData data,
    String? organizationId,
    ApiException? error,
    String? savedTableId,
    InviteShare? facilitatorInvite,
  });

  $TableFormDataCopyWith<$Res> get data;
  $InviteShareCopyWith<$Res>? get facilitatorInvite;
}

/// @nodoc
class _$TableFormStateCopyWithImpl<$Res>
    implements $TableFormStateCopyWith<$Res> {
  _$TableFormStateCopyWithImpl(this._self, this._then);

  final TableFormState _self;
  final $Res Function(TableFormState) _then;

  /// Create a copy of TableFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? data = null,
    Object? organizationId = freezed,
    Object? error = freezed,
    Object? savedTableId = freezed,
    Object? facilitatorInvite = freezed,
  }) {
    return _then(
      _self.copyWith(
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as TableFormStatus,
        data: null == data
            ? _self.data
            : data // ignore: cast_nullable_to_non_nullable
                  as TableFormData,
        organizationId: freezed == organizationId
            ? _self.organizationId
            : organizationId // ignore: cast_nullable_to_non_nullable
                  as String?,
        error: freezed == error
            ? _self.error
            : error // ignore: cast_nullable_to_non_nullable
                  as ApiException?,
        savedTableId: freezed == savedTableId
            ? _self.savedTableId
            : savedTableId // ignore: cast_nullable_to_non_nullable
                  as String?,
        facilitatorInvite: freezed == facilitatorInvite
            ? _self.facilitatorInvite
            : facilitatorInvite // ignore: cast_nullable_to_non_nullable
                  as InviteShare?,
      ),
    );
  }

  /// Create a copy of TableFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TableFormDataCopyWith<$Res> get data {
    return $TableFormDataCopyWith<$Res>(_self.data, (value) {
      return _then(_self.copyWith(data: value));
    });
  }

  /// Create a copy of TableFormState
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

/// Adds pattern-matching-related methods to [TableFormState].
extension TableFormStatePatterns on TableFormState {
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
    TResult Function(_TableFormState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TableFormState() when $default != null:
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
    TResult Function(_TableFormState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TableFormState():
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
    TResult? Function(_TableFormState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TableFormState() when $default != null:
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
      TableFormStatus status,
      TableFormData data,
      String? organizationId,
      ApiException? error,
      String? savedTableId,
      InviteShare? facilitatorInvite,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TableFormState() when $default != null:
        return $default(
          _that.status,
          _that.data,
          _that.organizationId,
          _that.error,
          _that.savedTableId,
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
      TableFormStatus status,
      TableFormData data,
      String? organizationId,
      ApiException? error,
      String? savedTableId,
      InviteShare? facilitatorInvite,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TableFormState():
        return $default(
          _that.status,
          _that.data,
          _that.organizationId,
          _that.error,
          _that.savedTableId,
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
      TableFormStatus status,
      TableFormData data,
      String? organizationId,
      ApiException? error,
      String? savedTableId,
      InviteShare? facilitatorInvite,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TableFormState() when $default != null:
        return $default(
          _that.status,
          _that.data,
          _that.organizationId,
          _that.error,
          _that.savedTableId,
          _that.facilitatorInvite,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _TableFormState implements TableFormState {
  const _TableFormState({
    this.status = TableFormStatus.loading,
    this.data = const TableFormData(),
    this.organizationId,
    this.error,
    this.savedTableId,
    this.facilitatorInvite,
  });

  @override
  @JsonKey()
  final TableFormStatus status;
  @override
  @JsonKey()
  final TableFormData data;

  /// Organization whose locations and people are offered.
  @override
  final String? organizationId;
  @override
  final ApiException? error;
  @override
  final String? savedTableId;
  @override
  final InviteShare? facilitatorInvite;

  /// Create a copy of TableFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TableFormStateCopyWith<_TableFormState> get copyWith =>
      __$TableFormStateCopyWithImpl<_TableFormState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TableFormState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.savedTableId, savedTableId) ||
                other.savedTableId == savedTableId) &&
            (identical(other.facilitatorInvite, facilitatorInvite) ||
                other.facilitatorInvite == facilitatorInvite));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    data,
    organizationId,
    error,
    savedTableId,
    facilitatorInvite,
  );

  @override
  String toString() {
    return 'TableFormState(status: $status, data: $data, organizationId: $organizationId, error: $error, savedTableId: $savedTableId, facilitatorInvite: $facilitatorInvite)';
  }
}

/// @nodoc
abstract mixin class _$TableFormStateCopyWith<$Res>
    implements $TableFormStateCopyWith<$Res> {
  factory _$TableFormStateCopyWith(
    _TableFormState value,
    $Res Function(_TableFormState) _then,
  ) = __$TableFormStateCopyWithImpl;
  @override
  @useResult
  $Res call({
    TableFormStatus status,
    TableFormData data,
    String? organizationId,
    ApiException? error,
    String? savedTableId,
    InviteShare? facilitatorInvite,
  });

  @override
  $TableFormDataCopyWith<$Res> get data;
  @override
  $InviteShareCopyWith<$Res>? get facilitatorInvite;
}

/// @nodoc
class __$TableFormStateCopyWithImpl<$Res>
    implements _$TableFormStateCopyWith<$Res> {
  __$TableFormStateCopyWithImpl(this._self, this._then);

  final _TableFormState _self;
  final $Res Function(_TableFormState) _then;

  /// Create a copy of TableFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? data = null,
    Object? organizationId = freezed,
    Object? error = freezed,
    Object? savedTableId = freezed,
    Object? facilitatorInvite = freezed,
  }) {
    return _then(
      _TableFormState(
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as TableFormStatus,
        data: null == data
            ? _self.data
            : data // ignore: cast_nullable_to_non_nullable
                  as TableFormData,
        organizationId: freezed == organizationId
            ? _self.organizationId
            : organizationId // ignore: cast_nullable_to_non_nullable
                  as String?,
        error: freezed == error
            ? _self.error
            : error // ignore: cast_nullable_to_non_nullable
                  as ApiException?,
        savedTableId: freezed == savedTableId
            ? _self.savedTableId
            : savedTableId // ignore: cast_nullable_to_non_nullable
                  as String?,
        facilitatorInvite: freezed == facilitatorInvite
            ? _self.facilitatorInvite
            : facilitatorInvite // ignore: cast_nullable_to_non_nullable
                  as InviteShare?,
      ),
    );
  }

  /// Create a copy of TableFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TableFormDataCopyWith<$Res> get data {
    return $TableFormDataCopyWith<$Res>(_self.data, (value) {
      return _then(_self.copyWith(data: value));
    });
  }

  /// Create a copy of TableFormState
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
