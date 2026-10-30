import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../core/network/api_exception.dart';
import '../../../../domain/models/curriculum_plan.dart';

part 'curriculum_upload_state.freezed.dart';

enum CurriculumUploadStatus {
  /// Waiting for a file or pasted text.
  editing,
  previewing,

  /// The diff is on screen; nothing has been written.
  previewed,
  applying,
  applied,
}

@freezed
abstract class CurriculumUploadState with _$CurriculumUploadState {
  const factory CurriculumUploadState({
    @Default(CurriculumUploadStatus.editing) CurriculumUploadStatus status,
    String? fileName,

    /// Contents of the file just chosen; the page copies them into the text box.
    String? pickedContent,
    CurriculumPlan? plan,
    ApiException? error,
  }) = _CurriculumUploadState;
}
