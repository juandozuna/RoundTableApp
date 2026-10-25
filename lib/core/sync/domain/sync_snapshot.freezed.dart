// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sync_snapshot.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SyncSnapshot {
  SyncConnection get connection;
  bool get uploading;
  bool get downloading;

  /// Local changes waiting to upload.
  int get pendingCount;
  DateTime? get lastSyncedAt;

  /// When the oldest still-pending change was first observed.
  DateTime? get pendingSince;

  /// Pending changes are older than `AppLimits.unsyncedWarningAfter`.
  bool get hasStalePending;
  bool get hasError;

  /// Create a copy of SyncSnapshot
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SyncSnapshotCopyWith<SyncSnapshot> get copyWith =>
      _$SyncSnapshotCopyWithImpl<SyncSnapshot>(
        this as SyncSnapshot,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SyncSnapshot &&
            (identical(other.connection, connection) ||
                other.connection == connection) &&
            (identical(other.uploading, uploading) ||
                other.uploading == uploading) &&
            (identical(other.downloading, downloading) ||
                other.downloading == downloading) &&
            (identical(other.pendingCount, pendingCount) ||
                other.pendingCount == pendingCount) &&
            (identical(other.lastSyncedAt, lastSyncedAt) ||
                other.lastSyncedAt == lastSyncedAt) &&
            (identical(other.pendingSince, pendingSince) ||
                other.pendingSince == pendingSince) &&
            (identical(other.hasStalePending, hasStalePending) ||
                other.hasStalePending == hasStalePending) &&
            (identical(other.hasError, hasError) ||
                other.hasError == hasError));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    connection,
    uploading,
    downloading,
    pendingCount,
    lastSyncedAt,
    pendingSince,
    hasStalePending,
    hasError,
  );

  @override
  String toString() {
    return 'SyncSnapshot(connection: $connection, uploading: $uploading, downloading: $downloading, pendingCount: $pendingCount, lastSyncedAt: $lastSyncedAt, pendingSince: $pendingSince, hasStalePending: $hasStalePending, hasError: $hasError)';
  }
}

/// @nodoc
abstract mixin class $SyncSnapshotCopyWith<$Res> {
  factory $SyncSnapshotCopyWith(
    SyncSnapshot value,
    $Res Function(SyncSnapshot) _then,
  ) = _$SyncSnapshotCopyWithImpl;
  @useResult
  $Res call({
    SyncConnection connection,
    bool uploading,
    bool downloading,
    int pendingCount,
    DateTime? lastSyncedAt,
    DateTime? pendingSince,
    bool hasStalePending,
    bool hasError,
  });
}

/// @nodoc
class _$SyncSnapshotCopyWithImpl<$Res> implements $SyncSnapshotCopyWith<$Res> {
  _$SyncSnapshotCopyWithImpl(this._self, this._then);

  final SyncSnapshot _self;
  final $Res Function(SyncSnapshot) _then;

