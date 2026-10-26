// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'table_change.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TableChange {
  String get tableId;
  InviteShare? get facilitatorInvite;

  /// Create a copy of TableChange
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TableChangeCopyWith<TableChange> get copyWith =>
      _$TableChangeCopyWithImpl<TableChange>(this as TableChange, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TableChange &&
            (identical(other.tableId, tableId) || other.tableId == tableId) &&
            (identical(other.facilitatorInvite, facilitatorInvite) ||
                other.facilitatorInvite == facilitatorInvite));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tableId, facilitatorInvite);

  @override
  String toString() {
    return 'TableChange(tableId: $tableId, facilitatorInvite: $facilitatorInvite)';
  }
}

/// @nodoc
abstract mixin class $TableChangeCopyWith<$Res> {
  factory $TableChangeCopyWith(
    TableChange value,
    $Res Function(TableChange) _then,
  ) = _$TableChangeCopyWithImpl;
  @useResult
  $Res call({String tableId, InviteShare? facilitatorInvite});

  $InviteShareCopyWith<$Res>? get facilitatorInvite;
}

/// @nodoc
class _$TableChangeCopyWithImpl<$Res> implements $TableChangeCopyWith<$Res> {
  _$TableChangeCopyWithImpl(this._self, this._then);

  final TableChange _self;
  final $Res Function(TableChange) _then;

  /// Create a copy of TableChange
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? tableId = null, Object? facilitatorInvite = freezed}) {
    return _then(
      _self.copyWith(
        tableId: null == tableId
            ? _self.tableId
            : tableId // ignore: cast_nullable_to_non_nullable
                  as String,
        facilitatorInvite: freezed == facilitatorInvite
            ? _self.facilitatorInvite
            : facilitatorInvite // ignore: cast_nullable_to_non_nullable
                  as InviteShare?,
      ),
    );
  }

  /// Create a copy of TableChange
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

/// Adds pattern-matching-related methods to [TableChange].
extension TableChangePatterns on TableChange {
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
    TResult Function(_TableChange value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TableChange() when $default != null:
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
    TResult Function(_TableChange value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TableChange():
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
    TResult? Function(_TableChange value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TableChange() when $default != null:
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
    TResult Function(String tableId, InviteShare? facilitatorInvite)?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TableChange() when $default != null:
        return $default(_that.tableId, _that.facilitatorInvite);
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
    TResult Function(String tableId, InviteShare? facilitatorInvite) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TableChange():
        return $default(_that.tableId, _that.facilitatorInvite);
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
    TResult? Function(String tableId, InviteShare? facilitatorInvite)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TableChange() when $default != null:
        return $default(_that.tableId, _that.facilitatorInvite);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _TableChange implements TableChange {
  const _TableChange({required this.tableId, this.facilitatorInvite});

  @override
  final String tableId;
  @override
  final InviteShare? facilitatorInvite;

  /// Create a copy of TableChange
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TableChangeCopyWith<_TableChange> get copyWith =>
      __$TableChangeCopyWithImpl<_TableChange>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TableChange &&
            (identical(other.tableId, tableId) || other.tableId == tableId) &&
            (identical(other.facilitatorInvite, facilitatorInvite) ||
                other.facilitatorInvite == facilitatorInvite));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tableId, facilitatorInvite);

  @override
  String toString() {
    return 'TableChange(tableId: $tableId, facilitatorInvite: $facilitatorInvite)';
  }
}

/// @nodoc
abstract mixin class _$TableChangeCopyWith<$Res>
    implements $TableChangeCopyWith<$Res> {
  factory _$TableChangeCopyWith(
    _TableChange value,
    $Res Function(_TableChange) _then,
  ) = __$TableChangeCopyWithImpl;
  @override
  @useResult
  $Res call({String tableId, InviteShare? facilitatorInvite});

  @override
  $InviteShareCopyWith<$Res>? get facilitatorInvite;
}

/// @nodoc
class __$TableChangeCopyWithImpl<$Res> implements _$TableChangeCopyWith<$Res> {
  __$TableChangeCopyWithImpl(this._self, this._then);

  final _TableChange _self;
  final $Res Function(_TableChange) _then;

  /// Create a copy of TableChange
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? tableId = null, Object? facilitatorInvite = freezed}) {
    return _then(
      _TableChange(
        tableId: null == tableId
            ? _self.tableId
            : tableId // ignore: cast_nullable_to_non_nullable
                  as String,
        facilitatorInvite: freezed == facilitatorInvite
            ? _self.facilitatorInvite
            : facilitatorInvite // ignore: cast_nullable_to_non_nullable
                  as InviteShare?,
      ),
    );
  }

  /// Create a copy of TableChange
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
