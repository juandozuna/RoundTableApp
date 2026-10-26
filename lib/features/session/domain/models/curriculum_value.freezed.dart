// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'curriculum_value.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CurriculumValue {
  String get id;
  String get name;

  /// Position in the whole program (1..48).
  int get sequence;

  /// Create a copy of CurriculumValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CurriculumValueCopyWith<CurriculumValue> get copyWith =>
      _$CurriculumValueCopyWithImpl<CurriculumValue>(
        this as CurriculumValue,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CurriculumValue &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.sequence, sequence) ||
                other.sequence == sequence));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, sequence);

  @override
  String toString() {
    return 'CurriculumValue(id: $id, name: $name, sequence: $sequence)';
  }
}

/// @nodoc
abstract mixin class $CurriculumValueCopyWith<$Res> {
  factory $CurriculumValueCopyWith(
    CurriculumValue value,
    $Res Function(CurriculumValue) _then,
  ) = _$CurriculumValueCopyWithImpl;
  @useResult
  $Res call({String id, String name, int sequence});
}

/// @nodoc
class _$CurriculumValueCopyWithImpl<$Res>
    implements $CurriculumValueCopyWith<$Res> {
  _$CurriculumValueCopyWithImpl(this._self, this._then);

  final CurriculumValue _self;
  final $Res Function(CurriculumValue) _then;

  /// Create a copy of CurriculumValue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? name = null, Object? sequence = null}) {
    return _then(
      _self.copyWith(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        sequence: null == sequence
            ? _self.sequence
            : sequence // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [CurriculumValue].
extension CurriculumValuePatterns on CurriculumValue {
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
    TResult Function(_CurriculumValue value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CurriculumValue() when $default != null:
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
    TResult Function(_CurriculumValue value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CurriculumValue():
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
    TResult? Function(_CurriculumValue value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CurriculumValue() when $default != null:
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
    TResult Function(String id, String name, int sequence)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _CurriculumValue() when $default != null:
        return $default(_that.id, _that.name, _that.sequence);
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
    TResult Function(String id, String name, int sequence) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CurriculumValue():
        return $default(_that.id, _that.name, _that.sequence);
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
    TResult? Function(String id, String name, int sequence)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _CurriculumValue() when $default != null:
        return $default(_that.id, _that.name, _that.sequence);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _CurriculumValue implements CurriculumValue {
  const _CurriculumValue({
    required this.id,
    required this.name,
    required this.sequence,
  });

  @override
  final String id;
  @override
  final String name;

  /// Position in the whole program (1..48).
  @override
  final int sequence;

  /// Create a copy of CurriculumValue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CurriculumValueCopyWith<_CurriculumValue> get copyWith =>
      __$CurriculumValueCopyWithImpl<_CurriculumValue>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CurriculumValue &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.sequence, sequence) ||
                other.sequence == sequence));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, sequence);

  @override
  String toString() {
    return 'CurriculumValue(id: $id, name: $name, sequence: $sequence)';
  }
}

/// @nodoc
abstract mixin class _$CurriculumValueCopyWith<$Res>
    implements $CurriculumValueCopyWith<$Res> {
  factory _$CurriculumValueCopyWith(
    _CurriculumValue value,
    $Res Function(_CurriculumValue) _then,
  ) = __$CurriculumValueCopyWithImpl;
  @override
  @useResult
  $Res call({String id, String name, int sequence});
}

/// @nodoc
class __$CurriculumValueCopyWithImpl<$Res>
    implements _$CurriculumValueCopyWith<$Res> {
  __$CurriculumValueCopyWithImpl(this._self, this._then);

  final _CurriculumValue _self;
  final $Res Function(_CurriculumValue) _then;

  /// Create a copy of CurriculumValue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? id = null, Object? name = null, Object? sequence = null}) {
    return _then(
      _CurriculumValue(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        sequence: null == sequence
            ? _self.sequence
            : sequence // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}
