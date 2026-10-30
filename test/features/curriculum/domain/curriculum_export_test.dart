import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/services/share/share_service.dart';
import 'package:gold_roundtables/features/curriculum/domain/use_cases/curriculum/share_curriculum_export_use_case.dart';

import '../fixtures.dart';

class _Share implements ShareService {
  String? text;

  @override
  Future<void> shareText(String text, {String? subject}) async =>
      this.text = text;
}

void main() {
  test('the export of a language uses its text, Spanish where missing', () {
    final json =
        jsonDecode(ShareCurriculumExportUseCase.exportJson(sampleView()))
            as Map<String, dynamic>;
    expect(json['locale'], 'en');
    final module = (json['modules'] as List).single as Map<String, dynamic>;
    expect(module['name'], 'Character');
    final value = (module['values'] as List).single as Map<String, dynamic>;
    expect(value['name'], 'Integridad');
    expect(value['bookletReference'], isNull, reason: 'not translatable');
    final questions = value['questions'] as List;
    expect(questions, hasLength(1), reason: 'inactive questions are left out');
    expect((questions.single as Map)['text'], 'Why?');
  });

  test('the Spanish export is a valid upload file', () {
    final spanish = sampleView().copyWith(locale: null);
    final json =
        jsonDecode(ShareCurriculumExportUseCase.exportJson(spanish))
            as Map<String, dynamic>;
    expect(json.containsKey('locale'), isFalse);
    final value =
        (((json['modules'] as List).single as Map)['values'] as List).single
            as Map;
    expect(value['bookletReference'], 'M1 · V1');
    expect(
      ((value['questions'] as List).single as Map)['responseType'],
      'text',
    );
  });

  test('sharing sends the JSON text', () async {
    final share = _Share();
    await ShareCurriculumExportUseCase(share)(sampleView(), subject: 's');
    expect(share.text, contains('"modules"'));
  });
}
