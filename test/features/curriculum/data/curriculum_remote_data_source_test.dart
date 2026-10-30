import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/network/api_exception.dart';
import 'package:gold_roundtables/features/admin/domain/models/record_status.dart';
import 'package:gold_roundtables/features/curriculum/data/client/curriculum_client.dart';
import 'package:gold_roundtables/features/curriculum/data/datasources/curriculum_remote_data_source.dart';
import 'package:gold_roundtables/features/curriculum/domain/models/curriculum_edit.dart';
import 'package:gold_roundtables/features/curriculum/domain/models/curriculum_plan.dart';
import 'package:gold_roundtables/features/curriculum/domain/models/curriculum_upload.dart';
import 'package:gold_roundtables/features/curriculum/domain/models/curriculum_view.dart';

import '../fixtures.dart';

class _Adapter implements HttpClientAdapter {
  final List<RequestOptions> requests = [];
  final List<({int status, Object? body})> replies = [];

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    requests.add(options);
    final reply = replies.isEmpty
        ? (status: 200, body: <String, dynamic>{})
        : replies.removeAt(0);
    return ResponseBody.fromString(
      jsonEncode(reply.body),
      reply.status,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );
  }

  @override
  void close({bool force = false}) {}
}

void main() {
  late _Adapter adapter;
  late CurriculumRemoteDataSource remote;

  setUp(() {
    adapter = _Adapter();
    remote = CurriculumRemoteDataSource(
      CurriculumClient(
        Dio(BaseOptions(baseUrl: 'http://x/functions/v1'))
          ..httpClientAdapter = adapter,
      ),
    );
  });

  test(
    'parses the curriculum with its translations and completeness',
    () async {
      adapter.replies.add((status: 200, body: viewJson));
      final view = await remote.load(locale: 'en');
      expect(adapter.requests.single.path, '/admin/curriculum');
      expect(adapter.requests.single.queryParameters['locale'], 'en');
      expect(view.modules.single.translation?.name, 'Character');
      final value = view.modules.single.values.single;
      expect(value.usedByClosedSessions, isTrue);
      expect(value.activeQuestions.map((q) => q.code), ['por_que']);
      expect(value.questions.last.responseType, QuestionResponseType.person);
      expect(value.questions.last.status, RecordStatus.inactive);
      expect(view.selectedLocale?.completeness?.percent, 50);
      expect(view.locales.first.isDefault, isTrue);
    },
  );

  test('a JSON file is sent as `curriculum`, a CSV file as `csv`', () async {
    final plan = {
      'dry_run': true,
      'applied': false,
      'changes': [
        {
          'entity': 'question',
          'key': '2/por_que',
          'label': '¿Por qué?',
          'action': 'deactivate',
          'answered': true,
        },
        {
          'entity': 'value',
          'key': '1',
          'label': 'Integridad',
          'action': 'update',
          'fields': {
            'name': {'from': 'a', 'to': 'b'},
          },
        },
      ],
      'refused': [
        {'key': '2/x', 'label': 'x', 'message': 'No se puede'},
      ],
    };
    adapter.replies
      ..add((status: 200, body: plan))
      ..add((status: 200, body: plan));
    final preview = await remote.upload(
      const CurriculumUpload(content: '{"modules": []}', fileName: 'a.json'),
      dryRun: true,
    );
    var request = adapter.requests.last;
    expect(request.path, '/admin/curriculum/import');
    expect(request.data, {
      'curriculum': {'modules': <Object>[]},
      'dry_run': true,
      'source': 'a.json',
    });
    expect(preview.changes.first.action, CurriculumChangeAction.deactivate);
    expect(preview.changes.first.answered, isTrue);
    expect(preview.changes.last.fields['name']?.to, 'b');
    expect(preview.canApply, isFalse, reason: 'refusals block the apply');

    await remote.upload(
      const CurriculumUpload(content: 'kind,module\nmodule,1', locale: 'en'),
      dryRun: false,
    );
    request = adapter.requests.last;
    expect(request.path, '/admin/curriculum/locales/en/import');
    expect(request.data, {'csv': 'kind,module\nmodule,1', 'dry_run': false});
  });

  test('a file that is not JSON is refused before any request', () {
    expect(
      () =>
          remote.upload(const CurriculumUpload(content: '{oops'), dryRun: true),
      throwsA(
        isA<ApiException>().having((e) => e.code, 'code', 'curriculum_invalid'),
      ),
    );
    expect(adapter.requests, isEmpty);
  });

  test('edits go to the entity route and send only the given fields', () async {
    adapter.replies.add((status: 200, body: {'changed': true}));
    final changed = await remote.edit(
      const CurriculumEdit(
        entity: CurriculumEntity.question,
        id: 'q1',
        locale: 'en',
        text: 'Why?',
      ),
    );
    final request = adapter.requests.single;
    expect(changed, isTrue);
    expect(request.method, 'PATCH');
    expect(request.path, '/admin/curriculum/questions/q1');
    expect(request.data, {'locale': 'en', 'text': 'Why?'});

    await remote.edit(
      const CurriculumEdit(
        entity: CurriculumEntity.value,
        id: 'v1',
        name: 'Integridad',
        description: '',
        bookletReference: 'M1',
      ),
    );
    expect(adapter.requests.last.path, '/admin/curriculum/values/v1');
    expect(adapter.requests.last.data, {
      'name': 'Integridad',
      'description': '',
      'booklet_reference': 'M1',
    });
  });

  test('questions and languages use their own routes', () async {
    await remote.addQuestion(
      const NewQuestion(
        valueId: 'v1',
        code: 'nueva',
        text: '¿Y ahora?',
        responseType: QuestionResponseType.person,
      ),
    );
    expect(adapter.requests.last.path, '/admin/curriculum/values/v1/questions');
    expect(adapter.requests.last.data, {
      'code': 'nueva',
      'text': '¿Y ahora?',
      'response_type': 'person',
    });
    await remote.addLanguage(code: 'en', name: 'English');
    expect(adapter.requests.last.path, '/admin/curriculum/locales');
    await remote.setLanguageActive('en', active: false);
    expect(adapter.requests.last.method, 'PATCH');
    expect(adapter.requests.last.data, {'status': 'inactive'});
  });

  test('server problems keep their code and Spanish message', () async {
    adapter.replies.add((
      status: 422,
      body: {
        'error': {
          'code': 'curriculum_invalid',
          'message': 'Se esperaban 5 módulos.',
        },
      },
    ));
    await expectLater(
      remote.upload(const CurriculumUpload(content: '{}'), dryRun: true),
      throwsA(
        isA<ApiException>()
            .having((e) => e.code, 'code', 'curriculum_invalid')
            .having((e) => e.message, 'message', 'Se esperaban 5 módulos.'),
      ),
    );
  });
}
