import 'package:freezed_annotation/freezed_annotation.dart';

part 'curriculum_upload.freezed.dart';

enum CurriculumFileFormat {
  json,
  csv;

  /// JSON files start with `{`; anything else is read as CSV.
  static CurriculumFileFormat detect(String content) =>
      content.trimLeft().startsWith('{') ? json : csv;
}

/// File contents to preview or apply. A [locale] means the file holds that
/// language's text; without it the file is the Spanish curriculum.
@freezed
abstract class CurriculumUpload with _$CurriculumUpload {
  const CurriculumUpload._();

  const factory CurriculumUpload({
    required String content,
    String? locale,
    String? fileName,
  }) = _CurriculumUpload;

  CurriculumFileFormat get format => CurriculumFileFormat.detect(content);
}
