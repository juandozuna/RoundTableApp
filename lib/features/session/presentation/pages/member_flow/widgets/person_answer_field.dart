import 'package:flutter/material.dart';

import '../../../../../../core/extensions/build_context_x.dart';
import '../../../../../../core/theme/app_spacing.dart';
import '../../../../../../core/widgets/app_chip.dart';
import '../../../../domain/models/session_participant.dart';
import 'draft_text_field.dart';

/// Answer to a `person` question (RF-54): the people of the member's table as
/// chips (from the synced roster, so it works offline) and a text box for
/// someone else. Picking a chip fills the box with the name; typing replaces
/// the pick.
class PersonAnswerField extends StatelessWidget {
  const PersonAnswerField({
    super.key,
    required this.question,
    required this.people,
    required this.text,
    required this.pickedPersonId,
    required this.onPick,
    required this.onTyped,
    this.errorText,
  });

  final String question;

  /// People of the table the member can name (everyone but themselves).
  final List<SessionParticipant> people;
  final String text;
  final String? pickedPersonId;
  final void Function(SessionParticipant person) onPick;
  final ValueChanged<String> onTyped;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(question, style: context.textTheme.titleMedium),
        const SizedBox(height: AppSpacing.sm),
        Text(
          l10n.sessionMemberPersonPickHelper,
          style: context.textTheme.bodyMedium!.copyWith(
            color: context.colors.muted,
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Wrap(
          spacing: AppSpacing.sm,
          runSpacing: AppSpacing.sm,
          children: [
            for (final person in people)
              AppChip(
                key: ValueKey('person-${person.personId}'),
                label: person.fullName,
                selected: person.personId == pickedPersonId,
                onSelected: (_) => onPick(person),
              ),
          ],
        ),
        const SizedBox(height: AppSpacing.md),
        DraftTextField(
          key: const ValueKey('person-other'),
          label: l10n.sessionMemberPersonOtherLabel,
          hint: l10n.sessionMemberPersonOtherHint,
          text: text,
          maxLength: 140,
          maxLines: 1,
          errorText: errorText,
          onChanged: onTyped,
        ),
      ],
    );
  }
}
