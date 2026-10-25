import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import '../../l10n/gen/app_localizations.dart';
import '../constants/app_constants.dart';
import 'field_error.dart';
import 'field_formatters.dart';
import 'field_transformers.dart';
import 'field_validators.dart';

/// The kind of value a text field holds. Selecting a kind selects its
/// keyboard, formatters, transformer and validator in one place, so screens
/// never declare their own regexes (AGENTS.md §14).
enum AppFieldKind {
  text,
  email,
  phone,
  personName,
  shortText,
  inviteCode;

  TextInputType get keyboardType => switch (this) {
    AppFieldKind.email => TextInputType.emailAddress,
    AppFieldKind.phone => TextInputType.phone,
    AppFieldKind.personName => TextInputType.name,
    AppFieldKind.shortText => TextInputType.multiline,
    AppFieldKind.inviteCode => TextInputType.visiblePassword,
    AppFieldKind.text => TextInputType.text,
  };

  TextCapitalization get textCapitalization => switch (this) {
    AppFieldKind.personName => TextCapitalization.words,
    AppFieldKind.shortText || AppFieldKind.text => TextCapitalization.sentences,
    AppFieldKind.inviteCode => TextCapitalization.characters,
    AppFieldKind.email || AppFieldKind.phone => TextCapitalization.none,
  };

  Iterable<String>? get autofillHints => switch (this) {
    AppFieldKind.email => const [AutofillHints.email],
    AppFieldKind.phone => const [AutofillHints.telephoneNumber],
    AppFieldKind.personName => const [AutofillHints.name],
    _ => null,
  };

  List<TextInputFormatter> get inputFormatters => switch (this) {
    AppFieldKind.phone => [FieldFormatters.phone],
    AppFieldKind.inviteCode => [
      FieldFormatters.upperAlphanumeric(AppLimits.inviteCodeLength),
    ],
    _ => const [],
  };

  /// Value handed to the form on save: normalized, ready to store.
  String transform(String? raw) => switch (this) {
    AppFieldKind.email => FieldTransformers.email(raw),
    AppFieldKind.phone => FieldTransformers.phoneE164(raw),
    AppFieldKind.personName => FieldTransformers.personName(raw),
    AppFieldKind.inviteCode => FieldTransformers.inviteCode(raw),
    AppFieldKind.shortText ||
    AppFieldKind.text => FieldTransformers.trimmed(raw),
  };

  FieldError? validate(
    String? raw, {
    bool required = false,
    int minLength = AppLimits.shortTextMinLength,
  }) {
    if (required) {
      final missing = FieldValidators.required(raw);
      if (missing != null) return missing;
    }
    return switch (this) {
      AppFieldKind.email => FieldValidators.email(raw),
      AppFieldKind.phone => FieldValidators.phone(raw),
      AppFieldKind.personName => FieldValidators.personName(raw),
      AppFieldKind.inviteCode => FieldValidators.inviteCode(raw),
      AppFieldKind.shortText => FieldValidators.shortText(
        raw,
        minLength: minLength,
      ),
      AppFieldKind.text => null,
    };
  }

  /// A FormBuilder-compatible validator with localized messages.
  FormFieldValidator<String> validator(
    AppLocalizations l10n, {
    bool required = false,
    int minLength = AppLimits.shortTextMinLength,
  }) {
    return (raw) => validate(
      raw,
      required: required,
      minLength: minLength,
    )?.message(l10n, minLength: minLength);
  }
}
