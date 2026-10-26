import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/extensions/build_context_x.dart';
import '../../../../../core/theme/app_spacing.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../cubit/access_cubit.dart';
import '../../cubit/access_cubit_state.dart';
import '../../widgets/auth_flow_layout.dart';
import '../../widgets/context_tile.dart';
import '../sign_out/sign_out_sheet.dart';

/// Full-screen picker shown on the first sign-in of someone with several
/// roles on this device. The choice is remembered; the header chip changes it.
class ContextPickerPage extends StatelessWidget {
  const ContextPickerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocBuilder<AccessCubit, AccessCubitState>(
      builder: (context, state) {
        final name = state.firstName;
        return AuthFlowLayout(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                l10n.authPickerKicker.toUpperCase(),
                style: context.textStyles.kicker,
              ),
              const SizedBox(height: AppSpacing.xs),
              Semantics(
                header: true,
                child: Text(
                  l10n.authPickerTitle,
                  style: context.textTheme.displaySmall,
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                name.isEmpty
                    ? l10n.authPickerBodyAnonymous
                    : l10n.authPickerBody(name),
                style: context.textTheme.bodyMedium!.copyWith(
                  color: context.colors.muted,
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              for (final option in state.access.contexts)
                Padding(
                  padding: const EdgeInsets.only(top: AppSpacing.sm + 2),
                  child: ContextTile(
                    context_: option,
                    showDescription: true,
                    onTap: () => context.read<AccessCubit>().select(option),
                  ),
                ),
              const SizedBox(height: AppSpacing.md),
              AppButton(
                label: name.isEmpty
                    ? l10n.authSignOut
                    : l10n.authPickerNotMe(name),
                icon: Icons.logout_rounded,
                variant: AppButtonVariant.ghost,
                onPressed: () => showSignOutSheet(context),
              ),
            ],
          ),
        );
      },
    );
  }
}
