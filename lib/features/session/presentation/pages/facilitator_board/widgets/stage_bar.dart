import 'package:flutter/material.dart';

import '../../../../../../core/extensions/build_context_x.dart';
import '../../../../../../core/theme/app_spacing.dart';
import '../../../../domain/models/facilitator_stage.dart';
import '../board_texts.dart';

/// The five-segment stage bar used as the facilitator's control
/// (Abrir · Lista · Seguim. · Valor · Cierre). Tapping a reached stage views
/// its progress; the dock opens the next one.
class StageBar extends StatelessWidget {
  const StageBar({
    super.key,
    required this.current,
    required this.viewing,
    required this.isClosed,
    required this.isVerbal,
    required this.onSelect,
  });

  final FacilitatorStage current;
  final FacilitatorStage viewing;
  final bool isClosed;

  /// Offline: the bar is guidance for the room, drawn in grey.
  final bool isVerbal;
  final ValueChanged<FacilitatorStage> onSelect;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    return Container(
      padding: const EdgeInsets.all(AppSpacing.xs),
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(AppRadii.xl),
        border: Border.all(color: colors.line, width: 1.5),
      ),
      child: Row(
        children: [
          for (final stage in FacilitatorStage.values)
            Expanded(child: _buildSegment(context, stage)),
        ],
      ),
    );
  }

  bool _isDone(FacilitatorStage stage) =>
      isClosed || stage.index < current.index;

  Widget _buildSegment(BuildContext context, FacilitatorStage stage) {
    final l10n = context.l10n;
    final colors = context.colors;
    final status = context.statusColors;
    final done = _isDone(stage);
    final isCurrent = stage == current && !isClosed;
    final isViewed = stage == viewing && stage != current;
    final state = isCurrent
        ? l10n.sessionBoardStateCurrent
        : done
        ? l10n.sessionBoardStateDone
        : l10n.sessionBoardStatePending;
    final foreground = isCurrent
        ? (isVerbal ? status.onStatus : colors.onAccent)
        : done
        ? status.ok
        : colors.muted;
    final radius = BorderRadius.circular(AppRadii.lg);
    return Semantics(
      button: true,
      selected: isCurrent,
      label: l10n.sessionBoardStageSemantics(
        stage.number,
        stage.shortLabel(l10n),
        state,
      ),
      excludeSemantics: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: Material(
          color: Colors.transparent,
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: radius,
              gradient: isCurrent && !isVerbal ? colors.accentGradient : null,
              color: isCurrent && isVerbal
                  ? status.offline
                  : done
                  ? status.ok.withValues(alpha: 0.12)
                  : null,
              border: isViewed
                  ? Border.all(color: colors.accent, width: 2)
                  : null,
            ),
            child: InkWell(
              borderRadius: radius,
              onTap: () => onSelect(stage),
              child: SizedBox(
                height: 54,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    done
                        ? Icon(Icons.check_rounded, size: 18, color: foreground)
                        : Text(
                            '${stage.number}',
                            style: context.textTheme.titleMedium!.copyWith(
                              color: foreground,
                            ),
                          ),
                    Text(
                      stage.shortLabel(l10n).toUpperCase(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: context.textTheme.labelSmall!.copyWith(
                        color: foreground,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
