import 'package:flutter_test/flutter_test.dart';
import 'package:gold_roundtables/core/network/api_exception.dart';
import 'package:gold_roundtables/features/kpis/domain/models/kpi_member_detail.dart';
import 'package:gold_roundtables/features/kpis/domain/models/revealed_answers.dart';
import 'package:gold_roundtables/features/kpis/domain/use_cases/members/load_member_detail_use_case.dart';
import 'package:gold_roundtables/features/kpis/domain/use_cases/members/reveal_member_answers_use_case.dart';
import 'package:gold_roundtables/features/kpis/presentation/pages/member_detail/cubit/member_detail_cubit.dart';
import 'package:gold_roundtables/features/kpis/presentation/pages/member_detail/cubit/member_detail_state.dart';

import '../../admin/fakes.dart';

void main() {
  late FakeKpiService kpis;

  MemberDetailCubit build() => MemberDetailCubit(
    LoadMemberDetailUseCase(kpis),
    RevealMemberAnswersUseCase(kpis),
  );

  setUp(() {
    kpis = FakeKpiService()
      ..members = const [
        KpiMemberDetail(personId: 'p1', firstName: 'Ana', lastName: 'Méndez'),
        KpiMemberDetail(personId: 'p2', firstName: 'Luis', lastName: 'Ferrer'),
      ]
      ..revealed = const RevealedAnswers(
        roundTableId: 't1',
        people: [
          RevealedPerson(
            personId: 'p1',
            answers: [
              RevealedAnswer(id: 'a1', answerText: 'Hoy dije la verdad'),
            ],
          ),
        ],
      );
  });

  test(
    'answers stay hidden until the user asks, and asking is explicit',
    () async {
      final cubit = build();
      addTearDown(cubit.close);
      await cubit.load(tableId: 't1', personId: 'p1');
      expect(cubit.state.member!.fullName, 'Ana Méndez');
      expect(cubit.state.revealed, isNull);
      expect(kpis.revealCalls, 0);

      await cubit.reveal();
      expect(kpis.revealCalls, 1);
      expect(
        cubit.state.revealed!.answers.single.answerText,
        'Hoy dije la verdad',
      );
    },
  );

  test('a person who is not in the table is a not-found failure', () async {
    final cubit = build();
    addTearDown(cubit.close);
    await cubit.load(tableId: 't1', personId: 'nobody');
    expect(cubit.state.status, MemberDetailStatus.failure);
    expect(cubit.state.error!.kind, ApiErrorKind.notFound);
  });

  test(
    'a failed reveal keeps the answers hidden and reports the error',
    () async {
      kpis.revealError = const ApiException(
        kind: ApiErrorKind.forbidden,
        code: 'forbidden',
      );
      final cubit = build();
      addTearDown(cubit.close);
      await cubit.load(tableId: 't1', personId: 'p1');
      await cubit.reveal();
      expect(cubit.state.revealed, isNull);
      expect(cubit.state.revealError!.kind, ApiErrorKind.forbidden);
      expect(cubit.state.revealing, isFalse);
    },
  );
}
