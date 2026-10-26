import 'package:flutter/material.dart';

import '../../../../core/widgets/status_pill.dart';
import '../../domain/models/invite_status.dart';
import 'invite_labels.dart';

class InviteStatusPill extends StatelessWidget {
  const InviteStatusPill({super.key, required this.status});

  final InviteStatus status;

  @override
  Widget build(BuildContext context) {
    return StatusPill(
      tone: InviteLabels.tone(status),
      icon: InviteLabels.statusIcon(status),
      label: InviteLabels.status(context, status),
    );
  }
}
