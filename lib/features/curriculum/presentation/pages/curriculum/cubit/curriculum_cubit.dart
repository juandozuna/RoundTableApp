import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/network/api_exception.dart';
import '../../../../domain/models/curriculum_edit.dart';
import '../../../../domain/use_cases/curriculum/add_curriculum_question_use_case.dart';
import '../../../../domain/use_cases/curriculum/edit_curriculum_item_use_case.dart';
import '../../../../domain/use_cases/curriculum/load_curriculum_use_case.dart';
import '../../../../domain/use_cases/curriculum/share_curriculum_export_use_case.dart';
import '../../../../domain/use_cases/languages/add_content_language_use_case.dart';
import '../../../../domain/use_cases/languages/set_content_language_active_use_case.dart';
import 'curriculum_state.dart';

@injectable
class CurriculumCubit extends Cubit<CurriculumState> {
  CurriculumCubit(
    this._load,
    this._edit,
    this._addQuestion,
    this._addLanguage,
    this._setLanguageActive,
    this._shareExport,
  ) : super(const CurriculumState());

  final LoadCurriculumUseCase _load;
  final EditCurriculumItemUseCase _edit;
  final AddCurriculumQuestionUseCase _addQuestion;
  final AddContentLanguageUseCase _addLanguage;
  final SetContentLanguageActiveUseCase _setLanguageActive;
  final ShareCurriculumExportUseCase _shareExport;

  Future<void> load({String? locale}) async {
    final keepView = state.view != null && state.locale == locale;
    emit(
      state.copyWith(
        locale: locale,
        status: keepView ? CurriculumStatus.ready : CurriculumStatus.loading,
        error: null,
      ),
    );
    try {
      final view = await _load(locale: locale);
      emit(state.copyWith(status: CurriculumStatus.ready, view: view));
    } on ApiException catch (error) {
      emit(state.copyWith(status: CurriculumStatus.failure, error: error));
    }
  }

  Future<void> reload() => load(locale: state.locale);

  Future<void> edit(CurriculumEdit edit) => _mutate(() async {
    final changed = await _edit(edit);
    return changed ? CurriculumNotice.saved : CurriculumNotice.unchanged;
  });

  Future<void> addQuestion(NewQuestion question) => _mutate(() async {
    await _addQuestion(question);
    return CurriculumNotice.questionAdded;
  });

  Future<void> addLanguage({required String code, required String name}) =>
      _mutate(() async {
        await _addLanguage(code: code, name: name);
        emit(state.copyWith(locale: code));
        return CurriculumNotice.languageAdded;
      });

  Future<void> setLanguageActive(String code, {required bool active}) =>
      _mutate(() async {
        await _setLanguageActive(code, active: active);
        return CurriculumNotice.saved;
      });

  Future<void> shareExport({required String subject}) async {
    final view = state.view;
    if (view == null) return;
    await _shareExport(view, subject: subject);
  }

  /// Runs a write, refreshes the tree and announces the outcome once.
  Future<void> _mutate(Future<CurriculumNotice> Function() action) async {
    emit(state.copyWith(saving: true, error: null));
    try {
      final notice = await action();
      final view = await _load(locale: state.locale);
      emit(state.copyWith(saving: false, view: view, notice: notice));
      emit(state.copyWith(notice: null));
    } on ApiException catch (error) {
      emit(state.copyWith(saving: false, error: error));
      emit(state.copyWith(error: null));
    }
  }
}
