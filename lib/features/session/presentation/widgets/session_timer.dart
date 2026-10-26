import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../core/extensions/build_context_x.dart';
import '../../../../core/theme/app_spacing.dart';

/// Elapsed meeting time against the table's limit. Informative only: it
/// never blocks anything (session-flow brief).
class SessionTimer extends StatefulWidget {
  const SessionTimer({
    super.key,
    required this.startedAt,
    required this.limitMinutes,
    this.endedAt,
  });

  final DateTime? startedAt;
  final DateTime? endedAt;
  final int limitMinutes;

  @override
  State<SessionTimer> createState() => _SessionTimerState();
}

class _SessionTimerState extends State<SessionTimer> {
  Timer? _ticker;

  @override
  void initState() {
    super.initState();
    _ticker = Timer.periodic(
      const Duration(seconds: 1),
      (_) => widget.endedAt == null && mounted ? setState(() {}) : null,
    );
  }

  @override
  void dispose() {
    _ticker?.cancel();
    super.dispose();
  }

  Duration get _elapsed {
    final started = widget.startedAt;
    if (started == null) return Duration.zero;
    final end = widget.endedAt ?? DateTime.now().toUtc();
    final elapsed = end.difference(started);
    return elapsed.isNegative ? Duration.zero : elapsed;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final limit = Duration(minutes: widget.limitMinutes);
    final elapsed = _elapsed;
    final over = elapsed > limit;
    final accent = over ? context.statusColors.pending : context.colors.ink;
    return Semantics(
      container: true,
      label: SessionTimerFormat.format(elapsed),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: SessionTimerFormat.format(elapsed),
                  style: context.textStyles.number.copyWith(color: accent),
                ),
                TextSpan(
                  text:
                      ' ${l10n.sessionSharedTimerLimit(SessionTimerFormat.format(limit))}',
                  style: context.textTheme.bodySmall,
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.xxs),
          Text(
            over
                ? l10n.sessionSharedTimerOver(widget.limitMinutes)
                : l10n.sessionSharedTimerCaption,
            style: context.textTheme.bodySmall,
            textAlign: TextAlign.end,
          ),
        ],
      ),
    );
  }
}

/// "mm:ss" for a duration.
abstract final class SessionTimerFormat {
  static String format(Duration duration) {
    String two(int n) => n.toString().padLeft(2, '0');
    return '${two(duration.inMinutes)}:${two(duration.inSeconds % 60)}';
  }
}
