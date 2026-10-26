import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/models/attendance_status.dart';
import 'package:gold_roundtables/features/session/domain/models/facilitator_stage.dart';
import 'package:gold_roundtables/features/session/domain/use_cases/attendance/mark_attendance_use_case.dart';
import 'package:gold_roundtables/features/session/domain/use_cases/attendance/mark_everyone_present_use_case.dart';
import 'package:gold_roundtables/features/session/presentation/pages/facilitator_board/cubit/facilitator_board_cubit.dart';
import 'package:gold_roundtables/features/session/presentation/pages/facilitator_board/cubit/facilitator_board_state.dart';
import 'package:mocktail/mocktail.dart';

class _MockMark extends Mock implements MarkAttendanceUseCase {}

class _MockMarkAll extends Mock implements MarkEveryonePresentUseCase {}

void main() {
  late _MockMark mark;
  late _MockMarkAll markAll;

  setUpAll(() => registerFallbackValue(AttendanceStatus.present));

  setUp(() {
    mark = _MockMark();
    markAll = _MockMarkAll();
  });

  FacilitatorBoardCubit build() => FacilitatorBoardCubit(mark, markAll);

  blocTest<FacilitatorBoardCubit, FacilitatorBoardState>(
    'views a reached stage and returns to the current one',
    build: build,
    act: (cubit) => cubit
      ..view(FacilitatorStage.attendance, current: FacilitatorStage.followUp)
      ..view(FacilitatorStage.followUp, current: FacilitatorStage.followUp),
    expect: () => [
      const FacilitatorBoardState(viewing: FacilitatorStage.attendance),
      const FacilitatorBoardState(),
    ],
  );

  blocTest<FacilitatorBoardCubit, FacilitatorBoardState>(
    'cannot look at a stage that has not been reached',
    build: build,
    act: (cubit) => cubit.view(
      FacilitatorStage.value,
      current: FacilitatorStage.attendance,
    ),
    expect: () => const <FacilitatorBoardState>[],
  );

  blocTest<FacilitatorBoardCubit, FacilitatorBoardState>(
    'follows the session when the stage changes',
    build: build,
    seed: () => const FacilitatorBoardState(viewing: FacilitatorStage.open),
    act: (cubit) => cubit.followCurrentStage(),
    expect: () => [const FacilitatorBoardState()],
  );

  blocTest<FacilitatorBoardCubit, FacilitatorBoardState>(
    'switches between the board and my answers',
    build: build,
    act: (cubit) => cubit.selectTab(FacilitatorTab.myAnswers),
    expect: () => [const FacilitatorBoardState(tab: FacilitatorTab.myAnswers)],
  );

  blocTest<FacilitatorBoardCubit, FacilitatorBoardState>(
    'marks one person and reports saving',
    setUp: () => when(
      () => mark(
        sessionId: any(named: 'sessionId'),
        personId: any(named: 'personId'),
        status: any(named: 'status'),
      ),
    ).thenAnswer((_) async {}),
    build: build,
    act: (cubit) => cubit.mark(
      sessionId: 's',
      personId: 'p',
      status: AttendanceStatus.late,
    ),
    expect: () => [
      const FacilitatorBoardState(isSaving: true),
      const FacilitatorBoardState(),
    ],
    verify: (_) => verify(
      () => mark(sessionId: 's', personId: 'p', status: AttendanceStatus.late),
    ).called(1),
  );

  blocTest<FacilitatorBoardCubit, FacilitatorBoardState>(
    'surfaces a failure to save attendance',
    setUp: () => when(
      () => markAll(
        sessionId: any(named: 'sessionId'),
        personIds: any(named: 'personIds'),
      ),
    ).thenThrow(StateError('db')),
    build: build,
    act: (cubit) =>
        cubit.markEveryonePresent(sessionId: 's', personIds: ['a', 'b']),
    expect: () => [
      const FacilitatorBoardState(isSaving: true),
      isA<FacilitatorBoardState>()
          .having((s) => s.isSaving, 'isSaving', false)
          .having((s) => s.failure, 'failure', isA<StateError>()),
    ],
  );

  test('the facilitator is recorded present once', () async {
    when(
      () => mark(
        sessionId: any(named: 'sessionId'),
        personId: any(named: 'personId'),
        status: any(named: 'status'),
      ),
    ).thenAnswer((_) async {});
    final cubit = build();
    await cubit.ensureSelfPresent(sessionId: 's', personId: 'me');
    await cubit.ensureSelfPresent(sessionId: 's', personId: 'me');
    verify(
      () => mark(
        sessionId: 's',
        personId: 'me',
        status: AttendanceStatus.present,
      ),
    ).called(1);
    await cubit.close();
  });
}
