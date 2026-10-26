// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'explorer_organization.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExplorerOrganization {
  AdminOrganization get organization;
  int get tablesTotal;
  int get tablesActive;
  int get tablesDelayed;
  int get tablesInactive;
  int get people;
  int get valuesCompleted;
  double? get attendancePct;
  double? get improvementAvg;
  bool get hasActiveCoordinator;
  String? get coordinatorName;

  /// Create a copy of ExplorerOrganization
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ExplorerOrganizationCopyWith<ExplorerOrganization> get copyWith =>
      _$ExplorerOrganizationCopyWithImpl<ExplorerOrganization>(
        this as ExplorerOrganization,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ExplorerOrganization &&
            (identical(other.organization, organization) ||
                other.organization == organization) &&
            (identical(other.tablesTotal, tablesTotal) ||
                other.tablesTotal == tablesTotal) &&
            (identical(other.tablesActive, tablesActive) ||
                other.tablesActive == tablesActive) &&
            (identical(other.tablesDelayed, tablesDelayed) ||
                other.tablesDelayed == tablesDelayed) &&
            (identical(other.tablesInactive, tablesInactive) ||
                other.tablesInactive == tablesInactive) &&
            (identical(other.people, people) || other.people == people) &&
            (identical(other.valuesCompleted, valuesCompleted) ||
                other.valuesCompleted == valuesCompleted) &&
            (identical(other.attendancePct, attendancePct) ||
                other.attendancePct == attendancePct) &&
            (identical(other.improvementAvg, improvementAvg) ||
                other.improvementAvg == improvementAvg) &&
            (identical(other.hasActiveCoordinator, hasActiveCoordinator) ||
                other.hasActiveCoordinator == hasActiveCoordinator) &&
            (identical(other.coordinatorName, coordinatorName) ||
                other.coordinatorName == coordinatorName));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    organization,
    tablesTotal,
    tablesActive,
    tablesDelayed,
    tablesInactive,
    people,
    valuesCompleted,
    attendancePct,
    improvementAvg,
    hasActiveCoordinator,
    coordinatorName,
  );

  @override
  String toString() {
    return 'ExplorerOrganization(organization: $organization, tablesTotal: $tablesTotal, tablesActive: $tablesActive, tablesDelayed: $tablesDelayed, tablesInactive: $tablesInactive, people: $people, valuesCompleted: $valuesCompleted, attendancePct: $attendancePct, improvementAvg: $improvementAvg, hasActiveCoordinator: $hasActiveCoordinator, coordinatorName: $coordinatorName)';
  }
}

/// @nodoc
abstract mixin class $ExplorerOrganizationCopyWith<$Res> {
  factory $ExplorerOrganizationCopyWith(
    ExplorerOrganization value,
    $Res Function(ExplorerOrganization) _then,
  ) = _$ExplorerOrganizationCopyWithImpl;
  @useResult
  $Res call({
    AdminOrganization organization,
    int tablesTotal,
    int tablesActive,
    int tablesDelayed,
    int tablesInactive,
    int people,
    int valuesCompleted,
    double? attendancePct,
    double? improvementAvg,
    bool hasActiveCoordinator,
    String? coordinatorName,
  });

  $AdminOrganizationCopyWith<$Res> get organization;
}

