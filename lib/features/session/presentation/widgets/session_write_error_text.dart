import '../../../../core/network/api_error_messages.dart';
import '../../../../core/network/api_exception.dart';
import '../../../../l10n/gen/app_localizations.dart';
import '../../domain/models/session_write_failure.dart';

/// Plain Spanish text for a session write that did not reach the server:
/// no connection ("No hay conexión con el servidor..."), a refusal with the
/// server's own words, or [fallback] for anything else.
String sessionWriteErrorText(
  AppLocalizations l10n,
  Object error, {
  required String fallback,
}) {
  if (error is SessionWriteFailure) {
    if (error.isOffline) return l10n.errorNetwork;
    return error.messages.isEmpty ? fallback : error.messages.join(' ');
  }
  if (error is ApiException) return error.userMessage(l10n);
  return fallback;
}
