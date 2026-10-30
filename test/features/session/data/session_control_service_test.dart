import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/data/data_change_signal.dart';
import 'package:gold_roundtables/core/data/data_scope.dart';
import 'package:gold_roundtables/core/models/session_stage.dart';
import 'package:gold_roundtables/core/network/api_exception.dart';
import 'package:gold_roundtables/features/session/data/datasources/session_remote_data_source.dart';
import 'package:gold_roundtables/features/session/data/services/session_control_service_impl.dart';
import 'package:gold_roundtables/features/session/data/services/session_write_gateway.dart';
import 'package:gold_roundtables/features/session/domain/models/session_write_failure.dart';
import 'package:gold_roundtables/features/session/domain/services/session_control_service.dart';
import 'package:mocktail/mocktail.dart';

import '../support/fake_connectivity.dart';
import '../support/fake_session_reads.dart';
import '../support/fixed_clock.dart';
import '../support/session_fixture.dart';

class _MockRemote extends Mock implements SessionRemoteDataSource {}

void main() {
  late _MockRemote remote;
  late FakeConnectivity connectivity;
  late DataChangeSignal signal;
  late List<DataScope> notified;
  late SessionControlServiceImpl control;
  final now = DateTime.utc(2026, 10, 29, 23, 5);

  setUpAll(() {
    registerFallbackValue(SessionStage.lobby);
    registerFallbackValue(DateTime.utc(2026));
  });

  setUp(() {
    remote = _MockRemote();
    connectivity = FakeConnectivity();
    signal = DataChangeSignal();
    notified = [];
    signal.changes.listen(notified.add);
    control = SessionControlServiceImpl(
      remote,
      SessionWriteGateway(remote, FakeSessionReads(), connectivity, signal),
      FixedClock(now),
    );
  });

  tearDown(() => signal.dispose());

  test('online: goes through the sessions function and refreshes', () async {
    when(
      () => remote.open(any(), stage: any(named: 'stage')),
    ).thenAnswer((_) async {});

    final delivery = await control.open(Ids.session);
    await pumpEventQueue();

    expect(delivery, ControlDelivery.online);
    verify(
      () => remote.open(Ids.session, stage: SessionStage.attendance),
    ).called(1);
    expect(notified, [DataScope.session]);
  });

  test('stage, close answers and close send the clock time', () async {
    when(() => remote.setStage(any(), any())).thenAnswer((_) async {});
    when(() => remote.closeAnswers(any(), any())).thenAnswer((_) async {});
    when(() => remote.close(any(), any())).thenAnswer((_) async {});

    await control.setStage(Ids.session, SessionStage.followUp);
    await control.closeAnswers(Ids.session);
    await control.close(Ids.session);

    verify(() => remote.setStage(Ids.session, SessionStage.followUp)).called(1);
    verify(() => remote.closeAnswers(Ids.session, now)).called(1);
    verify(() => remote.close(Ids.session, now)).called(1);
  });

  test('offline: fails with the offline failure and sends nothing', () async {
    connectivity.online = false;

    for (final attempt in <Future<ControlDelivery> Function()>[
      () => control.open(Ids.session),
      () => control.setStage(Ids.session, SessionStage.followUp),
      () => control.closeAnswers(Ids.session),
      () => control.close(Ids.session),
    ]) {
      await expectLater(
        attempt(),
        throwsA(
          isA<SessionWriteFailure>().having(
            (e) => e.isOffline,
            'offline',
            true,
          ),
        ),
      );
    }
    verifyZeroInteractions(remote);
    expect(notified, isEmpty);
  });

  test('online but unreachable: the offline failure, nothing saved', () async {
    when(
      () => remote.setStage(any(), any()),
    ).thenThrow(const ApiException(kind: ApiErrorKind.network));

    await expectLater(
      control.setStage(Ids.session, SessionStage.value),
      throwsA(isA<SessionWriteFailure>()),
    );
    await pumpEventQueue();
    expect(notified, isEmpty);
  });

  test('a refusal from the server reaches the caller with its code', () async {
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
  });
}