/// @nodoc
class _$ExplorerOrganizationCopyWithImpl<$Res>
    implements $ExplorerOrganizationCopyWith<$Res> {
  _$ExplorerOrganizationCopyWithImpl(this._self, this._then);

  final ExplorerOrganization _self;
  final $Res Function(ExplorerOrganization) _then;

  /// Create a copy of ExplorerOrganization
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? organization = null,
    Object? tablesTotal = null,
    Object? tablesActive = null,
    Object? tablesDelayed = null,
    Object? tablesInactive = null,
    Object? people = null,
    Object? valuesCompleted = null,
    Object? attendancePct = freezed,
    Object? improvementAvg = freezed,
    Object? hasActiveCoordinator = null,
    Object? coordinatorName = freezed,
  }) {
    return _then(
      _self.copyWith(
        organization: null == organization
            ? _self.organization
            : organization // ignore: cast_nullable_to_non_nullable
                  as AdminOrganization,
        tablesTotal: null == tablesTotal
            ? _self.tablesTotal
            : tablesTotal // ignore: cast_nullable_to_non_nullable
                  as int,
        tablesActive: null == tablesActive
            ? _self.tablesActive
            : tablesActive // ignore: cast_nullable_to_non_nullable
                  as int,
        tablesDelayed: null == tablesDelayed
            ? _self.tablesDelayed
            : tablesDelayed // ignore: cast_nullable_to_non_nullable
                  as int,
        tablesInactive: null == tablesInactive
            ? _self.tablesInactive
            : tablesInactive // ignore: cast_nullable_to_non_nullable
                  as int,
        people: null == people
            ? _self.people
            : people // ignore: cast_nullable_to_non_nullable
                  as int,
        valuesCompleted: null == valuesCompleted
            ? _self.valuesCompleted
            : valuesCompleted // ignore: cast_nullable_to_non_nullable
                  as int,
        attendancePct: freezed == attendancePct
            ? _self.attendancePct
            : attendancePct // ignore: cast_nullable_to_non_nullable
                  as double?,
        improvementAvg: freezed == improvementAvg
            ? _self.improvementAvg
            : improvementAvg // ignore: cast_nullable_to_non_nullable
                  as double?,
        hasActiveCoordinator: null == hasActiveCoordinator
            ? _self.hasActiveCoordinator
            : hasActiveCoordinator // ignore: cast_nullable_to_non_nullable
                  as bool,
        coordinatorName: freezed == coordinatorName
            ? _self.coordinatorName
            : coordinatorName // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }

  /// Create a copy of ExplorerOrganization
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AdminOrganizationCopyWith<$Res> get organization {
    return $AdminOrganizationCopyWith<$Res>(_self.organization, (value) {
      return _then(_self.copyWith(organization: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ExplorerOrganization].
extension ExplorerOrganizationPatterns on ExplorerOrganization {
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
    TResult Function(_ExplorerOrganization value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ExplorerOrganization() when $default != null:
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
    TResult Function(_ExplorerOrganization value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExplorerOrganization():
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
    TResult? Function(_ExplorerOrganization value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExplorerOrganization() when $default != null:
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
      AdminOrganization organization,
      int tablesTotal,
      int tablesActive,
      int tablesDelayed,
      int tablesInactive,
      int people,
      int valuesCompleted,
      double? attendancePct,
      double? improvementAvg,
      bool hasActiveCoordinator,
      String? coordinatorName,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ExplorerOrganization() when $default != null:
        return $default(
          _that.organization,
          _that.tablesTotal,
          _that.tablesActive,
          _that.tablesDelayed,
          _that.tablesInactive,
          _that.people,
          _that.valuesCompleted,
          _that.attendancePct,
          _that.improvementAvg,
          _that.hasActiveCoordinator,
          _that.coordinatorName,
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
      AdminOrganization organization,
      int tablesTotal,
      int tablesActive,
      int tablesDelayed,
      int tablesInactive,
      int people,
      int valuesCompleted,
      double? attendancePct,
      double? improvementAvg,
      bool hasActiveCoordinator,
      String? coordinatorName,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExplorerOrganization():
        return $default(
          _that.organization,
          _that.tablesTotal,
          _that.tablesActive,
          _that.tablesDelayed,
          _that.tablesInactive,
          _that.people,
          _that.valuesCompleted,
          _that.attendancePct,
          _that.improvementAvg,
          _that.hasActiveCoordinator,
          _that.coordinatorName,
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
      AdminOrganization organization,
      int tablesTotal,
      int tablesActive,
      int tablesDelayed,
      int tablesInactive,
      int people,
      int valuesCompleted,
      double? attendancePct,
      double? improvementAvg,
      bool hasActiveCoordinator,
      String? coordinatorName,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExplorerOrganization() when $default != null:
        return $default(
          _that.organization,
          _that.tablesTotal,
          _that.tablesActive,
          _that.tablesDelayed,
          _that.tablesInactive,
          _that.people,
          _that.valuesCompleted,
          _that.attendancePct,
          _that.improvementAvg,
          _that.hasActiveCoordinator,
          _that.coordinatorName,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ExplorerOrganization extends ExplorerOrganization {
  const _ExplorerOrganization({
    required this.organization,
    this.tablesTotal = 0,
    this.tablesActive = 0,
    this.tablesDelayed = 0,
    this.tablesInactive = 0,
    this.people = 0,
    this.valuesCompleted = 0,
    this.attendancePct,
    this.improvementAvg,
    this.hasActiveCoordinator = false,
    this.coordinatorName,
  }) : super._();

  @override
  final AdminOrganization organization;
  @override
  @JsonKey()
  final int tablesTotal;
  @override
  @JsonKey()
  final int tablesActive;
  @override
  @JsonKey()
  final int tablesDelayed;
  @override
  @JsonKey()
  final int tablesInactive;
  @override
  @JsonKey()
  final int people;
  @override
  @JsonKey()
  final int valuesCompleted;
  @override
  final double? attendancePct;
  @override
  final double? improvementAvg;
  @override
  @JsonKey()
  final bool hasActiveCoordinator;
  @override
  final String? coordinatorName;

  /// Create a copy of ExplorerOrganization
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ExplorerOrganizationCopyWith<_ExplorerOrganization> get copyWith =>
      __$ExplorerOrganizationCopyWithImpl<_ExplorerOrganization>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ExplorerOrganization &&
            (identical(other.organization, organization) ||
                other.organization == organization) &&
            (identical(other.tablesTotal, tablesTotal) ||
                other.tablesTotal == tablesTotal) &&
            (identical(other.tablesActive, tablesActive) ||
                other.tablesActive == tablesActive) &&
            (identical(other.tablesDelayed, tablesDelayed) ||
                other.tablesDelayed == tablesDelayed) &&
            (identical(other.tablesInactive, tablesInactive) ||
                other.tablesInactive == tablesInactive) &&
            (identical(other.people, people) || other.people == people) &&
            (identical(other.valuesCompleted, valuesCompleted) ||
                other.valuesCompleted == valuesCompleted) &&
            (identical(other.attendancePct, attendancePct) ||
                other.attendancePct == attendancePct) &&
            (identical(other.improvementAvg, improvementAvg) ||
                other.improvementAvg == improvementAvg) &&
            (identical(other.hasActiveCoordinator, hasActiveCoordinator) ||
                other.hasActiveCoordinator == hasActiveCoordinator) &&
            (identical(other.coordinatorName, coordinatorName) ||
                other.coordinatorName == coordinatorName));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    organization,
    tablesTotal,
    tablesActive,
    tablesDelayed,
    tablesInactive,
    people,
    valuesCompleted,
    attendancePct,
    improvementAvg,
    hasActiveCoordinator,
    coordinatorName,
  );

  @override
  String toString() {
    return 'ExplorerOrganization(organization: $organization, tablesTotal: $tablesTotal, tablesActive: $tablesActive, tablesDelayed: $tablesDelayed, tablesInactive: $tablesInactive, people: $people, valuesCompleted: $valuesCompleted, attendancePct: $attendancePct, improvementAvg: $improvementAvg, hasActiveCoordinator: $hasActiveCoordinator, coordinatorName: $coordinatorName)';
  }
}

/// @nodoc
abstract mixin class _$ExplorerOrganizationCopyWith<$Res>
    implements $ExplorerOrganizationCopyWith<$Res> {
  factory _$ExplorerOrganizationCopyWith(
    _ExplorerOrganization value,
    $Res Function(_ExplorerOrganization) _then,
  ) = __$ExplorerOrganizationCopyWithImpl;
  @override
  @useResult
  $Res call({
    AdminOrganization organization,
    int tablesTotal,
    int tablesActive,
    int tablesDelayed,
    int tablesInactive,
    int people,
    int valuesCompleted,
    double? attendancePct,
    double? improvementAvg,
    bool hasActiveCoordinator,
    String? coordinatorName,
  });

  @override
  $AdminOrganizationCopyWith<$Res> get organization;
}

/// @nodoc
class __$ExplorerOrganizationCopyWithImpl<$Res>
    implements _$ExplorerOrganizationCopyWith<$Res> {
  __$ExplorerOrganizationCopyWithImpl(this._self, this._then);

  final _ExplorerOrganization _self;
  final $Res Function(_ExplorerOrganization) _then;

  /// Create a copy of ExplorerOrganization
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? organization = null,
    Object? tablesTotal = null,
    Object? tablesActive = null,
    Object? tablesDelayed = null,
    Object? tablesInactive = null,
    Object? people = null,
    Object? valuesCompleted = null,
    Object? attendancePct = freezed,
    Object? improvementAvg = freezed,
    Object? hasActiveCoordinator = null,
    Object? coordinatorName = freezed,
  }) {
    return _then(
      _ExplorerOrganization(
        organization: null == organization
            ? _self.organization
            : organization // ignore: cast_nullable_to_non_nullable
                  as AdminOrganization,
        tablesTotal: null == tablesTotal
            ? _self.tablesTotal
            : tablesTotal // ignore: cast_nullable_to_non_nullable
                  as int,
        tablesActive: null == tablesActive
            ? _self.tablesActive
            : tablesActive // ignore: cast_nullable_to_non_nullable
                  as int,
        tablesDelayed: null == tablesDelayed
            ? _self.tablesDelayed
            : tablesDelayed // ignore: cast_nullable_to_non_nullable
                  as int,
        tablesInactive: null == tablesInactive
            ? _self.tablesInactive
            : tablesInactive // ignore: cast_nullable_to_non_nullable
                  as int,
        people: null == people
            ? _self.people
            : people // ignore: cast_nullable_to_non_nullable
                  as int,
        valuesCompleted: null == valuesCompleted
            ? _self.valuesCompleted
            : valuesCompleted // ignore: cast_nullable_to_non_nullable
                  as int,
        attendancePct: freezed == attendancePct
            ? _self.attendancePct
            : attendancePct // ignore: cast_nullable_to_non_nullable
                  as double?,
        improvementAvg: freezed == improvementAvg
            ? _self.improvementAvg
            : improvementAvg // ignore: cast_nullable_to_non_nullable
                  as double?,
        hasActiveCoordinator: null == hasActiveCoordinator
            ? _self.hasActiveCoordinator
            : hasActiveCoordinator // ignore: cast_nullable_to_non_nullable
                  as bool,
        coordinatorName: freezed == coordinatorName
            ? _self.coordinatorName
            : coordinatorName // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }

  /// Create a copy of ExplorerOrganization
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AdminOrganizationCopyWith<$Res> get organization {
    return $AdminOrganizationCopyWith<$Res>(_self.organization, (value) {
      return _then(_self.copyWith(organization: value));
    });
  }
}
