import 'dart:convert';

import 'package:injectable/injectable.dart';

import '../../../../../core/services/share/share_service.dart';
import '../../models/curriculum_view.dart';

/// Shares the viewed language's text as a JSON file body, in the same format
/// the upload reads, so translators can start from it.
@injectable
class ShareCurriculumExportUseCase {
  const ShareCurriculumExportUseCase(this._share);

  final ShareService _share;

  Future<void> call(CurriculumView view, {required String subject}) =>
      _share.shareText(exportJson(view), subject: subject);

  /// Spanish text when [CurriculumView.locale] is null; otherwise the
  /// translation, with the Spanish text where nothing is translated yet.
  static String exportJson(CurriculumView view) {
    final translated = view.locale != null;
    String? pick(String? translation, String? base) =>
        translated && (translation ?? '').isNotEmpty ? translation : base;
    final data = {
      'locale': ?view.locale,
      'modules': [
        for (final module in view.modules)
          {
            'number': module.number,
            'name': pick(module.translation?.name, module.name),
            if (module.description != null)
              'description': pick(
                module.translation?.description,
                module.description,
              ),
            'values': [
              for (final value in module.values)
                {
                  'number': value.number,
                  'name': pick(value.translation?.name, value.name),
                  if (value.description != null)
                    'description': pick(
                      value.translation?.description,
                      value.description,
                    ),
                  if (!translated && value.bookletReference != null)
                    'bookletReference': value.bookletReference,
                  'questions': [
                    for (final question in value.activeQuestions)
                      {
                        'code': question.code,
                        'text': pick(question.translation?.text, question.text),
                        if (!translated)
                          'responseType': question.responseType.name,
                      },
                  ],
                },
            ],
          },
      ],
    };
    return const JsonEncoder.withIndent('  ').convert(data);
  }
}
