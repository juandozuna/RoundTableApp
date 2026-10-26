import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/extensions/build_context_x.dart';
import '../../../../../core/theme/app_spacing.dart';
import '../../../../../core/theme/status_tone.dart';
import '../../../../../core/widgets/app_avatar.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_card.dart';
import '../../../../../core/widgets/app_dialogs.dart';
import '../../../../../core/widgets/app_scaffold.dart';
import '../../../../../core/widgets/app_toast.dart';
import '../../../../../core/widgets/role_chip.dart';
import '../../../../../core/widgets/status_pill.dart';
import '../../../domain/models/account_context.dart';
import '../../../domain/models/account_person.dart';
import '../../../domain/models/auth_provider.dart';
import '../../cubit/access_cubit.dart';
import '../../cubit/access_cubit_state.dart';
import '../../widgets/context_switcher.dart';
import '../../widgets/context_tile.dart';
import '../sign_out/sign_out_sheet.dart';

/// Who is signed in, which contexts they have, and sign-out.
class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocBuilder<AccessCubit, AccessCubitState>(
      builder: (context, state) => AppScaffold(
        title: l10n.authAccountTitle,
        actions: const [ContextSwitcher()],
        maxContentWidth: AppSpacing.contentMaxWidth,
        body: ListView(
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.lg),
          children: [
            _buildProfile(context, state),
            const SizedBox(height: AppSpacing.md),
            _buildPhone(context, state),
            const SizedBox(height: AppSpacing.md),
            _buildContexts(context, state),
            const SizedBox(height: AppSpacing.xl),
            AppButton(
              label: l10n.authSignOut,
              icon: Icons.logout_rounded,
              variant: AppButtonVariant.danger,
              fullWidth: false,
              onPressed: () => showSignOutSheet(context),
            ),
          ],
        ),
      ),
    );
  }

  AccountPerson? _activePerson(AccessCubitState state) {
    final personId = state.access.active?.personId;
    for (final person in state.access.people) {
      if (person.id == personId) return person;
    }
    return state.access.people.firstOrNull;
  }

  Widget _buildProfile(BuildContext context, AccessCubitState state) {
    final l10n = context.l10n;
    final provider = state.user?.provider;
    final name = state.displayName;
    final email = _activePerson(state)?.email ?? state.user?.email;
    return AppCard(
      child: Row(
        children: [
          AppAvatar(name: name.isEmpty ? '?' : name, size: 56),
          const SizedBox(width: AppSpacing.md + 2),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: context.textTheme.titleLarge),
                if (email != null)
                  Text(email, style: context.textTheme.bodySmall),
                if (provider != null)
                  Padding(
                    padding: const EdgeInsets.only(top: AppSpacing.sm),
                    child: StatusPill(
                      tone: StatusTone.ok,
                      icon: Icons.link_rounded,
                      label: l10n.authAccountLinked(
                        _providerName(context, provider),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _providerName(BuildContext context, AuthProvider provider) =>
      switch (provider) {
        AuthProvider.google => context.l10n.authProviderGoogle,
        AuthProvider.apple => context.l10n.authProviderApple,
        AuthProvider.facebook => context.l10n.authProviderFacebook,
      };

  Widget _buildPhone(BuildContext context, AccessCubitState state) {
    final phone = _activePerson(state)?.phone;
    if (phone == null || phone.isEmpty) return const SizedBox.shrink();
    final l10n = context.l10n;
    return AppCard(
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.authAccountPhone.toUpperCase(),
                  style: context.textStyles.kicker,
                ),
                Text(phone, style: context.textTheme.titleMedium),
              ],
            ),
          ),
          StatusPill(
            tone: StatusTone.pending,
            label: l10n.authAccountPhoneUnverified,
          ),
        ],
      ),
    );
  }

  Widget _buildContexts(BuildContext context, AccessCubitState state) {
    final l10n = context.l10n;
    final contexts = state.access.contexts;
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.authAccountContexts.toUpperCase(),
            style: context.textStyles.kicker,
          ),
          const SizedBox(height: AppSpacing.sm),
          for (final option in contexts)
            Padding(
              padding: const EdgeInsets.only(top: AppSpacing.xs),
              child: Row(
                children: [
                  AppAvatar(name: ContextTile.scopeLabel(context, option)),
                  const SizedBox(width: AppSpacing.md),
                  Expanded(
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: RoleChip.labelFor(context, option.kind),
                            style: context.textTheme.labelLarge,
                          ),
                          TextSpan(
                            text:
                                ' · ${ContextTile.scopeLabel(context, option)}',
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (option.key == state.access.active?.key)
                    StatusPill(
                      tone: StatusTone.info,
                      showIcon: false,
                      label: l10n.authAccountCurrent,
                    ),
                ],
              ),
            ),
          if (state.access.hasSeveralContexts) ...[
            const SizedBox(height: AppSpacing.md),
            AppButton(
              label: l10n.authContextChange,
              variant: AppButtonVariant.secondary,
              size: AppButtonSize.small,
              fullWidth: false,
              onPressed: () => _switch(context, state),
            ),
          ],
        ],
      ),
    );
  }

  Future<void> _switch(BuildContext context, AccessCubitState state) async {
    final cubit = context.read<AccessCubit>();
    final chosen = await AppDialogs.showSheet<AccountContext>(
      context,
      title: context.l10n.authContextSwitchTitle,
      builder: (sheetContext) => ContextOptions(
        contexts: state.access.contexts,
        activeKey: state.access.active?.key,
        onPicked: (picked) => Navigator.of(sheetContext).pop(picked),
      ),
    );
    if (chosen == null || chosen.key == state.access.active?.key) return;
    await cubit.select(chosen);
    if (!context.mounted) return;
    AppToast.show(
      context,
      context.l10n.authContextSwitched(
        RoleChip.labelFor(context, chosen.kind),
        ContextTile.scopeLabel(context, chosen),
      ),
      kind: AppToastKind.success,
    );
  }
}
