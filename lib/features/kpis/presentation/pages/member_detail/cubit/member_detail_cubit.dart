import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/network/api_exception.dart';
import '../../../../domain/use_cases/members/load_member_detail_use_case.dart';
import '../../../../domain/use_cases/members/reveal_member_answers_use_case.dart';
import 'member_detail_state.dart';

@injectable
class MemberDetailCubit extends Cubit<MemberDetailState> {
  MemberDetailCubit(this._load, this._reveal)
    : super(const MemberDetailState());

  final LoadMemberDetailUseCase _load;
  final RevealMemberAnswersUseCase _reveal;
  String? _tableId;
  String? _personId;

  Future<void> load({required String tableId, required String personId}) async {
    _tableId = tableId;
    _personId = personId;
    emit(state.copyWith(status: MemberDetailStatus.loading, error: null));
    await _fetch();
  }

  Future<void> refresh() async {
    if (_tableId != null) await _fetch();
  }

  Future<void> _fetch() async {
    try {
      final member = await _load(roundTableId: _tableId!, personId: _personId!);
      emit(
        state.copyWith(
          status: member == null
              ? MemberDetailStatus.failure
              : MemberDetailStatus.ready,
          member: member,
          error: member == null
              ? const ApiException(
                  kind: ApiErrorKind.notFound,
                  code: 'not_found',
                  statusCode: 404,
                )
              : null,
        ),
      );
    } on ApiException catch (error) {
      emit(
        state.copyWith(
          status: state.member == null
              ? MemberDetailStatus.failure
              : MemberDetailStatus.ready,
          error: error,
        ),
      );
    }
  }

  /// Fetches the individual answers. The server records who looked.
  Future<void> reveal() async {
    emit(state.copyWith(revealing: true, revealError: null));
    try {
      final person = await _reveal(
        roundTableId: _tableId!,
        personId: _personId!,
      );
      emit(state.copyWith(revealing: false, revealed: person));
    } on ApiException catch (error) {
      emit(state.copyWith(revealing: false, revealError: error));
    }
  }
}
