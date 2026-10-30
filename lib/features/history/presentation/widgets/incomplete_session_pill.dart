import 'package:flutter/material.dart';

import '../../../../core/extensions/build_context_x.dart';
import '../../../../core/theme/status_tone.dart';
import '../../../../core/widgets/status_pill.dart';

/// Marks a session that was closed before its answers stage (RF-50).
class IncompleteSessionPill extends StatelessWidget {
  const IncompleteSessionPill({super.key});

  @override
  Widget build(BuildContext context) => StatusPill(
    tone: StatusTone.pending,
    label: context.l10n.historySessionIncomplete,
  );
}
