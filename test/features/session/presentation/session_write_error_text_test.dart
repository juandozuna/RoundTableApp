import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/network/api_exception.dart';
import 'package:gold_roundtables/features/session/domain/models/session_write_failure.dart';
import 'package:gold_roundtables/features/session/presentation/widgets/session_write_error_text.dart';
import 'package:gold_roundtables/l10n/gen/app_localizations_es.dart';

void main() {
  final l10n = AppLocalizationsEs();

  String text(Object error) =>
      sessionWriteErrorText(l10n, error, fallback: 'No se pudo guardar.');

  test('offline is the existing connection message', () {
    expect(
      text(const SessionWriteFailure.offline()),
      'No hay conexión con el servidor. Revisa tu internet.',
    );
  });

  test('a refusal shows the server\'s own words', () {
    expect(
      text(const SessionWriteFailure.rejected(['La sesión ya se cerró.'])),
      'La sesión ya se cerró.',
    );
  });

  test('a refusal without words and unknown errors use the fallback', () {
    expect(text(const SessionWriteFailure.rejected([])), 'No se pudo guardar.');
    expect(text(StateError('x')), 'No se pudo guardar.');
  });

  test('a server error uses its category message', () {
    expect(
      text(const ApiException(kind: ApiErrorKind.server)),
      l10n.errorServer,
    );
  });
}
