import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/config/injection.dart';
import '../../../../core/extensions/build_context_x.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/app_dialogs.dart';
import '../../../../core/widgets/app_toast.dart';
import '../../../../core/widgets/context_chip.dart';
import '../../../../core/widgets/role_chip.dart';
import '../../domain/models/account_context.dart';
import '../cubit/access_cubit.dart';
import '../cubit/access_cubit_state.dart';
import 'context_tile.dart';

/// Header chip with the active context. With several contexts it opens a
/// bottom sheet on phones and an anchored menu on tablet and desktop; with
/// one it is static. Drop it into `AppScaffold.actions` or `titleWidget`.
class ContextSwitcher extends StatelessWidget {
  const ContextSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AccessCubit>(),
      child: _buildContextSwitcherView(context),
    );
  }

  Widget _buildContextSwitcherView(BuildContext context) {
    return BlocBuilder<AccessCubit, AccessCubitState>(
      buildWhen: (a, b) => a.access != b.access,
      builder: (context, state) {
        final active = state.access.active;
        if (active == null) return const SizedBox.shrink();
        return Builder(
          builder: (chipContext) => ContextChip(
            role: active.kind,
            contextName: ContextTile.scopeLabel(context, active),
            onTap: state.access.hasSeveralContexts
                ? () => _open(chipContext, state)
                : null,
          ),
        );
      },
    );
  }

  Future<void> _open(BuildContext chipContext, AccessCubitState state) async {
    final cubit = chipContext.read<AccessCubit>();
    final isPhone = chipContext.layout.isPhone;
    final Future<AccountContext?> picking = isPhone
        ? _showSheet(chipContext, state)
        : _showMenu(chipContext, state);
    final chosen = await picking;
    if (chosen == null || chosen.key == state.access.active?.key) return;
    await cubit.select(chosen);
    if (!chipContext.mounted) return;
    AppToast.show(
      chipContext,
      chipContext.l10n.authContextSwitched(
        RoleChip.labelFor(chipContext, chosen.kind),
        ContextTile.scopeLabel(chipContext, chosen),
      ),
      kind: AppToastKind.success,
    );
  }

  Future<AccountContext?> _showSheet(
    BuildContext context,
    AccessCubitState state,
  ) {
    return AppDialogs.showSheet<AccountContext>(
      context,
      title: context.l10n.authContextSwitchTitle,
      builder: (sheetContext) => ContextOptions(
        contexts: state.access.contexts,
        activeKey: state.access.active?.key,
        onPicked: (picked) => Navigator.of(sheetContext).pop(picked),
      ),
    );
  }

  Future<AccountContext?> _showMenu(
    BuildContext context,
    AccessCubitState state,
  ) {
    final box = context.findRenderObject()! as RenderBox;
    final overlay =
        Navigator.of(context).overlay!.context.findRenderObject()! as RenderBox;
    final topLeft = box.localToGlobal(Offset.zero, ancestor: overlay);
    final rect = Rect.fromLTWH(
      topLeft.dx,
      topLeft.dy + box.size.height + AppSpacing.xs,
      box.size.width,
      0,
    );
    return showMenu<AccountContext>(
      context: context,
      position: RelativeRect.fromRect(rect, Offset.zero & overlay.size),
      constraints: const BoxConstraints(minWidth: 320, maxWidth: 380),
      items: [
        for (final option in state.access.contexts)
          PopupMenuItem<AccountContext>(
            value: option,
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.sm,
              vertical: AppSpacing.xs,
            ),
            child: ContextTile(
              context_: option,
              selected: option.key == state.access.active?.key,
              onTap: () => Navigator.of(context).pop(option),
            ),
          ),
      ],
    );
  }
}

/// The list inside the switcher sheet, reused by the account page.
class ContextOptions extends StatelessWidget {
  const ContextOptions({
    super.key,
    required this.contexts,
    required this.activeKey,
    required this.onPicked,
  });

  final List<AccountContext> contexts;
  final String? activeKey;
  final ValueChanged<AccountContext> onPicked;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          context.l10n.authContextSwitchHint,
          style: context.textTheme.bodySmall,
        ),
        const SizedBox(height: AppSpacing.sm),
        for (final option in contexts)
          Padding(
            padding: const EdgeInsets.only(top: AppSpacing.sm),
            child: ContextTile(
              context_: option,
              selected: option.key == activeKey,
              onTap: () => onPicked(option),
            ),
          ),
      ],
    );
  }
}
