import 'package:flutter/material.dart';

import '../../../../core/extensions/build_context_x.dart';
import '../../../../core/theme/status_tone.dart';
import '../../../../core/widgets/status_pill.dart';

/// Follow-up minus initial score: "+2" with an up arrow, "-1" with a down
/// arrow, "=" when unchanged. Never colour alone.
class ImprovementBadge extends StatelessWidget {
  const ImprovementBadge({super.key, required this.points});

  /// Null while there is no follow-up score yet.
  final int? points;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final change = points;
    if (change == null) {
      return StatusPill(
        tone: StatusTone.neutral,
        label: l10n.historyImprovementPending,
        icon: Icons.hourglass_empty_rounded,
      );
    }
    if (change > 0) {
      return StatusPill(
        tone: StatusTone.ok,
        label: '+$change · ${l10n.historyImprovementUp(change)}',
        icon: Icons.trending_up_rounded,
      );
    }
    if (change < 0) {
      return StatusPill(
        tone: StatusTone.pending,
        label: '$change · ${l10n.historyImprovementDown(-change)}',
        icon: Icons.trending_down_rounded,
      );
    }
    return StatusPill(
      tone: StatusTone.info,
      label: '0 · ${l10n.historyImprovementSame}',
      icon: Icons.trending_flat_rounded,
    );
  }
}
