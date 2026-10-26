import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/models/invite_preview.dart';
import '../../../../domain/models/invite_problem.dart';

part 'scan_state.freezed.dart';

@freezed
sealed class ScanState with _$ScanState {
  const factory ScanState.scanning() = ScanScanning;
  const factory ScanState.checking() = ScanChecking;

  /// The QR or pasted text is not an invitation of this app.
  const factory ScanState.notInvite() = ScanNotInvite;
  const factory ScanState.failed(InviteProblem problem) = ScanFailed;
  const factory ScanState.verified(InvitePreview preview) = ScanVerified;
}
