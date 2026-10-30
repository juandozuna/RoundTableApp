import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/models/attendance_status.dart';
import 'package:gold_roundtables/core/models/session_stage.dart';
import 'package:gold_roundtables/core/models/session_status.dart';
import 'package:gold_roundtables/core/models/sync_state.dart';
import 'package:gold_roundtables/core/services/clock/clock_service.dart';
import 'package:gold_roundtables/core/sync/domain/sync_snapshot.dart';
import 'package:gold_roundtables/core/theme/app_theme.dart';
import 'package:gold_roundtables/features/session/domain/models/curriculum_value.dart';
import 'package:gold_roundtables/features/session/domain/models/live_session.dart';
import 'package:gold_roundtables/features/session/domain/models/previous_commitment.dart';
import 'package:gold_roundtables/features/session/domain/models/session_info.dart';
import 'package:gold_roundtables/features/session/domain/models/session_participant.dart';
import 'package:gold_roundtables/features/session/domain/models/session_table.dart';
import 'package:gold_roundtables/features/session/domain/models/step_progress.dart';
import 'package:gold_roundtables/features/session/domain/models/value_question.dart';
import 'package:gold_roundtables/features/session/presentation/pages/member_flow/cubit/member_flow_cubit.dart';
import 'package:gold_roundtables/features/session/presentation/pages/member_flow/cubit/member_flow_state.dart';
import 'package:gold_roundtables/features/session/presentation/pages/member_flow/member_flow_view.dart';
import 'package:gold_roundtables/features/session/presentation/pages/session/cubit/session_cubit.dart';
import 'package:gold_roundtables/features/session/presentation/pages/session/cubit/session_state.dart';
import 'package:gold_roundtables/l10n/gen/app_localizations.dart';

class MockMemberFlowCubit extends MockCubit<MemberFlowState>
    implements MemberFlowCubit {}

class MockSessionCubit extends MockCubit<SessionState>
    implements SessionCubit {}

const StepProgress doneSynced = StepProgress(
  isDone: true,
  syncState: SyncState.synced,
);

/// Ana at Mesa Esperanza 03 reviewing Honestidad (3) in Responsabilidad (4).
LiveSession buildSession({
  bool facilitator = false,
  bool hasPreviousCommitment = true,
  bool hasFollowUpValue = true,
  SessionStatus status = SessionStatus.open,
  SessionStage stage = SessionStage.followUp,
  DateTime? answersClosedAt,
  AttendanceStatus? attendance = AttendanceStatus.present,
  StepProgress followUp = StepProgress.none,
  StepProgress reflection = StepProgress.none,
  StepProgress commitment = StepProgress.none,
  List<String> rejectedMessages = const [],
  bool personQuestion = false,
}) {
  final me = SessionParticipant(
    personId: 'ana',
    firstName: 'Ana Lucía',
    lastName: 'Méndez',
    isFacilitator: facilitator,
    isMe: true,
    hasPreviousCommitment: hasPreviousCommitment,
    attendance: attendance,
    followUp: followUp,
    reflection: reflection,
    commitment: commitment,
  );
  const luis = SessionParticipant(
    personId: 'luis',
    firstName: 'Luis',
    lastName: 'Ferrer',
    isFacilitator: false,
    isMe: false,
    hasPreviousCommitment: true,
    attendance: AttendanceStatus.late,
  );
  return LiveSession(
    session: SessionInfo(
      id: 'session-4',
      tableId: 'table',
      status: status,
      stage: stage,
      scheduledAt: DateTime.utc(2026, 10, 29, 23),
      valueId: 'value-4',
      followUpValueId: hasFollowUpValue ? 'value-3' : null,
      startedAt: DateTime.utc(2026, 10, 29, 23),
      answersClosedAt: answersClosedAt,
    ),
    table: const SessionTable(
      id: 'table',
      name: 'Mesa Esperanza 03',
      organizationName: 'Fundación Luz',
      durationMinutes: 30,
    ),
    value: const CurriculumValue(
      id: 'value-4',
      name: 'Responsabilidad',
      sequence: 4,
    ),
    followUpValue: hasFollowUpValue
        ? const CurriculumValue(id: 'value-3', name: 'Honestidad', sequence: 3)
        : null,
    questions: [
      ValueQuestion(
        id: 'q1',
        text: '¿Quién es para ti un ejemplo?',
        sortOrder: 1,
        responseType: personQuestion
            ? QuestionResponseType.person
            : QuestionResponseType.text,
      ),
      const ValueQuestion(
        id: 'q2',
        text: '¿Por qué te diste ese puntaje?',
        sortOrder: 2,
      ),
    ],
    participants: [me, luis],
    myPersonId: 'ana',
    isToday: true,
    previousCommitment: hasPreviousCommitment
        ? const PreviousCommitment(
            id: 'commit-3',
            actionText: 'Llamar a mi mamá 3 veces',
          )
        : null,
    rejectedMessages: rejectedMessages,
  );
}

/// Instant the fixtures are "now" at: 20 minutes into [buildSession]'s
/// session, so the timer never depends on the real date.
final fixtureNow = DateTime.utc(2026, 10, 29, 23, 20);

class FixtureClock implements ClockService {
  const FixtureClock([this.now]);

  final DateTime? now;

  @override
  DateTime nowUtc() => now ?? fixtureNow;
}

SessionView buildView(
  LiveSession session, {
  bool online = true,
  SyncConnection connection = SyncConnection.connected,
  SyncSnapshot? sync,
}) => SessionView(
  session: session,
  isOnline: online,
  sync: sync ?? SyncSnapshot(connection: connection),
);

/// Pumps [MemberFlowView] with mocked Cubits at phone size.
Future<void> pumpMemberFlow(
  WidgetTester tester, {
  required SessionView view,
  required MockMemberFlowCubit flowCubit,
  MemberFlowState state = const MemberFlowState(),
  bool embedded = false,
  Size size = const Size(390, 900),
  ClockService clock = const FixtureClock(),
}) async {
  whenListen(
    flowCubit,
    const Stream<MemberFlowState>.empty(),
    initialState: state,
  );
  final sessionCubit = MockSessionCubit();
  whenListen(
    sessionCubit,
    const Stream<SessionState>.empty(),
    initialState: SessionState.ready(view),
  );
  tester.view.physicalSize = size;
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.reset);
  await tester.pumpWidget(
    MultiBlocProvider(
      providers: [
        BlocProvider<MemberFlowCubit>.value(value: flowCubit),
        BlocProvider<SessionCubit>.value(value: sessionCubit),
      ],
      child: MaterialApp(
        theme: AppTheme.light,
        locale: const Locale('es'),
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        home: embedded
            ? Scaffold(
                body: MemberFlowView(view: view, embedded: true, clock: clock),
              )
            : MemberFlowView(view: view, clock: clock),
      ),
    ),
  );
  await tester.pump();
}
