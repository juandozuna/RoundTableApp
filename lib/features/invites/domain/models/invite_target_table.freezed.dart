// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invite_target_table.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InviteTargetTable {
  String get id;
  String get organizationId;
  String? get organizationName;
  String get name;
  String? get code;
  String? get status;
  int get activePeople;
  int get maxPeople;
  String? get facilitatorPersonId;
  String? get facilitatorName;

  /// Create a copy of InviteTargetTable
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InviteTargetTableCopyWith<InviteTargetTable> get copyWith =>
      _$InviteTargetTableCopyWithImpl<InviteTargetTable>(
        this as InviteTargetTable,
        _$identity,
      );

  /// Serializes this InviteTargetTable to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InviteTargetTable &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.organizationName, organizationName) ||
                other.organizationName == organizationName) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.activePeople, activePeople) ||
                other.activePeople == activePeople) &&
            (identical(other.maxPeople, maxPeople) ||
                other.maxPeople == maxPeople) &&
            (identical(other.facilitatorPersonId, facilitatorPersonId) ||
                other.facilitatorPersonId == facilitatorPersonId) &&
            (identical(other.facilitatorName, facilitatorName) ||
                other.facilitatorName == facilitatorName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    organizationId,
    organizationName,
    name,
    code,
    status,
    activePeople,
    maxPeople,
    facilitatorPersonId,
    facilitatorName,
  );

  @override
  String toString() {
    return 'InviteTargetTable(id: $id, organizationId: $organizationId, organizationName: $organizationName, name: $name, code: $code, status: $status, activePeople: $activePeople, maxPeople: $maxPeople, facilitatorPersonId: $facilitatorPersonId, facilitatorName: $facilitatorName)';
  }
}

/// @nodoc
abstract mixin class $InviteTargetTableCopyWith<$Res> {
  factory $InviteTargetTableCopyWith(
    InviteTargetTable value,
    $Res Function(InviteTargetTable) _then,
  ) = _$InviteTargetTableCopyWithImpl;
  @useResult
  $Res call({
    String id,
    String organizationId,
    String? organizationName,
    String name,
    String? code,
    String? status,
    int activePeople,
    int maxPeople,
    String? facilitatorPersonId,
    String? facilitatorName,
  });
}

