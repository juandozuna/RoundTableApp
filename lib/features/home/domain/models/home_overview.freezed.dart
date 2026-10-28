// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_overview.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HomeOverview {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is HomeOverview);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'HomeOverview()';
  }
}

/// @nodoc
class $HomeOverviewCopyWith<$Res> {
  $HomeOverviewCopyWith(HomeOverview _, $Res Function(HomeOverview) __);
}

/// Adds pattern-matching-related methods to [HomeOverview].
extension HomeOverviewPatterns on HomeOverview {
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
    TResult Function(HomeNoContext value)? noContext,
    TResult Function(HomeFacilitator value)? facilitator,
    TResult Function(HomeMember value)? member,
    TResult Function(HomeManager value)? manager,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case HomeNoContext() when noContext != null:
        return noContext(_that);
      case HomeFacilitator() when facilitator != null:
        return facilitator(_that);
      case HomeMember() when member != null:
        return member(_that);
      case HomeManager() when manager != null:
        return manager(_that);
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
    required TResult Function(HomeNoContext value) noContext,
    required TResult Function(HomeFacilitator value) facilitator,
    required TResult Function(HomeMember value) member,
    required TResult Function(HomeManager value) manager,
  }) {
    final _that = this;
    switch (_that) {
      case HomeNoContext():
        return noContext(_that);
      case HomeFacilitator():
        return facilitator(_that);
      case HomeMember():
        return member(_that);
      case HomeManager():
        return manager(_that);
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
    TResult? Function(HomeNoContext value)? noContext,
    TResult? Function(HomeFacilitator value)? facilitator,
    TResult? Function(HomeMember value)? member,
    TResult? Function(HomeManager value)? manager,
  }) {
    final _that = this;
    switch (_that) {
      case HomeNoContext() when noContext != null:
        return noContext(_that);
      case HomeFacilitator() when facilitator != null:
        return facilitator(_that);
      case HomeMember() when member != null:
        return member(_that);
      case HomeManager() when manager != null:
        return manager(_that);
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
    TResult Function()? noContext,
    TResult Function(SessionContext context, HomeSession? session)? facilitator,
    TResult Function(
      SessionContext context,
      HomeSession? session,
      HomeCommitment? lastCommitment,
      HomeProgress progress,
    )?
    member,
    TResult Function(
      SessionContext context,
      HomeKpiSummary? kpis,
      int pendingInvites,
      List<HomeTableAlert> alerts,
    )?
    manager,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case HomeNoContext() when noContext != null:
        return noContext();
      case HomeFacilitator() when facilitator != null:
        return facilitator(_that.context, _that.session);
      case HomeMember() when member != null:
        return member(
          _that.context,
          _that.session,
          _that.lastCommitment,
          _that.progress,
        );
      case HomeManager() when manager != null:
        return manager(
          _that.context,
          _that.kpis,
          _that.pendingInvites,
          _that.alerts,
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
  TResult when<TResult extends Object?>({
    required TResult Function() noContext,
    required TResult Function(SessionContext context, HomeSession? session)
    facilitator,
    required TResult Function(
      SessionContext context,
      HomeSession? session,
      HomeCommitment? lastCommitment,
      HomeProgress progress,
    )
    member,
    required TResult Function(
      SessionContext context,
      HomeKpiSummary? kpis,
      int pendingInvites,
      List<HomeTableAlert> alerts,
    )
    manager,
  }) {
    final _that = this;
    switch (_that) {
      case HomeNoContext():
        return noContext();
      case HomeFacilitator():
        return facilitator(_that.context, _that.session);
      case HomeMember():
        return member(
          _that.context,
          _that.session,
          _that.lastCommitment,
          _that.progress,
        );
      case HomeManager():
        return manager(
          _that.context,
          _that.kpis,
          _that.pendingInvites,
          _that.alerts,
        );
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
    TResult? Function()? noContext,
    TResult? Function(SessionContext context, HomeSession? session)?
    facilitator,
    TResult? Function(
      SessionContext context,
      HomeSession? session,
      HomeCommitment? lastCommitment,
      HomeProgress progress,
    )?
    member,
    TResult? Function(
      SessionContext context,
      HomeKpiSummary? kpis,
      int pendingInvites,
      List<HomeTableAlert> alerts,
    )?
    manager,
  }) {
    final _that = this;
    switch (_that) {
      case HomeNoContext() when noContext != null:
        return noContext();
      case HomeFacilitator() when facilitator != null:
        return facilitator(_that.context, _that.session);
      case HomeMember() when member != null:
        return member(
          _that.context,
          _that.session,
          _that.lastCommitment,
          _that.progress,
        );
      case HomeManager() when manager != null:
        return manager(
          _that.context,
          _that.kpis,
          _that.pendingInvites,
          _that.alerts,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class HomeNoContext implements HomeOverview {
  const HomeNoContext();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is HomeNoContext);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'HomeOverview.noContext()';
  }
}

/// @nodoc

class HomeFacilitator implements HomeOverview {
  const HomeFacilitator({required this.context, this.session});

  final SessionContext context;
  final HomeSession? session;

  /// Create a copy of HomeOverview
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HomeFacilitatorCopyWith<HomeFacilitator> get copyWith =>
      _$HomeFacilitatorCopyWithImpl<HomeFacilitator>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HomeFacilitator &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.session, session) || other.session == session));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context, session);

  @override
  String toString() {
    return 'HomeOverview.facilitator(context: $context, session: $session)';
  }
}

