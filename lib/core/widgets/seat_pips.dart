import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import '../extensions/build_context_x.dart';
import '../theme/app_spacing.dart';

/// Seat meter "n/9": one pip per seat, accent when taken, error when the
/// table is over capacity. Includes the facilitator (ADR 0014).
class SeatPips extends StatelessWidget {
  const SeatPips({
    super.key,
    required this.taken,
    this.capacity = AppLimits.maxTableSeats,
    this.showLabel = true,
  });

  final int taken;
  final int capacity;
  final bool showLabel;

  bool get _isOver => taken > capacity;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final status = context.statusColors;
    final l10n = context.l10n;
    final pips = taken > capacity ? taken : capacity;
    final label = _isOver
        ? l10n.seatsOverCapacity(capacity)
        : l10n.seatsCount(taken, capacity);

    return Semantics(
      label: label,
      excludeSemantics: true,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (var i = 0; i < pips; i++)
            Padding(
              padding: const EdgeInsets.only(right: AppSpacing.xxs),
              child: Container(
                width: 6,
                height: 16,
                decoration: BoxDecoration(
                  color: i >= capacity
                      ? status.error
                      : i < taken
                      ? colors.accent
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(2),
                  border: Border.all(
                    color: i >= capacity
                        ? status.error
                        : i < taken
                        ? colors.accent
                        : colors.border,
                    width: 1.5,
                  ),
                ),
              ),
            ),
          if (showLabel) ...[
            const SizedBox(width: AppSpacing.sm),
            Text(
              l10n.seatsCount(taken, capacity),
              style: context.textStyles.pill.copyWith(
                color: _isOver ? status.error : colors.ink,
                fontFeatures: const [FontFeature.tabularFigures()],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