/// @nodoc
class _$InviteTargetTableCopyWithImpl<$Res>
    implements $InviteTargetTableCopyWith<$Res> {
  _$InviteTargetTableCopyWithImpl(this._self, this._then);

  final InviteTargetTable _self;
  final $Res Function(InviteTargetTable) _then;

  /// Create a copy of InviteTargetTable
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? organizationId = null,
    Object? organizationName = freezed,
    Object? name = null,
    Object? code = freezed,
    Object? status = freezed,
    Object? activePeople = null,
    Object? maxPeople = null,
    Object? facilitatorPersonId = freezed,
    Object? facilitatorName = freezed,
  }) {
    return _then(
      _self.copyWith(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        organizationId: null == organizationId
            ? _self.organizationId
            : organizationId // ignore: cast_nullable_to_non_nullable
                  as String,
        organizationName: freezed == organizationName
            ? _self.organizationName
            : organizationName // ignore: cast_nullable_to_non_nullable
                  as String?,
        name: null == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        code: freezed == code
            ? _self.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: freezed == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String?,
        activePeople: null == activePeople
            ? _self.activePeople
            : activePeople // ignore: cast_nullable_to_non_nullable
                  as int,
        maxPeople: null == maxPeople
            ? _self.maxPeople
            : maxPeople // ignore: cast_nullable_to_non_nullable
                  as int,
        facilitatorPersonId: freezed == facilitatorPersonId
            ? _self.facilitatorPersonId
            : facilitatorPersonId // ignore: cast_nullable_to_non_nullable
                  as String?,
        facilitatorName: freezed == facilitatorName
            ? _self.facilitatorName
            : facilitatorName // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [InviteTargetTable].
extension InviteTargetTablePatterns on InviteTargetTable {
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
    TResult Function(_InviteTargetTable value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InviteTargetTable() when $default != null:
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
    TResult Function(_InviteTargetTable value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InviteTargetTable():
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
    TResult? Function(_InviteTargetTable value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InviteTargetTable() when $default != null:
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
      String organizationId,
      String? organizationName,
      String name,
      String? code,
      String? status,
      int activePeople,
      int maxPeople,
      String? facilitatorPersonId,
      String? facilitatorName,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InviteTargetTable() when $default != null:
        return $default(
          _that.id,
          _that.organizationId,
          _that.organizationName,
          _that.name,
          _that.code,
          _that.status,
          _that.activePeople,
          _that.maxPeople,
          _that.facilitatorPersonId,
          _that.facilitatorName,
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
      String organizationId,
      String? organizationName,
      String name,
      String? code,
      String? status,
      int activePeople,
      int maxPeople,
      String? facilitatorPersonId,
      String? facilitatorName,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InviteTargetTable():
        return $default(
          _that.id,
          _that.organizationId,
          _that.organizationName,
          _that.name,
          _that.code,
          _that.status,
          _that.activePeople,
          _that.maxPeople,
          _that.facilitatorPersonId,
          _that.facilitatorName,
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
      String organizationId,
      String? organizationName,
      String name,
      String? code,
      String? status,
      int activePeople,
      int maxPeople,
      String? facilitatorPersonId,
      String? facilitatorName,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InviteTargetTable() when $default != null:
        return $default(
          _that.id,
          _that.organizationId,
          _that.organizationName,
          _that.name,
          _that.code,
          _that.status,
          _that.activePeople,
          _that.maxPeople,
          _that.facilitatorPersonId,
          _that.facilitatorName,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _InviteTargetTable extends InviteTargetTable {
  const _InviteTargetTable({
    required this.id,
    required this.organizationId,
    this.organizationName,
    required this.name,
    this.code,
    this.status,
    this.activePeople = 0,
    this.maxPeople = AppLimits.maxTableSeats,
    this.facilitatorPersonId,
    this.facilitatorName,
  }) : super._();
  factory _InviteTargetTable.fromJson(Map<String, dynamic> json) =>
      _$InviteTargetTableFromJson(json);

  @override
  final String id;
  @override
  final String organizationId;
  @override
  final String? organizationName;
  @override
  final String name;
  @override
  final String? code;
  @override
  final String? status;
  @override
  @JsonKey()
  final int activePeople;
  @override
  @JsonKey()
  final int maxPeople;
  @override
  final String? facilitatorPersonId;
  @override
  final String? facilitatorName;

  /// Create a copy of InviteTargetTable
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InviteTargetTableCopyWith<_InviteTargetTable> get copyWith =>
      __$InviteTargetTableCopyWithImpl<_InviteTargetTable>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$InviteTargetTableToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InviteTargetTable &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.organizationId, organizationId) ||
                other.organizationId == organizationId) &&
            (identical(other.organizationName, organizationName) ||
                other.organizationName == organizationName) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.activePeople, activePeople) ||
                other.activePeople == activePeople) &&
            (identical(other.maxPeople, maxPeople) ||
                other.maxPeople == maxPeople) &&
            (identical(other.facilitatorPersonId, facilitatorPersonId) ||
                other.facilitatorPersonId == facilitatorPersonId) &&
            (identical(other.facilitatorName, facilitatorName) ||
                other.facilitatorName == facilitatorName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    organizationId,
    organizationName,
    name,
    code,
    status,
    activePeople,
    maxPeople,
    facilitatorPersonId,
    facilitatorName,
  );

  @override
  String toString() {
    return 'InviteTargetTable(id: $id, organizationId: $organizationId, organizationName: $organizationName, name: $name, code: $code, status: $status, activePeople: $activePeople, maxPeople: $maxPeople, facilitatorPersonId: $facilitatorPersonId, facilitatorName: $facilitatorName)';
  }
}

/// @nodoc
abstract mixin class _$InviteTargetTableCopyWith<$Res>
    implements $InviteTargetTableCopyWith<$Res> {
  factory _$InviteTargetTableCopyWith(
    _InviteTargetTable value,
    $Res Function(_InviteTargetTable) _then,
  ) = __$InviteTargetTableCopyWithImpl;
  @override
  @useResult
  $Res call({
    String id,
    String organizationId,
    String? organizationName,
    String name,
    String? code,
    String? status,
    int activePeople,
    int maxPeople,
    String? facilitatorPersonId,
    String? facilitatorName,
  });
}

/// @nodoc
class __$InviteTargetTableCopyWithImpl<$Res>
    implements _$InviteTargetTableCopyWith<$Res> {
  __$InviteTargetTableCopyWithImpl(this._self, this._then);

  final _InviteTargetTable _self;
  final $Res Function(_InviteTargetTable) _then;

  /// Create a copy of InviteTargetTable
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? organizationId = null,
    Object? organizationName = freezed,
    Object? name = null,
    Object? code = freezed,
    Object? status = freezed,
    Object? activePeople = null,
    Object? maxPeople = null,
    Object? facilitatorPersonId = freezed,
    Object? facilitatorName = freezed,
  }) {
    return _then(
      _InviteTargetTable(
        id: null == id
            ? _self.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        organizationId: null == organizationId
            ? _self.organizationId
            : organizationId // ignore: cast_nullable_to_non_nullable
                  as String,
        organizationName: freezed == organizationName
            ? _self.organizationName
            : organizationName // ignore: cast_nullable_to_non_nullable
                  as String?,
        name: null == name
            ? _self.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        code: freezed == code
            ? _self.code
            : code // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: freezed == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String?,
        activePeople: null == activePeople
            ? _self.activePeople
            : activePeople // ignore: cast_nullable_to_non_nullable
                  as int,
        maxPeople: null == maxPeople
            ? _self.maxPeople
            : maxPeople // ignore: cast_nullable_to_non_nullable
                  as int,
        facilitatorPersonId: freezed == facilitatorPersonId
            ? _self.facilitatorPersonId
            : facilitatorPersonId // ignore: cast_nullable_to_non_nullable
                  as String?,
        facilitatorName: freezed == facilitatorName
            ? _self.facilitatorName
            : facilitatorName // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}
