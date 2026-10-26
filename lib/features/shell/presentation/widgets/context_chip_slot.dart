import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/config/injection.dart';
import '../../../../core/extensions/build_context_x.dart';
import '../../../../core/models/user_role.dart';
import '../../../../core/services/session_context/session_context.dart';
import '../../../../core/widgets/context_chip.dart';
import '../cubit/context_chip_cubit.dart';
import '../cubit/context_chip_state.dart';

/// Header slot for the active-context chip ("Estás como · Coordinador ·
/// Fundación Luz"). Static until the auth/context feature supplies [onTap]
/// to open its context switcher. Renders nothing without a context.
class ContextChipSlot extends StatelessWidget {
  const ContextChipSlot({super.key, this.onTap});

  /// Opens the context switcher; `null` renders the static chip.
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ContextChipCubit>(),
      child: BlocBuilder<ContextChipCubit, ContextChipState>(
        builder: (context, state) {
          final active = state.context;
          if (active == null) return const SizedBox.shrink();
          return ContextChip(
            role: active.role,
            contextName: _nameFor(context, active),
            onTap: onTap,
          );
        },
      ),
    );
  }

  String _nameFor(BuildContext context, SessionContext active) =>
      switch (active.role) {
        UserRole.facilitator ||
        UserRole.member => active.tableName ?? active.organizationName,
        UserRole.coordinator ||
        UserRole.administrator => active.organizationName,
      } ??
      context.l10n.contextChipPlatform;
}