/// @nodoc
abstract mixin class $HomeFacilitatorCopyWith<$Res>
    implements $HomeOverviewCopyWith<$Res> {
  factory $HomeFacilitatorCopyWith(
    HomeFacilitator value,
    $Res Function(HomeFacilitator) _then,
  ) = _$HomeFacilitatorCopyWithImpl;
  @useResult
  $Res call({SessionContext context, HomeSession? session});

  $SessionContextCopyWith<$Res> get context;
  $HomeSessionCopyWith<$Res>? get session;
}

/// @nodoc
class _$HomeFacilitatorCopyWithImpl<$Res>
    implements $HomeFacilitatorCopyWith<$Res> {
  _$HomeFacilitatorCopyWithImpl(this._self, this._then);

  final HomeFacilitator _self;
  final $Res Function(HomeFacilitator) _then;

  /// Create a copy of HomeOverview
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({Object? context = null, Object? session = freezed}) {
    return _then(
      HomeFacilitator(
        context: null == context
            ? _self.context
            : context // ignore: cast_nullable_to_non_nullable
                  as SessionContext,
        session: freezed == session
            ? _self.session
            : session // ignore: cast_nullable_to_non_nullable
                  as HomeSession?,
      ),
    );
  }

  /// Create a copy of HomeOverview
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SessionContextCopyWith<$Res> get context {
    return $SessionContextCopyWith<$Res>(_self.context, (value) {
      return _then(_self.copyWith(context: value));
    });
  }

  /// Create a copy of HomeOverview
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HomeSessionCopyWith<$Res>? get session {
    if (_self.session == null) {
      return null;
    }

    return $HomeSessionCopyWith<$Res>(_self.session!, (value) {
      return _then(_self.copyWith(session: value));
    });
  }
}

/// @nodoc

class HomeMember implements HomeOverview {
  const HomeMember({
    required this.context,
    this.session,
    this.lastCommitment,
    this.progress = const HomeProgress(),
  });

  final SessionContext context;
  final HomeSession? session;
  final HomeCommitment? lastCommitment;
  @JsonKey()
  final HomeProgress progress;

  /// Create a copy of HomeOverview
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HomeMemberCopyWith<HomeMember> get copyWith =>
      _$HomeMemberCopyWithImpl<HomeMember>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HomeMember &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.session, session) || other.session == session) &&
            (identical(other.lastCommitment, lastCommitment) ||
                other.lastCommitment == lastCommitment) &&
            (identical(other.progress, progress) ||
                other.progress == progress));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, context, session, lastCommitment, progress);

  @override
  String toString() {
    return 'HomeOverview.member(context: $context, session: $session, lastCommitment: $lastCommitment, progress: $progress)';
  }
}

/// @nodoc
abstract mixin class $HomeMemberCopyWith<$Res>
    implements $HomeOverviewCopyWith<$Res> {
  factory $HomeMemberCopyWith(
    HomeMember value,
    $Res Function(HomeMember) _then,
  ) = _$HomeMemberCopyWithImpl;
  @useResult
  $Res call({
    SessionContext context,
    HomeSession? session,
    HomeCommitment? lastCommitment,
    HomeProgress progress,
  });

  $SessionContextCopyWith<$Res> get context;
  $HomeSessionCopyWith<$Res>? get session;
  $HomeCommitmentCopyWith<$Res>? get lastCommitment;
  $HomeProgressCopyWith<$Res> get progress;
}

/// @nodoc
class _$HomeMemberCopyWithImpl<$Res> implements $HomeMemberCopyWith<$Res> {
  _$HomeMemberCopyWithImpl(this._self, this._then);

  final HomeMember _self;
  final $Res Function(HomeMember) _then;