  /// Create a copy of SyncSnapshot
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? connection = null,
    Object? uploading = null,
    Object? downloading = null,
    Object? pendingCount = null,
    Object? lastSyncedAt = freezed,
    Object? pendingSince = freezed,
    Object? hasStalePending = null,
    Object? hasError = null,
  }) {
    return _then(
      _self.copyWith(
        connection: null == connection
            ? _self.connection
            : connection // ignore: cast_nullable_to_non_nullable
                  as SyncConnection,
        uploading: null == uploading
            ? _self.uploading
            : uploading // ignore: cast_nullable_to_non_nullable
                  as bool,
        downloading: null == downloading
            ? _self.downloading
            : downloading // ignore: cast_nullable_to_non_nullable
                  as bool,
        pendingCount: null == pendingCount
            ? _self.pendingCount
            : pendingCount // ignore: cast_nullable_to_non_nullable
                  as int,
        lastSyncedAt: freezed == lastSyncedAt
            ? _self.lastSyncedAt
            : lastSyncedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        pendingSince: freezed == pendingSince
            ? _self.pendingSince
            : pendingSince // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        hasStalePending: null == hasStalePending
            ? _self.hasStalePending
            : hasStalePending // ignore: cast_nullable_to_non_nullable
                  as bool,
        hasError: null == hasError
            ? _self.hasError
            : hasError // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [SyncSnapshot].
extension SyncSnapshotPatterns on SyncSnapshot {
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
    TResult Function(_SyncSnapshot value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SyncSnapshot() when $default != null:
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
    TResult Function(_SyncSnapshot value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SyncSnapshot():
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
    TResult? Function(_SyncSnapshot value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SyncSnapshot() when $default != null:
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
      SyncConnection connection,
      bool uploading,
      bool downloading,
      int pendingCount,
      DateTime? lastSyncedAt,
      DateTime? pendingSince,
      bool hasStalePending,
      bool hasError,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SyncSnapshot() when $default != null:
        return $default(
          _that.connection,
          _that.uploading,
          _that.downloading,
          _that.pendingCount,
          _that.lastSyncedAt,
          _that.pendingSince,
          _that.hasStalePending,
          _that.hasError,
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
      SyncConnection connection,
      bool uploading,
      bool downloading,
      int pendingCount,
      DateTime? lastSyncedAt,
      DateTime? pendingSince,
      bool hasStalePending,
      bool hasError,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SyncSnapshot():
        return $default(
          _that.connection,
          _that.uploading,
          _that.downloading,
          _that.pendingCount,
          _that.lastSyncedAt,
          _that.pendingSince,
          _that.hasStalePending,
          _that.hasError,
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
      SyncConnection connection,
      bool uploading,
      bool downloading,
      int pendingCount,
      DateTime? lastSyncedAt,
      DateTime? pendingSince,
      bool hasStalePending,
      bool hasError,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SyncSnapshot() when $default != null:
        return $default(
          _that.connection,
          _that.uploading,
          _that.downloading,
          _that.pendingCount,
          _that.lastSyncedAt,
          _that.pendingSince,
          _that.hasStalePending,
          _that.hasError,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _SyncSnapshot extends SyncSnapshot {
  const _SyncSnapshot({
    required this.connection,
    this.uploading = false,
    this.downloading = false,
    this.pendingCount = 0,
    this.lastSyncedAt,
    this.pendingSince,
    this.hasStalePending = false,
    this.hasError = false,
  }) : super._();

  @override
  final SyncConnection connection;
  @override
  @JsonKey()
  final bool uploading;
  @override
  @JsonKey()
  final bool downloading;

  /// Local changes waiting to upload.
  @override
  @JsonKey()
  final int pendingCount;
  @override
  final DateTime? lastSyncedAt;

  /// When the oldest still-pending change was first observed.
  @override
  final DateTime? pendingSince;

  /// Pending changes are older than `AppLimits.unsyncedWarningAfter`.
  @override
  @JsonKey()
  final bool hasStalePending;
  @override
  @JsonKey()
  final bool hasError;

  /// Create a copy of SyncSnapshot
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SyncSnapshotCopyWith<_SyncSnapshot> get copyWith =>
      __$SyncSnapshotCopyWithImpl<_SyncSnapshot>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SyncSnapshot &&
            (identical(other.connection, connection) ||
                other.connection == connection) &&
            (identical(other.uploading, uploading) ||
                other.uploading == uploading) &&
            (identical(other.downloading, downloading) ||
                other.downloading == downloading) &&
            (identical(other.pendingCount, pendingCount) ||
                other.pendingCount == pendingCount) &&
            (identical(other.lastSyncedAt, lastSyncedAt) ||
                other.lastSyncedAt == lastSyncedAt) &&
            (identical(other.pendingSince, pendingSince) ||
                other.pendingSince == pendingSince) &&
            (identical(other.hasStalePending, hasStalePending) ||
                other.hasStalePending == hasStalePending) &&
            (identical(other.hasError, hasError) ||
                other.hasError == hasError));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    connection,
    uploading,
    downloading,
    pendingCount,
    lastSyncedAt,
    pendingSince,
    hasStalePending,
    hasError,
  );

  @override
  String toString() {
    return 'SyncSnapshot(connection: $connection, uploading: $uploading, downloading: $downloading, pendingCount: $pendingCount, lastSyncedAt: $lastSyncedAt, pendingSince: $pendingSince, hasStalePending: $hasStalePending, hasError: $hasError)';
  }
}

/// @nodoc
abstract mixin class _$SyncSnapshotCopyWith<$Res>
    implements $SyncSnapshotCopyWith<$Res> {
  factory _$SyncSnapshotCopyWith(
    _SyncSnapshot value,
    $Res Function(_SyncSnapshot) _then,
  ) = __$SyncSnapshotCopyWithImpl;
  @override
  @useResult
  $Res call({
    SyncConnection connection,
    bool uploading,
    bool downloading,
    int pendingCount,
    DateTime? lastSyncedAt,
    DateTime? pendingSince,
    bool hasStalePending,
    bool hasError,
  });
}

/// @nodoc
class __$SyncSnapshotCopyWithImpl<$Res>
    implements _$SyncSnapshotCopyWith<$Res> {
  __$SyncSnapshotCopyWithImpl(this._self, this._then);

  final _SyncSnapshot _self;
  final $Res Function(_SyncSnapshot) _then;

  /// Create a copy of SyncSnapshot
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? connection = null,
    Object? uploading = null,
    Object? downloading = null,
    Object? pendingCount = null,
    Object? lastSyncedAt = freezed,
    Object? pendingSince = freezed,
    Object? hasStalePending = null,
    Object? hasError = null,
  }) {
    return _then(
      _SyncSnapshot(
        connection: null == connection
            ? _self.connection
            : connection // ignore: cast_nullable_to_non_nullable
                  as SyncConnection,
        uploading: null == uploading
            ? _self.uploading
            : uploading // ignore: cast_nullable_to_non_nullable
                  as bool,
        downloading: null == downloading
            ? _self.downloading
            : downloading // ignore: cast_nullable_to_non_nullable
                  as bool,
        pendingCount: null == pendingCount
            ? _self.pendingCount
            : pendingCount // ignore: cast_nullable_to_non_nullable
                  as int,
        lastSyncedAt: freezed == lastSyncedAt
            ? _self.lastSyncedAt
            : lastSyncedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        pendingSince: freezed == pendingSince
            ? _self.pendingSince
            : pendingSince // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        hasStalePending: null == hasStalePending
            ? _self.hasStalePending
            : hasStalePending // ignore: cast_nullable_to_non_nullable
                  as bool,
        hasError: null == hasError
            ? _self.hasError
            : hasError // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}
