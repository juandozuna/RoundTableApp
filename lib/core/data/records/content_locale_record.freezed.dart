// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'content_locale_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ContentLocaleRecord {
  String get id;
  String get code;
  String get name;
  bool get isDefault;
  String get status;

  /// Create a copy of ContentLocaleRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ContentLocaleRecordCopyWith<ContentLocaleRecord> get copyWith =>
      _$ContentLocaleRecordCopyWithImpl<ContentLocaleRecord>(
        this as ContentLocaleRecord,
        _$identity,
      );

  /// Serializes this ContentLocaleRecord to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ContentLocaleRecord &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, code, name, isDefault, status);

  @override
  String toString() {
    return 'ContentLocaleRecord(id: $id, code: $code, name: $name, isDefault: $isDefault, status: $status)';
  }
}

/// @nodoc
abstract mixin class $ContentLocaleRecordCopyWith<$Res> {
  factory $ContentLocaleRecordCopyWith(
    ContentLocaleRecord value,
    $Res Function(ContentLocaleRecord) _then,
  ) = _$ContentLocaleRecordCopyWithImpl;
  @useResult
  $Res call({
    String id,
    String code,
    String name,
    bool isDefault,
    String status,
  });
}

/// @nodoc
class _$ContentLocaleRecordCopyWithImpl<$Res>
    implements $ContentLocaleRecordCopyWith<$Res> {
  _$ContentLocaleRecordCopyWithImpl(this._self, this._then);

  final ContentLocaleRecord _self;
  final $Res Function(ContentLocaleRecord) _then;

  /// Create a copy of ContentLocaleRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? name = null,
    Object? isDefault = null,
    Object? status = null,
  }) {
    return _then(
      _self.copyWith(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        code: null == code
            ? _self.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        isDefault: null == isDefault
            ? _self.isDefault
            : isDefault // ignore: cast_nullable_to_non_nullable
                  as bool,
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [ContentLocaleRecord].
extension ContentLocaleRecordPatterns on ContentLocaleRecord {
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
    TResult Function(_ContentLocaleRecord value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ContentLocaleRecord() when $default != null:
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
    TResult Function(_ContentLocaleRecord value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ContentLocaleRecord():
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
    TResult? Function(_ContentLocaleRecord value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ContentLocaleRecord() when $default != null:
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
      String id,
      String code,
      String name,
      bool isDefault,
      String status,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ContentLocaleRecord() when $default != null:
        return $default(
          _that.id,
          _that.code,
          _that.name,
          _that.isDefault,
          _that.status,
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
      String id,
      String code,
      String name,
      bool isDefault,
      String status,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ContentLocaleRecord():
        return $default(
          _that.id,
          _that.code,
          _that.name,
          _that.isDefault,
          _that.status,
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
      String id,
      String code,
      String name,
      bool isDefault,
      String status,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ContentLocaleRecord() when $default != null:
        return $default(
          _that.id,
          _that.code,
          _that.name,
          _that.isDefault,
          _that.status,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ContentLocaleRecord implements ContentLocaleRecord {
  const _ContentLocaleRecord({
    required this.id,
    required this.code,
    required this.name,
    required this.isDefault,
    required this.status,
  });
  factory _ContentLocaleRecord.fromJson(Map<String, dynamic> json) =>
      _$ContentLocaleRecordFromJson(json);

  @override
  final String id;
  @override
  final String code;
  @override
  final String name;
  @override
  final bool isDefault;
  @override
  final String status;

  /// Create a copy of ContentLocaleRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ContentLocaleRecordCopyWith<_ContentLocaleRecord> get copyWith =>
      __$ContentLocaleRecordCopyWithImpl<_ContentLocaleRecord>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$ContentLocaleRecordToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ContentLocaleRecord &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, code, name, isDefault, status);

  @override
  String toString() {
    return 'ContentLocaleRecord(id: $id, code: $code, name: $name, isDefault: $isDefault, status: $status)';
  }
}

/// @nodoc
abstract mixin class _$ContentLocaleRecordCopyWith<$Res>
    implements $ContentLocaleRecordCopyWith<$Res> {
  factory _$ContentLocaleRecordCopyWith(
    _ContentLocaleRecord value,
    $Res Function(_ContentLocaleRecord) _then,
  ) = __$ContentLocaleRecordCopyWithImpl;
  @override
  @useResult
  $Res call({
    String id,
    String code,
    String name,
    bool isDefault,
    String status,
  });
}

/// @nodoc
class __$ContentLocaleRecordCopyWithImpl<$Res>
    implements _$ContentLocaleRecordCopyWith<$Res> {
  __$ContentLocaleRecordCopyWithImpl(this._self, this._then);

  final _ContentLocaleRecord _self;
  final $Res Function(_ContentLocaleRecord) _then;

  /// Create a copy of ContentLocaleRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? code = null,
    Object? name = null,
    Object? isDefault = null,
    Object? status = null,
  }) {
    return _then(
      _ContentLocaleRecord(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        code: null == code
            ? _self.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        isDefault: null == isDefault
            ? _self.isDefault
            : isDefault // ignore: cast_nullable_to_non_nullable
                  as bool,
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}
