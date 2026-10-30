import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/network/api_exception.dart';
import 'package:gold_roundtables/core/services/file_pick/file_pick_service.dart';
import 'package:gold_roundtables/features/curriculum/domain/models/curriculum_edit.dart';
import 'package:gold_roundtables/features/curriculum/domain/models/curriculum_plan.dart';
import 'package:gold_roundtables/features/curriculum/domain/models/curriculum_upload.dart';
import 'package:gold_roundtables/features/curriculum/domain/use_cases/curriculum/add_curriculum_question_use_case.dart';
import 'package:gold_roundtables/features/curriculum/domain/use_cases/curriculum/edit_curriculum_item_use_case.dart';
import 'package:gold_roundtables/features/curriculum/domain/use_cases/curriculum/load_curriculum_use_case.dart';
import 'package:gold_roundtables/features/curriculum/domain/use_cases/curriculum/share_curriculum_export_use_case.dart';
import 'package:gold_roundtables/features/curriculum/domain/use_cases/languages/add_content_language_use_case.dart';
import 'package:gold_roundtables/features/curriculum/domain/use_cases/languages/set_content_language_active_use_case.dart';
import 'package:gold_roundtables/features/curriculum/domain/use_cases/upload/apply_curriculum_upload_use_case.dart';
import 'package:gold_roundtables/features/curriculum/domain/use_cases/upload/pick_curriculum_file_use_case.dart';
import 'package:gold_roundtables/features/curriculum/domain/use_cases/upload/preview_curriculum_upload_use_case.dart';
import 'package:gold_roundtables/features/curriculum/presentation/pages/curriculum/cubit/curriculum_cubit.dart';
import 'package:gold_roundtables/features/curriculum/presentation/pages/curriculum/cubit/curriculum_state.dart';
import 'package:gold_roundtables/features/curriculum/presentation/pages/curriculum_upload/cubit/curriculum_upload_cubit.dart';
import 'package:gold_roundtables/features/curriculum/presentation/pages/curriculum_upload/cubit/curriculum_upload_state.dart';
import 'package:mocktail/mocktail.dart';

import '../fixtures.dart';

class _Load extends Mock implements LoadCurriculumUseCase {}

class _Edit extends Mock implements EditCurriculumItemUseCase {}

class _AddQuestion extends Mock implements AddCurriculumQuestionUseCase {}

class _AddLanguage extends Mock implements AddContentLanguageUseCase {}

class _SetActive extends Mock implements SetContentLanguageActiveUseCase {}

class _Share extends Mock implements ShareCurriculumExportUseCase {}

class _Pick extends Mock implements PickCurriculumFileUseCase {}

class _Preview extends Mock implements PreviewCurriculumUploadUseCase {}

class _Apply extends Mock implements ApplyCurriculumUploadUseCase {}

class _FakeEdit extends Fake implements CurriculumEdit {}

class _FakeUpload extends Fake implements CurriculumUpload {}

const _failure = ApiException(
  kind: ApiErrorKind.validation,
  code: 'curriculum_locked',
  message: 'No se puede',
);

