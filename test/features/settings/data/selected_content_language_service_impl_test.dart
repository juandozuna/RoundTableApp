import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/features/settings/data/datasources/content_language_local_data_source.dart';
import 'package:gold_roundtables/features/settings/data/services/selected_content_language_service_impl.dart';
import 'package:gold_roundtables/features/settings/domain/models/content_language.dart';
import 'package:mocktail/mocktail.dart';

class _MockLocal extends Mock implements ContentLanguageLocalDataSource {}

void main() {
  late _MockLocal local;
  late SelectedContentLanguageServiceImpl service;

  setUp(() {
    local = _MockLocal();
    service = SelectedContentLanguageServiceImpl(local);
  });

  test('returns the code stored on the device', () async {
    when(() => local.readSelected()).thenAnswer((_) async => 'en');

    expect(await service.readCode(), 'en');
  });

  test('returns Spanish when nothing was chosen', () async {
    when(() => local.readSelected()).thenAnswer((_) async => null);

    expect(await service.readCode(), ContentLanguageChoice.baseCode);
  });

  test('returns Spanish when the stored choice cannot be read', () async {
    when(() => local.readSelected()).thenThrow(StateError('prefs'));

    expect(await service.readCode(), ContentLanguageChoice.baseCode);
  });
}
