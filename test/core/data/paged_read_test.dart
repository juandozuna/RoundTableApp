import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/data/paged_read.dart';
import 'package:gold_roundtables/core/network/api_exception.dart';
import 'package:gold_roundtables/core/network/postgrest/postgrest.dart';

import 'support/record_builders.dart';
import 'support/recording_table_reads_client.dart';

void main() {
  late RecordingTableReadsClient client;

  setUp(() {
    client = RecordingTableReadsClient()
      ..seed(PostgrestTables.locations, [
        for (var i = 0; i < 5; i++) RecordBuilders.location(id: 'loc-$i'),
      ]);
  });

  test('reads one page when the list fits', () async {
    final rows = await readAllPages(client.locations, pageSize: 10);

    expect(rows, hasLength(5));
    expect(client.reads, hasLength(1));
  });

  test('keeps asking until a page comes back short', () async {
    final rows = await readAllPages(client.locations, pageSize: 2);

    expect(rows.map((l) => l.id), [
      'loc-0',
      'loc-1',
      'loc-2',
      'loc-3',
      'loc-4',
    ]);
    expect(client.reads.map((r) => r.query[PostgrestParams.offset]), [
      '0',
      '2',
      '4',
    ]);
  });

  test('a full last page costs one empty page more', () async {
    await readAllPages(client.locations, pageSize: 5);

    expect(client.reads, hasLength(2));
  });

  test('sends the filters and order on every page', () async {
    await readAllPages(
      client.locations,
      pageSize: 2,
      filters: {PostgrestColumns.organizationId: PostgrestFilter.eq('org-1')},
      order: [PostgrestOrder.asc(PostgrestColumns.id)],
    );

    for (final read in client.reads) {
      expect(read.filter(PostgrestColumns.organizationId), 'eq.org-1');
      expect(read.query[PostgrestParams.order], 'id.asc');
      expect(read.query[PostgrestParams.limit], '2');
    }
  });

  test('a Dio failure becomes an ApiException', () async {
    client.failOffline();

    expect(readAllPages(client.locations), throwsA(isA<ApiException>()));
  });
}
