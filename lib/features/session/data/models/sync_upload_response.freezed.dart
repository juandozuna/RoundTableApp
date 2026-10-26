// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sync_upload_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SyncUploadResponse {
  int get applied;
  int get rejected;
  List<SyncUploadResult> get results;

  /// Create a copy of SyncUploadResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SyncUploadResponseCopyWith<SyncUploadResponse> get copyWith =>
      _$SyncUploadResponseCopyWithImpl<SyncUploadResponse>(
        this as SyncUploadResponse,
        _$identity,
      );

  /// Serializes this SyncUploadResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SyncUploadResponse &&
            (identical(other.applied, applied) || other.applied == applied) &&
            (identical(other.rejected, rejected) ||
                other.rejected == rejected) &&
            const DeepCollectionEquality().equals(other.results, results));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    applied,
    rejected,
    const DeepCollectionEquality().hash(results),
  );

  @override
  String toString() {
    return 'SyncUploadResponse(applied: $applied, rejected: $rejected, results: $results)';
  }
}

/// @nodoc
abstract mixin class $SyncUploadResponseCopyWith<$Res> {
  factory $SyncUploadResponseCopyWith(
    SyncUploadResponse value,
    $Res Function(SyncUploadResponse) _then,
  ) = _$SyncUploadResponseCopyWithImpl;
  @useResult
  $Res call({int applied, int rejected, List<SyncUploadResult> results});
}

