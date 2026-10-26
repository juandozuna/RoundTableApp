import 'package:flutter/material.dart';

import '../../../../core/extensions/build_context_x.dart';
import '../../../../core/theme/status_tone.dart';
import '../../../../core/widgets/status_pill.dart';

/// Marks data that reached the server after the session (`synced_late`).
class LateSyncedPill extends StatelessWidget {
  const LateSyncedPill({super.key});

  @override
  Widget build(BuildContext context) =>
      StatusPill(tone: StatusTone.late, label: context.l10n.historyLateSynced);
}
