// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invite_target_organization.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InviteTargetOrganization {
  String get id;
  String get name;

  /// Create a copy of InviteTargetOrganization
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InviteTargetOrganizationCopyWith<InviteTargetOrganization> get copyWith =>
      _$InviteTargetOrganizationCopyWithImpl<InviteTargetOrganization>(
        this as InviteTargetOrganization,
        _$identity,
      );

  /// Serializes this InviteTargetOrganization to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InviteTargetOrganization &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @override
  String toString() {
    return 'InviteTargetOrganization(id: $id, name: $name)';
  }
}

/// @nodoc
abstract mixin class $InviteTargetOrganizationCopyWith<$Res> {
  factory $InviteTargetOrganizationCopyWith(
    InviteTargetOrganization value,
    $Res Function(InviteTargetOrganization) _then,
  ) = _$InviteTargetOrganizationCopyWithImpl;
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class _$InviteTargetOrganizationCopyWithImpl<$Res>
    implements $InviteTargetOrganizationCopyWith<$Res> {
  _$InviteTargetOrganizationCopyWithImpl(this._self, this._then);

  final InviteTargetOrganization _self;
  final $Res Function(InviteTargetOrganization) _then;

  /// Create a copy of InviteTargetOrganization
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? name = null}) {
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
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [InviteTargetOrganization].
extension InviteTargetOrganizationPatterns on InviteTargetOrganization {
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
    TResult Function(_InviteTargetOrganization value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InviteTargetOrganization() when $default != null:
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
    TResult Function(_InviteTargetOrganization value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InviteTargetOrganization():
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
    TResult? Function(_InviteTargetOrganization value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InviteTargetOrganization() when $default != null:
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
    TResult Function(String id, String name)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InviteTargetOrganization() when $default != null:
        return $default(_that.id, _that.name);
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
    TResult Function(String id, String name) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InviteTargetOrganization():
        return $default(_that.id, _that.name);
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
    TResult? Function(String id, String name)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InviteTargetOrganization() when $default != null:
        return $default(_that.id, _that.name);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _InviteTargetOrganization implements InviteTargetOrganization {
  const _InviteTargetOrganization({required this.id, required this.name});
  factory _InviteTargetOrganization.fromJson(Map<String, dynamic> json) =>
      _$InviteTargetOrganizationFromJson(json);

  @override
  final String id;
  @override
  final String name;

  /// Create a copy of InviteTargetOrganization
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InviteTargetOrganizationCopyWith<_InviteTargetOrganization> get copyWith =>
      __$InviteTargetOrganizationCopyWithImpl<_InviteTargetOrganization>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$InviteTargetOrganizationToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InviteTargetOrganization &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @override
  String toString() {
    return 'InviteTargetOrganization(id: $id, name: $name)';
  }
}

/// @nodoc
abstract mixin class _$InviteTargetOrganizationCopyWith<$Res>
    implements $InviteTargetOrganizationCopyWith<$Res> {
  factory _$InviteTargetOrganizationCopyWith(
    _InviteTargetOrganization value,
    $Res Function(_InviteTargetOrganization) _then,
  ) = __$InviteTargetOrganizationCopyWithImpl;
  @override
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class __$InviteTargetOrganizationCopyWithImpl<$Res>
    implements _$InviteTargetOrganizationCopyWith<$Res> {
  __$InviteTargetOrganizationCopyWithImpl(this._self, this._then);

  final _InviteTargetOrganization _self;
  final $Res Function(_InviteTargetOrganization) _then;

  /// Create a copy of InviteTargetOrganization
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? id = null, Object? name = null}) {
    return _then(
      _InviteTargetOrganization(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}
