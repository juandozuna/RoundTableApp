import 'package:flutter/material.dart';

import '../extensions/build_context_x.dart';
import '../models/score_rules.dart';
import '../theme/app_spacing.dart';
import '../theme/status_tone.dart';
import 'status_border.dart';

/// Score picker 1–10 in two rows of five. The 5 key is locked (striped,
/// dashed, not selectable); tapping it explains why. Keys are at least
/// 54 px tall.
class ScoreGrid extends StatefulWidget {
  const ScoreGrid({
    super.key,
    required this.value,
    required this.onChanged,
    this.errorText,
  });

  final int? value;

  /// `null` disables the grid.
  final ValueChanged<int>? onChanged;
  final String? errorText;

  static const double keyHeight = 54;

  @override
  State<ScoreGrid> createState() => _ScoreGridState();
}

class _ScoreGridState extends State<ScoreGrid> {
  bool _triedFive = false;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final value = widget.value;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildRow(const [1, 2, 3, 4, 5]),
        const SizedBox(height: AppSpacing.xs + 2),
        _buildRow(const [6, 7, 8, 9, 10]),
        const SizedBox(height: AppSpacing.sm),
        _buildFootnote(context),
        if (value != null && ScoreRules.isAllowed(value))
          Padding(
            padding: const EdgeInsets.only(top: AppSpacing.xs + 2),
            child: Text(
              l10n.scorePicked(value),
              style: context.textTheme.labelMedium!.copyWith(
                color: context.colors.accent,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildRow(List<int> scores) {
    return Row(
      children: [
        for (final score in scores) ...[
          if (score != scores.first) const SizedBox(width: AppSpacing.xs + 2),
          Expanded(
            child: score == ScoreRules.forbidden
                ? _buildLockedKey(context)
                : _buildKey(context, score),
          ),
        ],
      ],
    );
  }

  Widget _buildKey(BuildContext context, int score) {
    final colors = context.colors;
    final selected = widget.value == score;
    final enabled = widget.onChanged != null;
    final radius = BorderRadius.circular(AppRadii.lg);
    return Semantics(
      button: true,
      selected: selected,
      enabled: enabled,
      label: context.l10n.scoreSemantics(score),
      onTap: enabled ? () => _select(score) : null,
      excludeSemantics: true,
      child: AnimatedScale(
        scale: selected ? 1.06 : 1,
        duration: const Duration(milliseconds: 120),
        child: Material(
          color: selected ? colors.accentStrong : colors.surface,
          shape: RoundedRectangleBorder(
            borderRadius: radius,
            side: BorderSide(
              color: selected ? colors.accentStrong : colors.border,
              width: 2,
            ),
          ),
          child: InkWell(
            key: ValueKey('score-$score'),
            borderRadius: radius,
            onTap: enabled ? () => _select(score) : null,
            child: SizedBox(
              height: ScoreGrid.keyHeight,
              child: Center(
                child: Text(
                  '$score',
                  style: context.textStyles.number.copyWith(
                    color: selected ? colors.onAccent : colors.ink,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLockedKey(BuildContext context) {
    final colors = context.colors;
    final radius = BorderRadius.circular(AppRadii.lg);
    return Semantics(
      button: true,
      enabled: false,
      label: context.l10n.scoreLockedSemantics,
      excludeSemantics: true,
      child: CustomPaint(
        foregroundPainter: StatusBorderPainter(
          color: colors.border,
          style: StatusLineStyle.dashed,
          width: 2,
          radius: AppRadii.lg,
        ),
        child: ClipRRect(
          borderRadius: radius,
          child: CustomPaint(
            painter: _StripesPainter(colors.surfaceAlt),
            child: InkWell(
              key: const ValueKey('score-locked'),
              borderRadius: radius,
              onTap: () => setState(() => _triedFive = true),
              child: SizedBox(
                height: ScoreGrid.keyHeight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.lock_rounded,
                      size: AppSizes.iconSm,
                      color: colors.muted,
                    ),
                    Text(
                      '${ScoreRules.forbidden}',
                      style: context.textTheme.labelMedium!.copyWith(
                        color: colors.muted,
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

  Widget _buildFootnote(BuildContext context) {
    final l10n = context.l10n;
    final error = widget.errorText;
    final warn = _triedFive || error != null;
    final color = warn ? context.statusColors.error : context.colors.muted;
    return Semantics(
      liveRegion: warn,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            warn ? Icons.error_rounded : Icons.info_outline_rounded,
            size: AppSizes.iconSm,
            color: color,
          ),
          const SizedBox(width: AppSpacing.xs + 2),
          Expanded(
            child: Text(
              error ??
                  (_triedFive ? l10n.scoreFiveExplanation : l10n.scoreHint),
              style: context.textTheme.bodySmall!.copyWith(
                color: color,
                fontWeight: warn ? FontWeight.w800 : null,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _select(int score) {
    if (!ScoreRules.isAllowed(score)) return;
    setState(() => _triedFive = false);
    widget.onChanged?.call(score);
  }
}

class _StripesPainter extends CustomPainter {
  const _StripesPainter(this.color);

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 6;
    for (var x = -size.height; x < size.width; x += 12) {
      canvas.drawLine(
        Offset(x, size.height),
        Offset(x + size.height, 0),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(_StripesPainter old) => old.color != color;
}
