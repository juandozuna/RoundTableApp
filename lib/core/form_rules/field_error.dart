import '../../l10n/gen/app_localizations.dart';
import '../constants/app_constants.dart';

/// A validation failure, independent of its localized wording.
enum FieldError {
  required,
  invalidEmail,
  invalidPhone,
  invalidPersonName,
  invalidScore,
  scoreFiveNotAllowed,
  tooShort,
  invalidInviteCode,
  passwordTooShort,
  passwordMismatch;

  String message(AppLocalizations l10n, {int minLength = 0}) => switch (this) {
    FieldError.required => l10n.validationRequired,
    FieldError.invalidEmail => l10n.validationEmail,
    FieldError.invalidPhone => l10n.validationPhone,
    FieldError.invalidPersonName => l10n.validationPersonName,
    FieldError.invalidScore => l10n.validationScore,
    FieldError.scoreFiveNotAllowed => l10n.validationScoreFive,
    FieldError.tooShort => l10n.validationTooShort(minLength),
    FieldError.invalidInviteCode => l10n.validationInviteCode,
    FieldError.passwordTooShort => l10n.validationPasswordTooShort(
      AppLimits.passwordMinLength,
    ),
    FieldError.passwordMismatch => l10n.validationPasswordMismatch,
  };
}
