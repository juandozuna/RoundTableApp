import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/models/session_stage.dart';
import 'package:gold_roundtables/core/network/api_exception.dart';
import 'package:gold_roundtables/core/services/connectivity/connectivity_service.dart';
import 'package:gold_roundtables/features/session/data/datasources/session_local_data_source.dart';
import 'package:gold_roundtables/features/session/data/datasources/session_remote_data_source.dart';
import 'package:gold_roundtables/features/session/data/services/session_control_service_impl.dart';
import 'package:gold_roundtables/features/session/domain/services/session_control_service.dart';
import 'package:mocktail/mocktail.dart';

import '../support/session_fixture.dart';
import '../support/session_test_database.dart';

class _MockRemote extends Mock implements SessionRemoteDataSource {}

class _FakeConnectivity implements ConnectivityService {
  bool online = true;

  @override
  Future<bool> isOnline() async => online;

  @override
  Stream<bool> watchOnline() => Stream.value(online);
}

void main() {
  late SessionTestDatabase db;
  late _MockRemote remote;
  late _FakeConnectivity connectivity;
  late SessionControlServiceImpl control;
  final now = DateTime.utc(2026, 10, 29, 23, 5);

  setUpAll(() {
    registerFallbackValue(SessionStage.lobby);
    registerFallbackValue(DateTime.utc(2026));
  });

  setUp(() async {
    db = await SessionTestDatabase.open();
    await SessionFixture.seed(db, asFacilitator: true);
    remote = _MockRemote();
    connectivity = _FakeConnectivity();
    control = SessionControlServiceImpl(
      SessionLocalDataSource(db.drift, db.sync),
      remote,
      connectivity,
      FixedClock(now),
    );
  });

  tearDown(() => db.close());

  test(
    'online: goes through the sessions function and queues nothing',
    () async {
      when(
        () => remote.open(any(), stage: any(named: 'stage')),
      ).thenAnswer((_) async {});

      final delivery = await control.open(Ids.session);

      expect(delivery, ControlDelivery.online);
      verify(
        () => remote.open(Ids.session, stage: SessionStage.attendance),
      ).called(1);
      expect(await db.queuedChanges(), 0);
    },
  );

  test('offline: saves the same change on the device as a PATCH', () async {
    connectivity.online = false;

    expect(await control.open(Ids.session), ControlDelivery.savedOnDevice);
    expect(
      await control.setStage(Ids.session, SessionStage.followUp),
      ControlDelivery.savedOnDevice,
    );
    expect(
      await control.closeAnswers(Ids.session),
      ControlDelivery.savedOnDevice,
    );
    expect(await control.close(Ids.session), ControlDelivery.savedOnDevice);

    verifyZeroInteractions(remote);
    final row = await db.sync.powerSync.get(
      'SELECT status, stage, started_at, ended_at, answers_closed_at '
      'FROM sessions WHERE id = ?',
      [Ids.session],
    );
    expect(row['status'], 'closed');
    expect(row['stage'], 'closed');
    expect(row['started_at'], now.toIso8601String());
    expect(row['ended_at'], now.toIso8601String());
    expect(row['answers_closed_at'], now.toIso8601String());

    final ops = await db.queuedEntries();
    expect(
      ops.every((e) => e['op'] == 'PATCH' && e['type'] == 'sessions'),
      isTrue,
    );
    final firstPatch = ops.first['data'] as Map<String, dynamic>;
    expect(firstPatch.keys, containsAll(['status', 'stage', 'started_at']));
    expect(firstPatch.containsKey('answers_closed_at'), isFalse);
  });

  test('online but unreachable: falls back to the device', () async {
    when(
      () => remote.setStage(any(), any()),
    ).thenThrow(const ApiException(kind: ApiErrorKind.network));

    final delivery = await control.setStage(Ids.session, SessionStage.value);

    expect(delivery, ControlDelivery.savedOnDevice);
    expect(await db.queuedChanges(), 1);
  });

  test('a refusal from the server is not hidden by saving locally', () async {
    when(() => remote.close(any(), any())).thenThrow(
      const ApiException(
        kind: ApiErrorKind.conflict,
        code: 'session_finalized',
        statusCode: 409,
      ),
    );

    await expectLater(
      control.close(Ids.session),
      throwsA(
        isA<ApiException>().having((e) => e.code, 'code', 'session_finalized'),
      ),
    );
    expect(await db.queuedChanges(), 0);
  });
}
