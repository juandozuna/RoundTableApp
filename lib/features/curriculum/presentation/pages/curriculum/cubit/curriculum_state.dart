import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../core/network/api_exception.dart';
import '../../../../domain/models/curriculum_view.dart';

part 'curriculum_state.freezed.dart';

enum CurriculumStatus { loading, ready, failure }

/// One-off outcomes the page announces with a toast.
enum CurriculumNotice { saved, unchanged, questionAdded, languageAdded }

@freezed
abstract class CurriculumState with _$CurriculumState {
  const factory CurriculumState({
    @Default(CurriculumStatus.loading) CurriculumStatus status,
    CurriculumView? view,

    /// Language being viewed; null is the Spanish base.
    String? locale,
    @Default(false) bool saving,
    ApiException? error,
    CurriculumNotice? notice,
  }) = _CurriculumState;
}
