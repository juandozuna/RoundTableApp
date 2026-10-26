import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/models/invite_preview.dart';

part 'invite_preview_envelope.freezed.dart';
part 'invite_preview_envelope.g.dart';

@freezed
abstract class InvitePreviewEnvelope with _$InvitePreviewEnvelope {
  const factory InvitePreviewEnvelope({required InvitePreview invite}) =
      _InvitePreviewEnvelope;

  factory InvitePreviewEnvelope.fromJson(Map<String, dynamic> json) =>
      _$InvitePreviewEnvelopeFromJson(json);
}
