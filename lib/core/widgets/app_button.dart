import 'package:flutter/material.dart';

import '../extensions/build_context_x.dart';
import '../theme/app_colors.dart';
import '../theme/app_palette.dart';
import '../theme/app_spacing.dart';
import '../theme/status_colors.dart';
import '../theme/status_tone.dart';
import 'status_border.dart';

enum AppButtonVariant {
  /// Violet gradient: the one main action of a screen.
  primary,

  /// Surface with a border: alternative actions.
  secondary,

  /// Destructive actions.
  danger,

  /// Grey gradient: actions that work offline / verbal mode.
  offline,

  /// Text-like, bordered on hover/focus.
  ghost,
}

enum AppButtonSize {
  /// 44 px — inline actions.
  small,

  /// 48 px — default for secondary actions.
  medium,

  /// 56 px — primary call to action.
  large,
}

/// The app's button. Disabled when [onPressed] is null or [loading].
class AppButton extends StatefulWidget {
  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = AppButtonVariant.primary,
    this.size,
    this.icon,
    this.trailingIcon,
    this.fullWidth = true,
    this.loading = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;

  /// Defaults to [AppButtonSize.large] for primary, medium otherwise.
  final AppButtonSize? size;
  final IconData? icon;
  final IconData? trailingIcon;
  final bool fullWidth;
  final bool loading;

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool _focused = false;

  bool get _enabled => widget.onPressed != null && !widget.loading;

  AppButtonSize get _size =>
      widget.size ??
      (widget.variant == AppButtonVariant.primary
          ? AppButtonSize.large
          : AppButtonSize.medium);

  double get _height => switch (_size) {
    AppButtonSize.small => AppSizes.minTarget,
    AppButtonSize.medium => AppSizes.control,
    AppButtonSize.large => AppSizes.primaryAction,
  };

  double get _radius => _size == AppButtonSize.large ? 18 : AppRadii.md;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final status = context.statusColors;
    final style = _resolveStyle(colors, status);
    final radius = BorderRadius.circular(_radius);

    final button = Semantics(
      button: true,
      enabled: _enabled,
      label: widget.label,
      onTap: _enabled ? widget.onPressed : null,
      excludeSemantics: true,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 120),
        height: _height,
        decoration: BoxDecoration(
          color: style.fill,
          gradient: style.gradient,
          borderRadius: radius,
          border: style.border,
          boxShadow: [
            if (style.glow) BoxShadow(color: colors.glow, blurRadius: 24),
            if (_focused)
              BoxShadow(color: colors.accent, spreadRadius: 3, blurRadius: 0),
          ],
        ),
        child: CustomPaint(
          foregroundPainter: style.dashedBorder == null
              ? null
              : StatusBorderPainter(
                  color: style.dashedBorder!,
                  style: StatusLineStyle.dashed,
                  width: 2,
                  radius: _radius,
                ),
          child: Material(
            type: MaterialType.transparency,
            child: InkWell(
              borderRadius: radius,
              onTap: _enabled ? widget.onPressed : null,
              onFocusChange: (focused) => setState(() => _focused = focused),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: _buildLabel(context, style.foreground),
              ),
            ),
          ),
        ),
      ),
    );

    return widget.fullWidth
        ? SizedBox(width: double.infinity, child: button)
        : IntrinsicWidth(child: button);
  }

  Widget _buildLabel(BuildContext context, Color foreground) {
    final textStyle =
        (_size == AppButtonSize.large
                ? context.textStyles.primaryAction
                : context.textTheme.labelLarge!)
            .copyWith(color: foreground);
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (widget.loading)
          SizedBox.square(
            dimension: AppSizes.iconMd,
            child: CircularProgressIndicator(
              strokeWidth: 2.5,
              color: foreground,
            ),
          )
        else if (widget.icon != null)
          Icon(widget.icon, size: AppSizes.iconMd, color: foreground),
        if (widget.loading || widget.icon != null)
          const SizedBox(width: AppSpacing.sm),
        Flexible(
          child: Text(
            widget.label,
            style: textStyle,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ),
        if (widget.trailingIcon != null) ...[
          const SizedBox(width: AppSpacing.sm),
          Icon(widget.trailingIcon, size: AppSizes.iconMd, color: foreground),
        ],
      ],
    );
  }

  _ButtonStyle _resolveStyle(AppColors colors, StatusColors status) {
    if (!_enabled) {
      return _ButtonStyle(
        fill: colors.surfaceAlt,
        foreground: colors.muted,
        dashedBorder: widget.variant == AppButtonVariant.ghost
            ? null
            : status.offline,
      );
    }
    return switch (widget.variant) {
      AppButtonVariant.primary => _ButtonStyle(
        gradient: colors.accentGradient,
        foreground: colors.onAccent,
        glow: true,
      ),
      AppButtonVariant.secondary => _ButtonStyle(
        fill: colors.surfaceAlt,
        foreground: colors.ink,
        border: Border.all(color: colors.border, width: 2),
      ),
      AppButtonVariant.danger => _ButtonStyle(
        fill: status.error,
        foreground: status.onStatus,
      ),
      AppButtonVariant.offline => const _ButtonStyle(
        gradient: LinearGradient(colors: AppPalette.offlineGradient),
        foreground: Colors.white,
      ),
      AppButtonVariant.ghost => _ButtonStyle(
        foreground: colors.ink,
        border: _focused
            ? Border.all(color: colors.border, width: 2)
            : Border.all(color: Colors.transparent, width: 2),
      ),
    };
  }
}

class _ButtonStyle {
  const _ButtonStyle({
    required this.foreground,
    this.fill,
    this.gradient,
    this.border,
    this.dashedBorder,
    this.glow = false,
  });

  final Color foreground;
  final Color? fill;
  final Gradient? gradient;
  final BoxBorder? border;
  final Color? dashedBorder;
  final bool glow;
}
