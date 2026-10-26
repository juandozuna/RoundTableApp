import 'package:flutter/material.dart';

import '../../../../core/extensions/build_context_x.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/app_back_button.dart';
import 'auth_brand_mark.dart';

/// Layout of every pre-app screen (sign-in, invitations, context picker,
/// blocked states): one centred column on phones, brand pane plus column on
/// tablet and desktop.
class AuthFlowLayout extends StatelessWidget {
  const AuthFlowLayout({
    super.key,
    required this.child,
    this.title,
    this.backFallbackLocation,
    this.onBack,
    this.step,
    this.banner,
  });

  final Widget child;

  /// Text next to the back button.
  final String? title;

  /// Shows a back button that pops, or goes here when nothing can pop.
  final String? backFallbackLocation;

  /// Overrides the back action (e.g. back to the previous step).
  final VoidCallback? onBack;

  /// Progress indicator shown above [child].
  final Widget? step;

  /// Sits above the layout (offline banner).
  final Widget? banner;

  @override
  Widget build(BuildContext context) {
    final wide = MediaQuery.sizeOf(context).width >= 700;
    final column = _buildColumn(context, showBrand: !wide);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ?banner,
            Expanded(
              child: wide
                  ? Row(
                      children: [
                        Expanded(flex: 42, child: _buildBrandPane(context)),
                        Expanded(flex: 58, child: column),
                      ],
                    )
                  : column,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildColumn(BuildContext context, {required bool showBrand}) {
    final padding = showBrand ? AppSpacing.lg + 2 : AppSpacing.xxl + 8;
    final hasBar = backFallbackLocation != null || onBack != null;
    return Center(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: padding,
          vertical: AppSpacing.md,
        ),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 460),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (hasBar) _buildBar(context),
              if (step != null) ...[
                step!,
                const SizedBox(height: AppSpacing.md),
              ],
              if (showBrand && !hasBar) ...[
                const Padding(
                  padding: EdgeInsets.only(bottom: AppSpacing.lg),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: AuthBrandMark(),
                  ),
                ),
              ],
              child,
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: Row(
        children: [
          if (onBack != null)
            _BackAction(onPressed: onBack!)
          else
            AppBackButton(fallbackLocation: backFallbackLocation!),
          const SizedBox(width: AppSpacing.sm),
          if (title != null)
            Expanded(child: Text(title!, style: context.textTheme.titleMedium)),
        ],
      ),
    );
  }

  Widget _buildBrandPane(BuildContext context) {
    final colors = context.colors;
    return Container(
      padding: const EdgeInsets.all(AppSpacing.xxl + 4),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [colors.surfaceAlt, colors.backgroundAlt],
        ),
        border: Border(right: BorderSide(color: colors.line)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const AuthBrandMark(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.l10n.authBrandHeadline,
                style: context.textTheme.displaySmall,
              ),
              const SizedBox(height: AppSpacing.lg),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 380),
                child: Text(
                  context.l10n.authBrandBody,
                  style: context.textTheme.bodyLarge!.copyWith(
                    color: colors.muted,
                  ),
                ),
              ),
            ],
          ),
          Text(
            context.l10n.authBrandFooter,
            style: context.textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}

class _BackAction extends StatelessWidget {
  const _BackAction({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: context.l10n.tooltipBack,
      onPressed: onPressed,
      icon: const Icon(Icons.arrow_back_rounded),
    );
  }
}
