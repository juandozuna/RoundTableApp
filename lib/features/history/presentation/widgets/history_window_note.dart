import 'package:flutter/material.dart';

import '../../../../core/extensions/build_context_x.dart';
import '../../../../core/theme/status_tone.dart';
import '../../../../core/widgets/app_message.dart';

/// Tells the person how far back the offline history reaches: sessions
/// older than 8 weeks leave the device (ADR 0005).
class HistoryWindowNote extends StatelessWidget {
  const HistoryWindowNote({super.key});

  @override
  Widget build(BuildContext context) => AppMessage(
    tone: StatusTone.info,
    title: context.l10n.historyWindowNote,
    icon: Icons.history_rounded,
  );
}
