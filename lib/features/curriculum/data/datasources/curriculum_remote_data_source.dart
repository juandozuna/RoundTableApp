import 'dart:convert';

import 'package:injectable/injectable.dart';

import '../../../../core/network/api_exception.dart';
import '../../../../core/network/api_guard.dart';
import '../../domain/models/curriculum_edit.dart';
import '../../domain/models/curriculum_plan.dart';
import '../../domain/models/curriculum_upload.dart';
import '../../domain/models/curriculum_view.dart';
import '../client/curriculum_client.dart';

/// Wire format of the curriculum administration API (api-contract.md §5).
@lazySingleton
class CurriculumRemoteDataSource {
  CurriculumRemoteDataSource(this._client);

  final CurriculumClient _client;

  Future<CurriculumView> load({String? locale}) async {
    final json = await guardApiCall(() => _client.curriculum(locale));
    return CurriculumView.fromJson(_object(json));
  }

  Future<CurriculumPlan> upload(
    CurriculumUpload upload, {
    required bool dryRun,
  }) async {
    final body = {
      ..._fileBody(upload),
      'dry_run': dryRun,
      if (upload.fileName != null) 'source': upload.fileName,
    };
    final locale = upload.locale;
    final json = await guardApiCall(
      () => locale == null
          ? _client.importCurriculum(body)
          : _client.importTranslations(locale, body),
    );
    return CurriculumPlan.fromJson(_object(json));
  }

  Future<bool> edit(CurriculumEdit edit) async {
    final body = {
      'locale': ?edit.locale,
      'name': ?edit.name,
      'description': ?edit.description,
      'booklet_reference': ?edit.bookletReference,
      'text': ?edit.text,
      if (edit.responseType != null) 'response_type': edit.responseType!.name,
      if (edit.status != null) 'status': edit.status!.wireValue,
    };
    final json = await guardApiCall(
      () => switch (edit.entity) {
        CurriculumEntity.module => _client.editModule(edit.id, body),
        CurriculumEntity.value => _client.editValue(edit.id, body),
        CurriculumEntity.question => _client.editQuestion(edit.id, body),
      },
    );
    return _object(json)['changed'] == true;
  }

  Future<void> addQuestion(NewQuestion question) async {
    await guardApiCall(
      () => _client.addQuestion(question.valueId, {
        'code': question.code,
        'text': question.text,
        'response_type': question.responseType.name,
      }),
    );
  }

  Future<void> addLanguage({required String code, required String name}) async {
    await guardApiCall(() => _client.addLocale({'code': code, 'name': name}));
  }

  Future<void> setLanguageActive(String code, {required bool active}) async {
    await guardApiCall(
      () => _client.updateLocale(code, {
        'status': active ? 'active' : 'inactive',
      }),
    );
  }

  /// JSON files go as `curriculum`, CSV files as `csv`; the server converts
  /// and validates both the same way.
  static Map<String, dynamic> _fileBody(CurriculumUpload upload) {
    if (upload.format == CurriculumFileFormat.csv) {
      return {'csv': upload.content};
    }
    try {
      final decoded = jsonDecode(upload.content);
      if (decoded is Map<String, dynamic>) return {'curriculum': decoded};
    } on FormatException {
      // Falls through to the typed error below.
    }
    throw const ApiException(
      kind: ApiErrorKind.validation,
      code: 'curriculum_invalid',
      message: 'El archivo no es un JSON válido.',
    );
  }

  static Map<String, dynamic> _object(dynamic json) {
    if (json is Map<String, dynamic>) return json;
    throw const ApiException(
      kind: ApiErrorKind.unknown,
      message: 'Respuesta inesperada del servidor.',
    );
  }
}
