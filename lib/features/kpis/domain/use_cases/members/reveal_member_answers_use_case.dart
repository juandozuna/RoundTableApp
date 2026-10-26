import 'package:injectable/injectable.dart';

import '../../models/revealed_answers.dart';
import '../../services/kpi_service.dart';

/// "Mostrar respuestas": returns one person's individual answers. The server
/// records who looked, so call it only after an explicit user action.
@injectable
class RevealMemberAnswersUseCase {
  const RevealMemberAnswersUseCase(this._kpis);

  final KpiService _kpis;

  Future<RevealedPerson?> call({
    required String roundTableId,
    required String personId,
  }) async {
    final result = await _kpis.revealAnswers(
      roundTableId: roundTableId,
      personId: personId,
    );
    for (final person in result.people) {
      if (person.personId == personId) return person;
    }
    return null;
  }
}
