import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/data/records/records.dart';
import 'package:gold_roundtables/features/session/data/assembly/curriculum_text.dart';
import 'package:gold_roundtables/features/session/data/services/live_session_service_impl.dart';
import 'package:gold_roundtables/features/session/domain/models/live_session.dart';

import '../../../core/data/support/online_data_stubs.dart';
import '../support/fake_session_reads.dart';
import '../support/fixed_clock.dart';
import '../support/session_fixture.dart';

CurriculumTranslationRecord _translation(
  String type,
  String id, {
  String locale = 'en',
  String? name,
  String? description,
  String? questionText,
}) => CurriculumTranslationRecord(
  id: 'tr-$id-$locale',
  locale: locale,
  entityType: type,
  entityId: id,
  name: name,
  description: description,
  questionText: questionText,
);

/// ADR 0017: curriculum text follows the content language chosen on the
/// device, falling back to the Spanish base text field by field.
void main() {
  late FakeSessionReads reads;
  late StubContentLanguageService language;

  setUp(() {
    reads = SessionFixture.seed(FakeSessionReads());
    language = StubContentLanguageService();
    reads.translationRecords.addAll([
      _translation(
        CurriculumText.valueType,
        Ids.value4,
        name: 'Responsibility',
      ),
      _translation(
        CurriculumText.questionType,
        Ids.q1,
        questionText: 'Who is an example of this value for you?',
      ),
      // Blank translated fields count as missing.
      _translation(CurriculumText.valueType, Ids.value3, name: '   '),
    ]);
  });

  Future<LiveSession> session() async {
    final harness = WatchHarness();
    final live = LiveSessionServiceImpl(
      reads,
      language,
      harness.watch,
      FixedClock(DateTime.utc(2026, 10, 29, 22, 30)),
    );
    return (await live.watch().firstWhere((s) => s != null))!;
  }

  test(
    'the session shows the translation, Spanish where it is missing',
    () async {
      language.selected = 'en';
      final shown = await session();

      expect(shown.value.name, 'Responsibility');
      expect(
        shown.questions.first.text,
        'Who is an example of this value for you?',
      );
      // Untranslated question and blank translated name fall back to Spanish.
      expect(shown.questions.last.text, '¿Por qué te diste ese puntaje?');
      expect(shown.followUpValue?.name, 'Honestidad');
    },
  );

  test(
    'no translations for the chosen language: everything is Spanish',
    () async {
      language.selected = 'fr';
      final shown = await session();
      expect(shown.value.name, 'Responsabilidad');
      expect(
        shown.questions.first.text,
        '¿Quién es para ti un ejemplo de este valor?',
      );
    },
  );

  test('the Spanish base text reads no translations', () async {
    final shown = await session();
    expect(shown.value.name, 'Responsabilidad');
  });

  test('a language list that cannot be read shows Spanish', () async {
    language
      ..selected = 'en'
      ..unreadable = true;
    expect((await session()).value.name, 'Responsabilidad');
  });

  group('CurriculumText', () {
    test('translates field by field and trims', () {
      final text = CurriculumText([
        _translation(
          CurriculumText.valueType,
          Ids.value4,
          name: ' Responsibility ',
          description: '',
        ),
      ]);
      final base = SessionFixture.value(
        Ids.value4,
        4,
        'Responsabilidad',
      ).copyWith(description: 'Cumplir lo que prometo');

      final shown = text.value(base);
      expect(shown.name, 'Responsibility');
      expect(shown.description, 'Cumplir lo que prometo');
    });

    test('a translation of another kind of row is ignored', () {
      final text = CurriculumText([
        _translation(CurriculumText.questionType, Ids.value4, name: 'X'),
      ]);
      expect(
        text.value(SessionFixture.value(Ids.value4, 4, 'Responsabilidad')).name,
        'Responsabilidad',
      );
    });
  });
}