void main() {
  setUpAll(() {
    registerFallbackValue(_FakeEdit());
    registerFallbackValue(_FakeUpload());
  });

  group('CurriculumCubit', () {
    late _Load load;
    late _Edit edit;
    late _AddLanguage addLanguage;

    setUp(() {
      load = _Load();
      edit = _Edit();
      addLanguage = _AddLanguage();
      when(
        () => load(locale: any(named: 'locale')),
      ).thenAnswer((_) async => sampleView());
    });

    CurriculumCubit build() => CurriculumCubit(
      load,
      edit,
      _AddQuestion(),
      addLanguage,
      _SetActive(),
      _Share(),
    );

    blocTest<CurriculumCubit, CurriculumState>(
      'load shows the curriculum of the chosen language',
      build: build,
      act: (c) => c.load(locale: 'en'),
      expect: () => [
        const CurriculumState(locale: 'en'),
        CurriculumState(
          locale: 'en',
          status: CurriculumStatus.ready,
          view: sampleView(),
        ),
      ],
    );

    blocTest<CurriculumCubit, CurriculumState>(
      'a failed load can be retried',
      setUp: () =>
          when(() => load(locale: any(named: 'locale'))).thenThrow(_failure),
      build: build,
      act: (c) => c.load(),
      expect: () => [
        const CurriculumState(),
        const CurriculumState(
          status: CurriculumStatus.failure,
          error: _failure,
        ),
      ],
    );

    blocTest<CurriculumCubit, CurriculumState>(
      'an edit saves, reloads and announces once',
      setUp: () => when(() => edit(any())).thenAnswer((_) async => true),
      build: build,
      seed: () =>
          CurriculumState(status: CurriculumStatus.ready, view: sampleView()),
      act: (c) => c.edit(
        const CurriculumEdit(
          entity: CurriculumEntity.module,
          id: 'm1',
          name: 'x',
        ),
      ),
      expect: () => [
        isA<CurriculumState>().having((s) => s.saving, 'saving', true),
        isA<CurriculumState>()
            .having((s) => s.saving, 'saving', false)
            .having((s) => s.notice, 'notice', CurriculumNotice.saved),
        isA<CurriculumState>().having((s) => s.notice, 'notice', isNull),
      ],
      verify: (_) => verify(() => load(locale: null)).called(1),
    );

    blocTest<CurriculumCubit, CurriculumState>(
      'an edit that changes nothing says so',
      setUp: () => when(() => edit(any())).thenAnswer((_) async => false),
      build: build,
      act: (c) => c.edit(
        const CurriculumEdit(
          entity: CurriculumEntity.module,
          id: 'm1',
          name: 'x',
        ),
      ),
      expect: () => [
        isA<CurriculumState>().having((s) => s.saving, 'saving', true),
        isA<CurriculumState>().having(
          (s) => s.notice,
          'notice',
          CurriculumNotice.unchanged,
        ),
        isA<CurriculumState>().having((s) => s.notice, 'notice', isNull),
      ],
    );

    blocTest<CurriculumCubit, CurriculumState>(
      'a refused edit surfaces the server error and keeps the view',
      setUp: () => when(() => edit(any())).thenThrow(_failure),
      build: build,
      seed: () =>
          CurriculumState(status: CurriculumStatus.ready, view: sampleView()),
      act: (c) => c.edit(
        const CurriculumEdit(entity: CurriculumEntity.question, id: 'q1'),
      ),
      expect: () => [
        isA<CurriculumState>().having((s) => s.saving, 'saving', true),
        isA<CurriculumState>().having((s) => s.error, 'error', _failure),
        isA<CurriculumState>().having((s) => s.error, 'error', isNull),
      ],
      verify: (c) => expect(c.state.view, isNotNull),
    );

    blocTest<CurriculumCubit, CurriculumState>(
      'adding a language switches to it',
      setUp: () => when(
        () => addLanguage(
          code: any(named: 'code'),
          name: any(named: 'name'),
        ),
      ).thenAnswer((_) async {}),
      build: build,
      act: (c) => c.addLanguage(code: 'pt', name: 'Português'),
      verify: (c) {
        expect(c.state.locale, 'pt');
        verify(() => load(locale: 'pt')).called(1);
      },
    );
  });

  group('CurriculumUploadCubit', () {
    late _Pick pick;
    late _Preview preview;
    late _Apply apply;

    setUp(() {
      pick = _Pick();
      preview = _Preview();
      apply = _Apply();
    });

    CurriculumUploadCubit build() =>
        CurriculumUploadCubit(pick, preview, apply);

    const plan = CurriculumPlan(
      changes: [
        CurriculumChange(
          entity: CurriculumEntity.value,
          key: '1',
          action: CurriculumChangeAction.update,
        ),
      ],
    );

    blocTest<CurriculumUploadCubit, CurriculumUploadState>(
      'a chosen file fills the text box',
      setUp: () => when(() => pick()).thenAnswer(
        (_) async => const PickedTextFile(name: 'c.json', content: '{}'),
      ),
      build: build,
      act: (c) => c.pickFile(),
      expect: () => [
        const CurriculumUploadState(fileName: 'c.json', pickedContent: '{}'),
      ],
    );

    blocTest<CurriculumUploadCubit, CurriculumUploadState>(
      'closing the chooser changes nothing',
      setUp: () => when(() => pick()).thenAnswer((_) async => null),
      build: build,
      act: (c) => c.pickFile(),
      expect: () => <CurriculumUploadState>[],
    );

    blocTest<CurriculumUploadCubit, CurriculumUploadState>(
      'review shows the diff and writes nothing; editing the text drops it',
      setUp: () => when(() => preview(any())).thenAnswer((_) async => plan),
      build: build,
      act: (c) async {
        await c.preview('{}', locale: 'en');
        c.contentChanged();
      },
      expect: () => [
        const CurriculumUploadState(status: CurriculumUploadStatus.previewing),
        const CurriculumUploadState(
          status: CurriculumUploadStatus.previewed,
          plan: plan,
        ),
        const CurriculumUploadState(),
      ],
      verify: (_) {
        final upload =
            verify(() => preview(captureAny())).captured.single
                as CurriculumUpload;
        expect(upload.locale, 'en');
        verifyNever(() => apply(any()));
      },
    );

    blocTest<CurriculumUploadCubit, CurriculumUploadState>(
      'a refused preview returns to editing with the error',
      setUp: () => when(() => preview(any())).thenThrow(_failure),
      build: build,
      act: (c) => c.preview('{}'),
      expect: () => [
        const CurriculumUploadState(status: CurriculumUploadStatus.previewing),
        const CurriculumUploadState(error: _failure),
      ],
    );

    blocTest<CurriculumUploadCubit, CurriculumUploadState>(
      'apply finishes the upload',
      setUp: () => when(() => apply(any())).thenAnswer(
        (_) async => const CurriculumPlan(dryRun: false, applied: true),
      ),
      build: build,
      act: (c) => c.apply('{}'),
      expect: () => [
        const CurriculumUploadState(status: CurriculumUploadStatus.applying),
        isA<CurriculumUploadState>().having(
          (s) => s.status,
          'status',
          CurriculumUploadStatus.applied,
        ),
      ],
    );

    blocTest<CurriculumUploadCubit, CurriculumUploadState>(
      'a refusal while applying keeps the diff on screen',
      setUp: () => when(() => apply(any())).thenThrow(_failure),
      build: build,
      seed: () => const CurriculumUploadState(
        status: CurriculumUploadStatus.previewed,
        plan: plan,
      ),
      act: (c) => c.apply('{}'),
      expect: () => [
        const CurriculumUploadState(
          status: CurriculumUploadStatus.applying,
          plan: plan,
        ),
        const CurriculumUploadState(
          status: CurriculumUploadStatus.previewed,
          plan: plan,
          error: _failure,
        ),
      ],
    );
  });

  test('the file format is detected from the content', () {
    expect(
      CurriculumFileFormat.detect('  {"modules": []}'),
      CurriculumFileFormat.json,
    );
    expect(
      CurriculumFileFormat.detect('kind,module\n'),
      CurriculumFileFormat.csv,
    );
  });
}
