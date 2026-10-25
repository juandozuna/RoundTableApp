import 'package:flutter/material.dart';

import 'app_palette.dart';
import 'status_tone.dart';

/// Status colours. Read with `context.statusColors`.
@immutable
class StatusColors extends ThemeExtension<StatusColors> {
  const StatusColors({
    required this.ok,
    required this.pending,
    required this.syncing,
    required this.late,
    required this.offline,
    required this.error,
    required this.info,
    required this.cyan,
    required this.lilac,
    required this.neutral,
    required this.onStatus,
  });

  factory StatusColors.fromPalette(AppPalette p) => StatusColors(
    ok: p.lime,
    pending: p.amber,
    syncing: p.acc,
    late: p.mag,
    offline: p.off,
    error: p.err,
    info: p.sky,
    cyan: p.cyan,
    lilac: p.lilac,
    neutral: p.bd,
    onStatus: p.onc,
  );

  final Color ok;
  final Color pending;
  final Color syncing;
  final Color late;
  final Color offline;
  final Color error;
  final Color info;
  final Color cyan;
  final Color lilac;
  final Color neutral;

  /// Content drawn on a solid status fill.
  final Color onStatus;

  Color of(StatusTone tone) => switch (tone) {
    StatusTone.ok => ok,
    StatusTone.pending => pending,
    StatusTone.syncing => syncing,
    StatusTone.late => late,
    StatusTone.offline => offline,
    StatusTone.error => error,
    StatusTone.info => info,
    StatusTone.neutral => neutral,
  };

  @override
  StatusColors copyWith({
    Color? ok,
    Color? pending,
    Color? syncing,
    Color? late,
    Color? offline,
    Color? error,
    Color? info,
    Color? cyan,
    Color? lilac,
    Color? neutral,
    Color? onStatus,
  }) => StatusColors(
    ok: ok ?? this.ok,
    pending: pending ?? this.pending,
    syncing: syncing ?? this.syncing,
    late: late ?? this.late,
    offline: offline ?? this.offline,
    error: error ?? this.error,
    info: info ?? this.info,
    cyan: cyan ?? this.cyan,
    lilac: lilac ?? this.lilac,
    neutral: neutral ?? this.neutral,
    onStatus: onStatus ?? this.onStatus,
  );

  @override
  StatusColors lerp(StatusColors? other, double t) {
    if (other == null) return this;
    Color mix(Color a, Color b) => Color.lerp(a, b, t)!;
    return StatusColors(
      ok: mix(ok, other.ok),
      pending: mix(pending, other.pending),
      syncing: mix(syncing, other.syncing),
      late: mix(late, other.late),
      offline: mix(offline, other.offline),
      error: mix(error, other.error),
      info: mix(info, other.info),
      cyan: mix(cyan, other.cyan),
      lilac: mix(lilac, other.lilac),
      neutral: mix(neutral, other.neutral),
      onStatus: mix(onStatus, other.onStatus),
    );
  }
}