  /// Create a copy of HomeOverview
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? context = null,
    Object? session = freezed,
    Object? lastCommitment = freezed,
    Object? progress = null,
  }) {
    return _then(
      HomeMember(
        context: null == context
            ? _self.context
            : context // ignore: cast_nullable_to_non_nullable
                  as SessionContext,
        session: freezed == session
            ? _self.session
            : session // ignore: cast_nullable_to_non_nullable
                  as HomeSession?,
        lastCommitment: freezed == lastCommitment
            ? _self.lastCommitment
            : lastCommitment // ignore: cast_nullable_to_non_nullable
                  as HomeCommitment?,
        progress: null == progress
            ? _self.progress
            : progress // ignore: cast_nullable_to_non_nullable
                  as HomeProgress,
      ),
    );
  }

  /// Create a copy of HomeOverview
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SessionContextCopyWith<$Res> get context {
    return $SessionContextCopyWith<$Res>(_self.context, (value) {
      return _then(_self.copyWith(context: value));
    });
  }

  /// Create a copy of HomeOverview
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HomeSessionCopyWith<$Res>? get session {
    if (_self.session == null) {
      return null;
    }

    return $HomeSessionCopyWith<$Res>(_self.session!, (value) {
      return _then(_self.copyWith(session: value));
    });
  }

  /// Create a copy of HomeOverview
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HomeCommitmentCopyWith<$Res>? get lastCommitment {
    if (_self.lastCommitment == null) {
      return null;
    }

    return $HomeCommitmentCopyWith<$Res>(_self.lastCommitment!, (value) {
      return _then(_self.copyWith(lastCommitment: value));
    });
  }

  /// Create a copy of HomeOverview
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HomeProgressCopyWith<$Res> get progress {
    return $HomeProgressCopyWith<$Res>(_self.progress, (value) {
      return _then(_self.copyWith(progress: value));
    });
  }
}

/// @nodoc

class HomeManager implements HomeOverview {
  const HomeManager({
    required this.context,
    this.kpis,
    this.pendingInvites = 0,
    final List<HomeTableAlert> alerts = const [],
  }) : _alerts = alerts;

  final SessionContext context;
  final HomeKpiSummary? kpis;
  @JsonKey()
  final int pendingInvites;
  final List<HomeTableAlert> _alerts;
  @JsonKey()
  List<HomeTableAlert> get alerts {
    if (_alerts is EqualUnmodifiableListView) return _alerts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_alerts);
  }

  /// Create a copy of HomeOverview
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HomeManagerCopyWith<HomeManager> get copyWith =>
      _$HomeManagerCopyWithImpl<HomeManager>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HomeManager &&
            (identical(other.context, context) || other.context == context) &&
            (identical(other.kpis, kpis) || other.kpis == kpis) &&
            (identical(other.pendingInvites, pendingInvites) ||
                other.pendingInvites == pendingInvites) &&
            const DeepCollectionEquality().equals(other._alerts, _alerts));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    context,
    kpis,
    pendingInvites,
    const DeepCollectionEquality().hash(_alerts),
  );

  @override
  String toString() {
    return 'HomeOverview.manager(context: $context, kpis: $kpis, pendingInvites: $pendingInvites, alerts: $alerts)';
  }
}

/// @nodoc
abstract mixin class $HomeManagerCopyWith<$Res>
    implements $HomeOverviewCopyWith<$Res> {
  factory $HomeManagerCopyWith(
    HomeManager value,
    $Res Function(HomeManager) _then,
  ) = _$HomeManagerCopyWithImpl;
  @useResult
  $Res call({
    SessionContext context,
    HomeKpiSummary? kpis,
    int pendingInvites,
    List<HomeTableAlert> alerts,
  });

  $SessionContextCopyWith<$Res> get context;
  $HomeKpiSummaryCopyWith<$Res>? get kpis;
}

/// @nodoc
class _$HomeManagerCopyWithImpl<$Res> implements $HomeManagerCopyWith<$Res> {
  _$HomeManagerCopyWithImpl(this._self, this._then);

  final HomeManager _self;
  final $Res Function(HomeManager) _then;

  /// Create a copy of HomeOverview
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? context = null,
    Object? kpis = freezed,
    Object? pendingInvites = null,
    Object? alerts = null,
  }) {
    return _then(
      HomeManager(
        context: null == context
            ? _self.context
            : context // ignore: cast_nullable_to_non_nullable
                  as SessionContext,
        kpis: freezed == kpis
            ? _self.kpis
            : kpis // ignore: cast_nullable_to_non_nullable
                  as HomeKpiSummary?,
        pendingInvites: null == pendingInvites
            ? _self.pendingInvites
            : pendingInvites // ignore: cast_nullable_to_non_nullable
                  as int,
        alerts: null == alerts
            ? _self._alerts
            : alerts // ignore: cast_nullable_to_non_nullable
                  as List<HomeTableAlert>,
      ),
    );
  }

  /// Create a copy of HomeOverview
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SessionContextCopyWith<$Res> get context {
    return $SessionContextCopyWith<$Res>(_self.context, (value) {
      return _then(_self.copyWith(context: value));
    });
  }

  /// Create a copy of HomeOverview
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HomeKpiSummaryCopyWith<$Res>? get kpis {
    if (_self.kpis == null) {
      return null;
    }

    return $HomeKpiSummaryCopyWith<$Res>(_self.kpis!, (value) {
      return _then(_self.copyWith(kpis: value));
    });
  }
}
