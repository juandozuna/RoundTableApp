import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/models/content_language.dart';

part 'content_language_state.freezed.dart';

@freezed
abstract class ContentLanguageState with _$ContentLanguageState {
  const factory ContentLanguageState({
    @Default(ContentLanguageChoice()) ContentLanguageChoice choice,
  }) = _ContentLanguageState;
}
