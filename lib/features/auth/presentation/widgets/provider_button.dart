import 'package:flutter/material.dart';

import '../../../../core/extensions/build_context_x.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../domain/models/auth_provider.dart';

/// Branded "Continuar con …" button. Colours follow each provider's own
/// guidelines (white Google, black/white Apple, blue Facebook), not the app
/// theme, so they stay recognisable.
class ProviderButton extends StatelessWidget {
  const ProviderButton({
    super.key,
    required this.provider,
    required this.label,
    required this.onPressed,
    this.loading = false,
  });

  final AuthProvider provider;
  final String label;
  final VoidCallback? onPressed;
  final bool loading;

  static String nameOf(BuildContext context, AuthProvider provider) {
    final l10n = context.l10n;
    return switch (provider) {
      AuthProvider.google => l10n.authProviderGoogle,
      AuthProvider.apple => l10n.authProviderApple,
      AuthProvider.facebook => l10n.authProviderFacebook,
    };
  }

  @override
  Widget build(BuildContext context) {
    final (background, foreground, border) = switch (provider) {
      AuthProvider.google => (
        const Color(0xFFFFFFFF),
        const Color(0xFF1F1F1F),
        const Color(0xFFDADCE0),
      ),
      AuthProvider.apple => (
        context.colors.ink,
        context.colors.background,
        context.colors.ink,
      ),
      AuthProvider.facebook => (
        const Color(0xFF1763D6),
        const Color(0xFFFFFFFF),
        const Color(0xFF1763D6),
      ),
    };
    final enabled = onPressed != null && !loading;
    return Semantics(
      button: true,
      enabled: enabled,
      label: label,
      excludeSemantics: true,
      child: Opacity(
        opacity: onPressed == null && !loading ? 0.55 : 1,
        child: Material(
          color: background,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: border, width: 2),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: enabled ? onPressed : null,
            child: ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 54),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (loading)
                    SizedBox.square(
                      dimension: 22,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.5,
                        color: foreground,
                      ),
                    )
                  else
                    _Glyph(provider: provider, color: foreground),
                  const SizedBox(width: AppSpacing.md),
                  Flexible(
                    child: Text(
                      label,
                      overflow: TextOverflow.ellipsis,
                      style: context.textTheme.titleSmall!.copyWith(
                        color: foreground,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Glyph extends StatelessWidget {
  const _Glyph({required this.provider, required this.color});

  final AuthProvider provider;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return switch (provider) {
      AuthProvider.google => Text(
        'G',
        style: context.textTheme.titleLarge!.copyWith(
          color: const Color(0xFF4285F4),
        ),
      ),
      AuthProvider.apple => Icon(Icons.apple, color: color, size: 24),
      AuthProvider.facebook => Icon(Icons.facebook, color: color, size: 24),
    };
  }
}