/// @nodoc
class _$SyncUploadResponseCopyWithImpl<$Res>
    implements $SyncUploadResponseCopyWith<$Res> {
  _$SyncUploadResponseCopyWithImpl(this._self, this._then);

  final SyncUploadResponse _self;
  final $Res Function(SyncUploadResponse) _then;

  /// Create a copy of SyncUploadResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? applied = null,
    Object? rejected = null,
    Object? results = null,
  }) {
    return _then(
      _self.copyWith(
        applied: null == applied
            ? _self.applied
            : applied // ignore: cast_nullable_to_non_nullable
                  as int,
        rejected: null == rejected
            ? _self.rejected
            : rejected // ignore: cast_nullable_to_non_nullable
                  as int,
        results: null == results
            ? _self.results
            : results // ignore: cast_nullable_to_non_nullable
                  as List<SyncUploadResult>,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [SyncUploadResponse].
extension SyncUploadResponsePatterns on SyncUploadResponse {
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
    TResult Function(_SyncUploadResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SyncUploadResponse() when $default != null:
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
    TResult Function(_SyncUploadResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SyncUploadResponse():
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
    TResult? Function(_SyncUploadResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SyncUploadResponse() when $default != null:
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
    TResult Function(int applied, int rejected, List<SyncUploadResult> results)?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SyncUploadResponse() when $default != null:
        return $default(_that.applied, _that.rejected, _that.results);
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
    TResult Function(int applied, int rejected, List<SyncUploadResult> results)
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SyncUploadResponse():
        return $default(_that.applied, _that.rejected, _that.results);
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
      int applied,
      int rejected,
      List<SyncUploadResult> results,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SyncUploadResponse() when $default != null:
        return $default(_that.applied, _that.rejected, _that.results);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SyncUploadResponse implements SyncUploadResponse {
  const _SyncUploadResponse({
    this.applied = 0,
    this.rejected = 0,
    final List<SyncUploadResult> results = const [],
  }) : _results = results;
  factory _SyncUploadResponse.fromJson(Map<String, dynamic> json) =>
      _$SyncUploadResponseFromJson(json);

  @override
  @JsonKey()
  final int applied;
  @override
  @JsonKey()
  final int rejected;
  final List<SyncUploadResult> _results;
  @override
  @JsonKey()
  List<SyncUploadResult> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  /// Create a copy of SyncUploadResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SyncUploadResponseCopyWith<_SyncUploadResponse> get copyWith =>
      __$SyncUploadResponseCopyWithImpl<_SyncUploadResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SyncUploadResponseToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SyncUploadResponse &&
            (identical(other.applied, applied) || other.applied == applied) &&
            (identical(other.rejected, rejected) ||
                other.rejected == rejected) &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    applied,
    rejected,
    const DeepCollectionEquality().hash(_results),
  );

  @override
  String toString() {
    return 'SyncUploadResponse(applied: $applied, rejected: $rejected, results: $results)';
  }
}

/// @nodoc
abstract mixin class _$SyncUploadResponseCopyWith<$Res>
    implements $SyncUploadResponseCopyWith<$Res> {
  factory _$SyncUploadResponseCopyWith(
    _SyncUploadResponse value,
    $Res Function(_SyncUploadResponse) _then,
  ) = __$SyncUploadResponseCopyWithImpl;
  @override
  @useResult
  $Res call({int applied, int rejected, List<SyncUploadResult> results});
}

/// @nodoc
class __$SyncUploadResponseCopyWithImpl<$Res>
    implements _$SyncUploadResponseCopyWith<$Res> {
  __$SyncUploadResponseCopyWithImpl(this._self, this._then);

  final _SyncUploadResponse _self;
  final $Res Function(_SyncUploadResponse) _then;

  /// Create a copy of SyncUploadResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? applied = null,
    Object? rejected = null,
    Object? results = null,
  }) {
    return _then(
      _SyncUploadResponse(
        applied: null == applied
            ? _self.applied
            : applied // ignore: cast_nullable_to_non_nullable
                  as int,
        rejected: null == rejected
            ? _self.rejected
            : rejected // ignore: cast_nullable_to_non_nullable
                  as int,
        results: null == results
            ? _self._results
            : results // ignore: cast_nullable_to_non_nullable
                  as List<SyncUploadResult>,
      ),
    );
  }
}

/// @nodoc
mixin _$SyncUploadResult {
  String get status;
  String? get id;
  String? get table;
  String? get op;
  String? get code;
  String? get message;

  /// Create a copy of SyncUploadResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SyncUploadResultCopyWith<SyncUploadResult> get copyWith =>
      _$SyncUploadResultCopyWithImpl<SyncUploadResult>(
        this as SyncUploadResult,
        _$identity,
      );

  /// Serializes this SyncUploadResult to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SyncUploadResult &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.table, table) || other.table == table) &&
            (identical(other.op, op) || other.op == op) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, status, id, table, op, code, message);

  @override
  String toString() {
    return 'SyncUploadResult(status: $status, id: $id, table: $table, op: $op, code: $code, message: $message)';
  }
}

/// @nodoc
abstract mixin class $SyncUploadResultCopyWith<$Res> {
  factory $SyncUploadResultCopyWith(
    SyncUploadResult value,
    $Res Function(SyncUploadResult) _then,
  ) = _$SyncUploadResultCopyWithImpl;
  @useResult
  $Res call({
    String status,
    String? id,
    String? table,
    String? op,
    String? code,
    String? message,
  });
}

/// @nodoc
class _$SyncUploadResultCopyWithImpl<$Res>
    implements $SyncUploadResultCopyWith<$Res> {
  _$SyncUploadResultCopyWithImpl(this._self, this._then);

  final SyncUploadResult _self;
  final $Res Function(SyncUploadResult) _then;

  /// Create a copy of SyncUploadResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? id = freezed,
    Object? table = freezed,
    Object? op = freezed,
    Object? code = freezed,
    Object? message = freezed,
  }) {
    return _then(
      _self.copyWith(
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        id: freezed == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        table: freezed == table
            ? _self.table
            : table // ignore: cast_nullable_to_non_nullable
                  as String?,
        op: freezed == op
            ? _self.op
            : op // ignore: cast_nullable_to_non_nullable
                  as String?,
        code: freezed == code
            ? _self.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String?,
        message: freezed == message
            ? _self.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [SyncUploadResult].
extension SyncUploadResultPatterns on SyncUploadResult {
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
    TResult Function(_SyncUploadResult value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SyncUploadResult() when $default != null:
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
    TResult Function(_SyncUploadResult value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SyncUploadResult():
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
    TResult? Function(_SyncUploadResult value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SyncUploadResult() when $default != null:
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
      String status,
      String? id,
      String? table,
      String? op,
      String? code,
      String? message,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SyncUploadResult() when $default != null:
        return $default(
          _that.status,
          _that.id,
          _that.table,
          _that.op,
          _that.code,
          _that.message,
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
      String status,
      String? id,
      String? table,
      String? op,
      String? code,
      String? message,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SyncUploadResult():
        return $default(
          _that.status,
          _that.id,
          _that.table,
          _that.op,
          _that.code,
          _that.message,
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
      String status,
      String? id,
      String? table,
      String? op,
      String? code,
      String? message,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SyncUploadResult() when $default != null:
        return $default(
          _that.status,
          _that.id,
          _that.table,
          _that.op,
          _that.code,
          _that.message,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SyncUploadResult extends SyncUploadResult {
  const _SyncUploadResult({
    required this.status,
    this.id,
    this.table,
    this.op,
    this.code,
    this.message,
  }) : super._();
  factory _SyncUploadResult.fromJson(Map<String, dynamic> json) =>
      _$SyncUploadResultFromJson(json);

  @override
  final String status;
  @override
  final String? id;
  @override
  final String? table;
  @override
  final String? op;
  @override
  final String? code;
  @override
  final String? message;

  /// Create a copy of SyncUploadResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SyncUploadResultCopyWith<_SyncUploadResult> get copyWith =>
      __$SyncUploadResultCopyWithImpl<_SyncUploadResult>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SyncUploadResultToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SyncUploadResult &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.table, table) || other.table == table) &&
            (identical(other.op, op) || other.op == op) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, status, id, table, op, code, message);

  @override
  String toString() {
    return 'SyncUploadResult(status: $status, id: $id, table: $table, op: $op, code: $code, message: $message)';
  }
}

/// @nodoc
abstract mixin class _$SyncUploadResultCopyWith<$Res>
    implements $SyncUploadResultCopyWith<$Res> {
  factory _$SyncUploadResultCopyWith(
    _SyncUploadResult value,
    $Res Function(_SyncUploadResult) _then,
  ) = __$SyncUploadResultCopyWithImpl;
  @override
  @useResult
  $Res call({
    String status,
    String? id,
    String? table,
    String? op,
    String? code,
    String? message,
  });
}

/// @nodoc
class __$SyncUploadResultCopyWithImpl<$Res>
    implements _$SyncUploadResultCopyWith<$Res> {
  __$SyncUploadResultCopyWithImpl(this._self, this._then);

  final _SyncUploadResult _self;
  final $Res Function(_SyncUploadResult) _then;

  /// Create a copy of SyncUploadResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? id = freezed,
    Object? table = freezed,
    Object? op = freezed,
    Object? code = freezed,
    Object? message = freezed,
  }) {
    return _then(
      _SyncUploadResult(
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        id: freezed == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String?,
        table: freezed == table
            ? _self.table
            : table // ignore: cast_nullable_to_non_nullable
                  as String?,
        op: freezed == op
            ? _self.op
            : op // ignore: cast_nullable_to_non_nullable
                  as String?,
        code: freezed == code
            ? _self.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String?,
        message: freezed == message
            ? _self.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}
