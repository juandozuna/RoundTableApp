// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'person_draft.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PersonDraft {
  String get firstName;
  String get lastName;
  String? get position;
  String? get email;

  /// E.164, unverified.
  String? get phone;

  /// Create a copy of PersonDraft
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PersonDraftCopyWith<PersonDraft> get copyWith =>
      _$PersonDraftCopyWithImpl<PersonDraft>(this as PersonDraft, _$identity);

  /// Serializes this PersonDraft to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PersonDraft &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, firstName, lastName, position, email, phone);

  @override
  String toString() {
    return 'PersonDraft(firstName: $firstName, lastName: $lastName, position: $position, email: $email, phone: $phone)';
  }
}

/// @nodoc
abstract mixin class $PersonDraftCopyWith<$Res> {
  factory $PersonDraftCopyWith(
    PersonDraft value,
    $Res Function(PersonDraft) _then,
  ) = _$PersonDraftCopyWithImpl;
  @useResult
  $Res call({
    String firstName,
    String lastName,
    String? position,
    String? email,
    String? phone,
  });
}

/// @nodoc
class _$PersonDraftCopyWithImpl<$Res> implements $PersonDraftCopyWith<$Res> {
  _$PersonDraftCopyWithImpl(this._self, this._then);

  final PersonDraft _self;
  final $Res Function(PersonDraft) _then;

  /// Create a copy of PersonDraft
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? position = freezed,
    Object? email = freezed,
    Object? phone = freezed,
  }) {
    return _then(
      _self.copyWith(
        firstName: null == firstName
            ? _self.firstName
            : firstName // ignore: cast_nullable_to_non_nullable
                  as String,
        lastName: null == lastName
            ? _self.lastName
            : lastName // ignore: cast_nullable_to_non_nullable
                  as String,
        position: freezed == position
            ? _self.position
            : position // ignore: cast_nullable_to_non_nullable
                  as String?,
        email: freezed == email
            ? _self.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String?,
        phone: freezed == phone
            ? _self.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [PersonDraft].
extension PersonDraftPatterns on PersonDraft {
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
    TResult Function(_PersonDraft value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PersonDraft() when $default != null:
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
    TResult Function(_PersonDraft value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PersonDraft():
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
    TResult? Function(_PersonDraft value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PersonDraft() when $default != null:
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
      String firstName,
      String lastName,
      String? position,
      String? email,
      String? phone,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PersonDraft() when $default != null:
        return $default(
          _that.firstName,
          _that.lastName,
          _that.position,
          _that.email,
          _that.phone,
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
      String firstName,
      String lastName,
      String? position,
      String? email,
      String? phone,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PersonDraft():
        return $default(
          _that.firstName,
          _that.lastName,
          _that.position,
          _that.email,
          _that.phone,
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
      String firstName,
      String lastName,
      String? position,
      String? email,
      String? phone,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PersonDraft() when $default != null:
        return $default(
          _that.firstName,
          _that.lastName,
          _that.position,
          _that.email,
          _that.phone,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PersonDraft implements PersonDraft {
  const _PersonDraft({
    required this.firstName,
    required this.lastName,
    this.position,
    this.email,
    this.phone,
  });
  factory _PersonDraft.fromJson(Map<String, dynamic> json) =>
      _$PersonDraftFromJson(json);

  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String? position;
  @override
  final String? email;

  /// E.164, unverified.
  @override
  final String? phone;

  /// Create a copy of PersonDraft
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PersonDraftCopyWith<_PersonDraft> get copyWith =>
      __$PersonDraftCopyWithImpl<_PersonDraft>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PersonDraftToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PersonDraft &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, firstName, lastName, position, email, phone);

  @override
  String toString() {
    return 'PersonDraft(firstName: $firstName, lastName: $lastName, position: $position, email: $email, phone: $phone)';
  }
}

/// @nodoc
abstract mixin class _$PersonDraftCopyWith<$Res>
    implements $PersonDraftCopyWith<$Res> {
  factory _$PersonDraftCopyWith(
    _PersonDraft value,
    $Res Function(_PersonDraft) _then,
  ) = __$PersonDraftCopyWithImpl;
  @override
  @useResult
  $Res call({
    String firstName,
    String lastName,
    String? position,
    String? email,
    String? phone,
  });
}

/// @nodoc
class __$PersonDraftCopyWithImpl<$Res> implements _$PersonDraftCopyWith<$Res> {
  __$PersonDraftCopyWithImpl(this._self, this._then);

  final _PersonDraft _self;
  final $Res Function(_PersonDraft) _then;

  /// Create a copy of PersonDraft
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? position = freezed,
    Object? email = freezed,
    Object? phone = freezed,
  }) {
    return _then(
      _PersonDraft(
        firstName: null == firstName
            ? _self.firstName
            : firstName // ignore: cast_nullable_to_non_nullable
                  as String,
        lastName: null == lastName
            ? _self.lastName
            : lastName // ignore: cast_nullable_to_non_nullable
                  as String,
        position: freezed == position
            ? _self.position
            : position // ignore: cast_nullable_to_non_nullable
                  as String?,
        email: freezed == email
            ? _self.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String?,
        phone: freezed == phone
            ? _self.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}
