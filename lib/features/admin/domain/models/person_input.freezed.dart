// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'person_input.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PersonInput {
  String get firstName;
  String get lastName;
  String? get position;
  String? get email;
  String? get phone;

  /// Create a copy of PersonInput
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PersonInputCopyWith<PersonInput> get copyWith =>
      _$PersonInputCopyWithImpl<PersonInput>(this as PersonInput, _$identity);

  /// Serializes this PersonInput to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PersonInput &&
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
    return 'PersonInput(firstName: $firstName, lastName: $lastName, position: $position, email: $email, phone: $phone)';
  }
}

/// @nodoc
abstract mixin class $PersonInputCopyWith<$Res> {
  factory $PersonInputCopyWith(
    PersonInput value,
    $Res Function(PersonInput) _then,
  ) = _$PersonInputCopyWithImpl;
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
class _$PersonInputCopyWithImpl<$Res> implements $PersonInputCopyWith<$Res> {
  _$PersonInputCopyWithImpl(this._self, this._then);

  final PersonInput _self;
  final $Res Function(PersonInput) _then;

  /// Create a copy of PersonInput
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

/// Adds pattern-matching-related methods to [PersonInput].
extension PersonInputPatterns on PersonInput {
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
    TResult Function(_PersonInput value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PersonInput() when $default != null:
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
    TResult Function(_PersonInput value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PersonInput():
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
    TResult? Function(_PersonInput value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PersonInput() when $default != null:
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
      case _PersonInput() when $default != null:
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
      case _PersonInput():
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
      case _PersonInput() when $default != null:
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
class _PersonInput implements PersonInput {
  const _PersonInput({
    required this.firstName,
    required this.lastName,
    this.position,
    this.email,
    this.phone,
  });
  factory _PersonInput.fromJson(Map<String, dynamic> json) =>
      _$PersonInputFromJson(json);

  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String? position;
  @override
  final String? email;
  @override
  final String? phone;

  /// Create a copy of PersonInput
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PersonInputCopyWith<_PersonInput> get copyWith =>
      __$PersonInputCopyWithImpl<_PersonInput>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PersonInputToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PersonInput &&
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
    return 'PersonInput(firstName: $firstName, lastName: $lastName, position: $position, email: $email, phone: $phone)';
  }
}

/// @nodoc
abstract mixin class _$PersonInputCopyWith<$Res>
    implements $PersonInputCopyWith<$Res> {
  factory _$PersonInputCopyWith(
    _PersonInput value,
    $Res Function(_PersonInput) _then,
  ) = __$PersonInputCopyWithImpl;
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
class __$PersonInputCopyWithImpl<$Res> implements _$PersonInputCopyWith<$Res> {
  __$PersonInputCopyWithImpl(this._self, this._then);

  final _PersonInput _self;
  final $Res Function(_PersonInput) _then;

  /// Create a copy of PersonInput
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
      _PersonInput(
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

/// @nodoc
mixin _$PersonRef {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PersonRef);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PersonRef()';
  }
}

/// @nodoc
class $PersonRefCopyWith<$Res> {
  $PersonRefCopyWith(PersonRef _, $Res Function(PersonRef) __);
}

/// Adds pattern-matching-related methods to [PersonRef].
extension PersonRefPatterns on PersonRef {
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
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ExistingPersonRef value)? existing,
    TResult Function(NewPersonRef value)? registered,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ExistingPersonRef() when existing != null:
        return existing(_that);
      case NewPersonRef() when registered != null:
        return registered(_that);
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
  TResult map<TResult extends Object?>({
    required TResult Function(ExistingPersonRef value) existing,
    required TResult Function(NewPersonRef value) registered,
  }) {
    final _that = this;
    switch (_that) {
      case ExistingPersonRef():
        return existing(_that);
      case NewPersonRef():
        return registered(_that);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ExistingPersonRef value)? existing,
    TResult? Function(NewPersonRef value)? registered,
  }) {
    final _that = this;
    switch (_that) {
      case ExistingPersonRef() when existing != null:
        return existing(_that);
      case NewPersonRef() when registered != null:
        return registered(_that);
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
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String personId)? existing,
    TResult Function(PersonInput person)? registered,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ExistingPersonRef() when existing != null:
        return existing(_that.personId);
      case NewPersonRef() when registered != null:
        return registered(_that.person);
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
  TResult when<TResult extends Object?>({
    required TResult Function(String personId) existing,
    required TResult Function(PersonInput person) registered,
  }) {
    final _that = this;
    switch (_that) {
      case ExistingPersonRef():
        return existing(_that.personId);
      case NewPersonRef():
        return registered(_that.person);
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String personId)? existing,
    TResult? Function(PersonInput person)? registered,
  }) {
    final _that = this;
    switch (_that) {
      case ExistingPersonRef() when existing != null:
        return existing(_that.personId);
      case NewPersonRef() when registered != null:
        return registered(_that.person);
      case _:
        return null;
    }
  }
}

/// @nodoc

class ExistingPersonRef extends PersonRef {
  const ExistingPersonRef(this.personId) : super._();

  final String personId;

  /// Create a copy of PersonRef
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ExistingPersonRefCopyWith<ExistingPersonRef> get copyWith =>
      _$ExistingPersonRefCopyWithImpl<ExistingPersonRef>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ExistingPersonRef &&
            (identical(other.personId, personId) ||
                other.personId == personId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, personId);

  @override
  String toString() {
    return 'PersonRef.existing(personId: $personId)';
  }
}

/// @nodoc
abstract mixin class $ExistingPersonRefCopyWith<$Res>
    implements $PersonRefCopyWith<$Res> {
  factory $ExistingPersonRefCopyWith(
    ExistingPersonRef value,
    $Res Function(ExistingPersonRef) _then,
  ) = _$ExistingPersonRefCopyWithImpl;
  @useResult
  $Res call({String personId});
}

/// @nodoc
class _$ExistingPersonRefCopyWithImpl<$Res>
    implements $ExistingPersonRefCopyWith<$Res> {
  _$ExistingPersonRefCopyWithImpl(this._self, this._then);

  final ExistingPersonRef _self;
  final $Res Function(ExistingPersonRef) _then;

  /// Create a copy of PersonRef
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? personId = null}) {
    return _then(
      ExistingPersonRef(
        null == personId
            ? _self.personId
            : personId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class NewPersonRef extends PersonRef {
  const NewPersonRef(this.person) : super._();

  final PersonInput person;

  /// Create a copy of PersonRef
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NewPersonRefCopyWith<NewPersonRef> get copyWith =>
      _$NewPersonRefCopyWithImpl<NewPersonRef>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NewPersonRef &&
            (identical(other.person, person) || other.person == person));
  }

  @override
  int get hashCode => Object.hash(runtimeType, person);

  @override
  String toString() {
    return 'PersonRef.registered(person: $person)';
  }
}

/// @nodoc
abstract mixin class $NewPersonRefCopyWith<$Res>
    implements $PersonRefCopyWith<$Res> {
  factory $NewPersonRefCopyWith(
    NewPersonRef value,
    $Res Function(NewPersonRef) _then,
  ) = _$NewPersonRefCopyWithImpl;
  @useResult
  $Res call({PersonInput person});

  $PersonInputCopyWith<$Res> get person;
}

/// @nodoc
class _$NewPersonRefCopyWithImpl<$Res> implements $NewPersonRefCopyWith<$Res> {
  _$NewPersonRefCopyWithImpl(this._self, this._then);

  final NewPersonRef _self;
  final $Res Function(NewPersonRef) _then;

  /// Create a copy of PersonRef
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? person = null}) {
    return _then(
      NewPersonRef(
        null == person
            ? _self.person
            : person // ignore: cast_nullable_to_non_nullable
                  as PersonInput,
      ),
    );
  }

  /// Create a copy of PersonRef
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PersonInputCopyWith<$Res> get person {
    return $PersonInputCopyWith<$Res>(_self.person, (value) {
      return _then(_self.copyWith(person: value));
    });
  }
}
