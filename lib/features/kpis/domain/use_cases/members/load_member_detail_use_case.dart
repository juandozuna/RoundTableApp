import 'package:injectable/injectable.dart';

import '../../models/kpi_member_detail.dart';
import '../../services/kpi_service.dart';

/// Scores of one member, found inside the table's member detail.
@injectable
class LoadMemberDetailUseCase {
  const LoadMemberDetailUseCase(this._kpis);

  final KpiService _kpis;

  /// Null when the person has no row in the table.
  Future<KpiMemberDetail?> call({
    required String roundTableId,
    required String personId,
  }) async {
    final members = await _kpis.memberDetail(roundTableId);
    for (final member in members) {
      if (member.personId == personId) return member;
    }
    return null;
  }
}
