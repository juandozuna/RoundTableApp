import 'package:gold_roundtables/features/admin/domain/models/record_status.dart';
import 'package:gold_roundtables/features/curriculum/domain/models/curriculum_view.dart';

const Map<String, dynamic> viewJson = {
  'locale': 'en',
  'locales': [
    {
      'code': 'es',
      'name': 'Español',
      'is_default': true,
      'status': 'active',
      'completeness': null,
    },
    {
      'code': 'en',
      'name': 'English',
      'is_default': false,
      'status': 'active',
      'completeness': {'total': 234, 'translated': 117},
    },
  ],
  'modules': [
    {
      'id': 'm1',
      'number': 1,
      'name': 'Carácter',
      'description': null,
      'status': 'active',
      'translation': {'name': 'Character', 'description': null, 'text': null},
      'values': [
        {
          'id': 'v1',
          'number': 1,
          'number_in_module': 1,
          'name': 'Integridad',
          'description': 'Hacer lo correcto',
          'booklet_reference': 'M1 · V1',
          'status': 'active',
          'used_by_closed_sessions': true,
          'translation': null,
          'questions': [
            {
              'id': 'q1',
              'code': 'por_que',
              'text': '¿Por qué?',
              'sort_order': 1,
              'response_type': 'text',
              'status': 'active',
              'answered': true,
              'translation': {
                'name': null,
                'description': null,
                'text': 'Why?',
              },
            },
            {
              'id': 'q2',
              'code': 'viejo',
              'text': 'Pregunta vieja',
              'sort_order': 2,
              'response_type': 'person',
              'status': 'inactive',
              'answered': false,
              'translation': null,
            },
          ],
        },
      ],
    },
  ],
};

CurriculumView sampleView() => CurriculumView.fromJson(viewJson);

const RecordStatus active = RecordStatus.active;
