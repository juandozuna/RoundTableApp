import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/services/logging/app_log.dart';
import '../../domain/models/content_language.dart';
import '../../domain/use_cases/language/select_content_language_use_case.dart';
import '../../domain/use_cases/language/watch_content_language_use_case.dart';
import 'content_language_state.dart';

@injectable
class ContentLanguageCubit extends Cubit<ContentLanguageState> {
  ContentLanguageCubit(this._watch, this._select)
    : super(const ContentLanguageState()) {
    _subscription = _watch().listen(_onChoice, onError: _onError);
  }

  final WatchContentLanguageUseCase _watch;
  final SelectContentLanguageUseCase _select;
  late final StreamSubscription<ContentLanguageChoice> _subscription;

  Future<void> select(String code) => _select(code);

  void _onChoice(ContentLanguageChoice choice) =>
      emit(state.copyWith(choice: choice));

  /// Offline or a failed read keeps the last choice; the card stays hidden
  /// until the languages load.
  void _onError(Object error) =>
      AppLog.warning('settings', 'Content languages are unavailable', error);

  @override
  Future<void> close() async {
    await _subscription.cancel();
    return super.close();
  }
}
