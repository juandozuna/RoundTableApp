import 'package:freezed_annotation/freezed_annotation.dart';

part 'sync_upload_response.freezed.dart';
part 'sync_upload_response.g.dart';

/// Result of `POST /functions/v1/sync-upload` (always 200 unless the whole
/// request is invalid). Results are in request order.
@freezed
abstract class SyncUploadResponse with _$SyncUploadResponse {
  const factory SyncUploadResponse({
    @Default(0) int applied,
    @Default(0) int rejected,
    @Default([]) List<SyncUploadResult> results,
  }) = _SyncUploadResponse;

  factory SyncUploadResponse.fromJson(Map<String, dynamic> json) =>
      _$SyncUploadResponseFromJson(json);
}

@freezed
abstract class SyncUploadResult with _$SyncUploadResult {
  const factory SyncUploadResult({
    required String status,
    String? id,
    String? table,
    String? op,
    String? code,
    String? message,
  }) = _SyncUploadResult;

  const SyncUploadResult._();

  static const String statusRejected = 'rejected';

  bool get isRejected => status == statusRejected;

  factory SyncUploadResult.fromJson(Map<String, dynamic> json) =>
      _$SyncUploadResultFromJson(json);
}
