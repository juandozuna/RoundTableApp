import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/models/invite_problem.dart';
import '../../../../domain/use_cases/redeem/parse_invite_code_use_case.dart';
import '../../../../domain/use_cases/redeem/preview_invite_use_case.dart';
import '../../../../domain/use_cases/share/read_clipboard_text_use_case.dart';
import 'scan_state.dart';

@injectable
class ScanCubit extends Cubit<ScanState> {
  ScanCubit(this._parse, this._preview, this._readClipboard)
    : super(const ScanState.scanning());

  final ParseInviteCodeUseCase _parse;
  final PreviewInviteUseCase _preview;
  final ReadClipboardTextUseCase _readClipboard;

  /// A QR was read by the camera, or a link/code was pasted.
  Future<void> submitText(String raw) async {
    if (state is ScanChecking || state is ScanVerified) return;
    final code = _parse(raw);
    if (code == null) {
      emit(const ScanState.notInvite());
      return;
    }
    emit(const ScanState.checking());
    try {
      final preview = await _preview(code);
      if (!isClosed) emit(ScanState.verified(preview));
    } on InviteFailure catch (failure) {
      if (!isClosed) emit(ScanState.failed(failure.problem));
    }
  }

  Future<void> pasteFromClipboard() async {
    final text = await _readClipboard();
    if (text == null || text.trim().isEmpty) {
      emit(const ScanState.notInvite());
      return;
    }
    await submitText(text);
  }

  /// Back to looking for a QR after an error.
  void resume() => emit(const ScanState.scanning());
}
