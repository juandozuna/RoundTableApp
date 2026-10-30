import 'package:injectable/injectable.dart';

import '../../../../core/data/records/records.dart';
import '../../../../core/network/api_guard.dart';
import '../../../../core/network/postgrest/postgrest.dart';

/// Reads the content languages the curriculum is translated into (ADR 0017)
/// from PostgREST.
@lazySingleton
class ContentLanguageRemoteDataSource {
  ContentLanguageRemoteDataSource(this._reads);

  final TableReadsClient _reads;

  /// Active languages, the Spanish base first.
  Future<List<ContentLocaleRecord>> fetchActiveLocales() => guardApiCall(
    () => _reads.contentLocales(
      PostgrestQuery.of(
        filters: {
          PostgrestColumns.status: PostgrestFilter.eq(
            PostgrestValues.activeStatus,
          ),
        },
        order: [
          PostgrestOrder.desc(PostgrestColumns.isDefault),
          PostgrestOrder.asc(PostgrestColumns.code),
        ],
      ),
    ),
  );
}
