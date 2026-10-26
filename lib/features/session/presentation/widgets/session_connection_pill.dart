import 'package:flutter/material.dart';

import '../../../../core/extensions/build_context_x.dart';
import '../../../../core/theme/status_tone.dart';
import '../../../../core/widgets/status_pill.dart';
import '../pages/session/cubit/session_state.dart';

/// "En vivo / Sin internet / Sincronizando / Por sincronizar" for this phone.
class SessionConnectionPill extends StatelessWidget {
  const SessionConnectionPill({super.key, required this.view});

  final SessionView view;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    if (!view.isOnline) {
      return StatusPill(
        tone: StatusTone.offline,
        label: l10n.sessionSharedPillOffline,
      );
    }
    if (view.sync.uploading) {
      return StatusPill(
        tone: StatusTone.syncing,
        label: l10n.sessionSharedPillSyncing,
      );
    }
    if (view.sync.pendingCount > 0) {
      return StatusPill(
        tone: StatusTone.pending,
        label: l10n.sessionSharedPillPending,
        icon: Icons.cloud_upload_outlined,
      );
    }
    return view.isLive
        ? StatusPill(
            tone: StatusTone.ok,
            label: l10n.sessionSharedPillLive,
            icon: Icons.circle,
          )
        : StatusPill(
            tone: StatusTone.info,
            label: l10n.sessionSharedPillOnline,
          );
  }
}
