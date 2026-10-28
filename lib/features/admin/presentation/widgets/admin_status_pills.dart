import 'package:flutter/material.dart';

import '../../../../core/extensions/build_context_x.dart';
import '../../../../core/models/health_reason.dart';
import '../../../../core/models/health_status.dart';
import '../../../../core/theme/status_tone.dart';
import '../../../../core/widgets/status_pill.dart';
import '../../domain/models/organization_status.dart';
import '../../domain/models/person_status.dart';
import '../../domain/models/round_table_status.dart';

/// Table health from the KPI rollups: al día / retrasada / inactiva.
class HealthPill extends StatelessWidget {
  const HealthPill({super.key, required this.health});

  final HealthStatus health;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return switch (health) {
      HealthStatus.active => StatusPill(
        tone: StatusTone.ok,
        label: l10n.adminHealthActive,
      ),
      HealthStatus.delayed => StatusPill(
        tone: StatusTone.late,
        label: l10n.adminHealthDelayed,
        icon: Icons.schedule_rounded,
      ),
      HealthStatus.inactive => StatusPill(
        tone: StatusTone.offline,
        label: l10n.adminHealthInactive,
        icon: Icons.pause_circle_rounded,
      ),
      HealthStatus.completed => StatusPill(
        tone: StatusTone.info,
        label: l10n.adminHealthCompleted,
        icon: Icons.flag_rounded,
      ),
    };
  }
}

/// Why a table needs attention: one chip per reason, nothing when healthy.
class HealthReasonChips extends StatelessWidget {
  const HealthReasonChips({super.key, required this.reasons});

  final List<HealthReason> reasons;

  static String labelFor(BuildContext context, HealthReason reason) =>
      switch (reason) {
        HealthReason.lowAttendance => context.l10n.adminReasonLowAttendance,
        HealthReason.fewPeople => context.l10n.adminReasonFewPeople,
      };

  static IconData iconFor(HealthReason reason) => switch (reason) {
    HealthReason.lowAttendance => Icons.trending_down_rounded,
    HealthReason.fewPeople => Icons.groups_rounded,
  };

  @override
  Widget build(BuildContext context) {
    if (reasons.isEmpty) return const SizedBox.shrink();
    return Wrap(
      spacing: 6,
      runSpacing: 4,
      children: [
        for (final reason in reasons)
          StatusPill(
            tone: StatusTone.late,
            label: labelFor(context, reason),
            icon: iconFor(reason),
          ),
      ],
    );
  }
}

class TableStatusPill extends StatelessWidget {
  const TableStatusPill({super.key, required this.status});

  final RoundTableStatus status;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return switch (status) {
      RoundTableStatus.active => StatusPill(
        tone: StatusTone.ok,
        label: l10n.adminTableStatusActive,
      ),
      RoundTableStatus.paused => StatusPill(
        tone: StatusTone.pending,
        label: l10n.adminTableStatusPaused,
        icon: Icons.pause_circle_rounded,
      ),
      RoundTableStatus.completed => StatusPill(
        tone: StatusTone.info,
        label: l10n.adminTableStatusCompleted,
        icon: Icons.flag_rounded,
      ),
      RoundTableStatus.closed => StatusPill(
        tone: StatusTone.offline,
        label: l10n.adminTableStatusClosed,
        icon: Icons.block_rounded,
      ),
    };
  }
}

class OrganizationStatusPill extends StatelessWidget {
  const OrganizationStatusPill({super.key, required this.status});

  final OrganizationStatus status;

  static String labelFor(BuildContext context, OrganizationStatus status) {
    final l10n = context.l10n;
    return switch (status) {
      OrganizationStatus.active => l10n.adminOrgStatusActive,
      OrganizationStatus.paused => l10n.adminOrgStatusPaused,
      OrganizationStatus.inactive => l10n.adminOrgStatusInactive,
    };
  }

  @override
  Widget build(BuildContext context) {
    return switch (status) {
      OrganizationStatus.active => StatusPill(
        tone: StatusTone.ok,
        label: labelFor(context, status),
      ),
      OrganizationStatus.paused => StatusPill(
        tone: StatusTone.pending,
        label: labelFor(context, status),
        icon: Icons.pause_circle_rounded,
      ),
      OrganizationStatus.inactive => StatusPill(
        tone: StatusTone.error,
        label: labelFor(context, status),
        icon: Icons.block_rounded,
      ),
    };
  }
}

class PersonStatusPill extends StatelessWidget {
  const PersonStatusPill({super.key, required this.status});

  final PersonStatus status;

  static String labelFor(BuildContext context, PersonStatus status) {
    final l10n = context.l10n;
    return switch (status) {
      PersonStatus.active => l10n.adminPersonStatusActive,
      PersonStatus.invited => l10n.adminPersonStatusInvited,
      PersonStatus.inactive => l10n.adminPersonStatusInactive,
    };
  }

  @override
  Widget build(BuildContext context) {
    return switch (status) {
      PersonStatus.active => StatusPill(
        tone: StatusTone.ok,
        label: labelFor(context, status),
      ),
      PersonStatus.invited => StatusPill(
        tone: StatusTone.pending,
        label: labelFor(context, status),
      ),
      PersonStatus.inactive => StatusPill(
        tone: StatusTone.offline,
        label: labelFor(context, status),
        icon: Icons.block_rounded,
      ),
    };
  }
}
