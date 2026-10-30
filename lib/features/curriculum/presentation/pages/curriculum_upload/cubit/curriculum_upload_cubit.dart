import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/network/api_exception.dart';
import '../../../../domain/models/curriculum_upload.dart';
import '../../../../domain/use_cases/upload/apply_curriculum_upload_use_case.dart';
import '../../../../domain/use_cases/upload/pick_curriculum_file_use_case.dart';
import '../../../../domain/use_cases/upload/preview_curriculum_upload_use_case.dart';
import 'curriculum_upload_state.dart';

@injectable
class CurriculumUploadCubit extends Cubit<CurriculumUploadState> {
  CurriculumUploadCubit(this._pick, this._preview, this._apply)
    : super(const CurriculumUploadState());

  final PickCurriculumFileUseCase _pick;
  final PreviewCurriculumUploadUseCase _preview;
  final ApplyCurriculumUploadUseCase _apply;

  Future<void> pickFile() async {
    final file = await _pick();
    if (file == null) return;
    emit(
      CurriculumUploadState(fileName: file.name, pickedContent: file.content),
    );
  }

  /// The person edited the text box: the previous diff no longer applies.
  void contentChanged() {
    if (state.status == CurriculumUploadStatus.previewed ||
        state.error != null) {
      emit(
        state.copyWith(
          status: CurriculumUploadStatus.editing,
          plan: null,
          error: null,
        ),
      );
    }
  }

  Future<void> preview(String content, {String? locale}) async {
    emit(
      state.copyWith(
        status: CurriculumUploadStatus.previewing,
        pickedContent: null,
        error: null,
      ),
    );
    try {
      final plan = await _preview(_upload(content, locale));
      emit(
        state.copyWith(status: CurriculumUploadStatus.previewed, plan: plan),
      );
    } on ApiException catch (error) {
      emit(
        state.copyWith(status: CurriculumUploadStatus.editing, error: error),
      );
    }
  }

  Future<void> apply(String content, {String? locale}) async {
    emit(state.copyWith(status: CurriculumUploadStatus.applying, error: null));
    try {
      final plan = await _apply(_upload(content, locale));
      emit(state.copyWith(status: CurriculumUploadStatus.applied, plan: plan));
    } on ApiException catch (error) {
      emit(
        state.copyWith(status: CurriculumUploadStatus.previewed, error: error),
      );
    }
  }

  CurriculumUpload _upload(String content, String? locale) => CurriculumUpload(
    content: content,
    locale: locale,
    fileName: state.fileName,
  );
}
