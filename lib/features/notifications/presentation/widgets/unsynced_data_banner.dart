import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/config/injection.dart';
import '../../../../core/extensions/build_context_x.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/status_tone.dart';
import '../../../../core/widgets/app_message.dart';
import '../../domain/models/unsynced_alert.dart';
import '../cubit/unsynced_alert_cubit.dart';

/// In-app form of the "unsynced for more than 24 hours" alert (ADR 0009 #3).
/// Renders nothing while there is nothing to warn about.
class UnsyncedDataBanner extends StatelessWidget {
  const UnsyncedDataBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<UnsyncedAlertCubit>(),
      child: BlocBuilder<UnsyncedAlertCubit, UnsyncedAlert?>(
        builder: (context, alert) {
          if (alert == null) return const SizedBox.shrink();
          return Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.lg),
            child: AppMessage(
              tone: StatusTone.late,
              title: context.l10n.notificationsUnsyncedTitle,
              detail: context.l10n.notificationsUnsyncedDetail(
                alert.pendingCount,
              ),
              icon: Icons.cloud_off_rounded,
            ),
          );
        },
      ),
    );
  }
}
