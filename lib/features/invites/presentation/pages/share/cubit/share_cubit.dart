import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/services/session_context/session_context.dart';
import '../../../../../../core/services/session_context/watch_session_context_use_case.dart';
import '../../../../domain/models/invite.dart';
import '../../../../domain/models/invite_problem.dart';
import '../../../../domain/use_cases/share/copy_text_use_case.dart';
import '../../../../domain/use_cases/share/load_invite_use_case.dart';
import '../../../../domain/use_cases/share/open_whatsapp_use_case.dart';
import '../../../../domain/use_cases/share/share_invite_text_use_case.dart';
import 'share_state.dart';

@injectable
class ShareCubit extends Cubit<ShareState> {
  ShareCubit(
    this._loadInvite,
    this._copy,
    this._shareText,
    this._openWhatsApp,
    this._watchContext,
  ) : super(const ShareState());

  final LoadInviteUseCase _loadInvite;
  final CopyTextUseCase _copy;
  final ShareInviteTextUseCase _shareText;
  final OpenWhatsAppUseCase _openWhatsApp;
  final WatchSessionContextUseCase _watchContext;
  int _serial = 0;

  /// [preloaded] comes with the navigation; after a browser refresh it is
  /// gone and the invite is looked up by [inviteId].
  Future<void> load(String inviteId, {Invite? preloaded}) async {
    if (preloaded != null) {
      emit(ShareState(invite: preloaded, loading: false));
      return;
    }
    emit(const ShareState());
    try {
      final SessionContext? context = await _watchContext().firstWhere(
        (value) => value != null,
      );
      final invite = await _loadInvite(context!, inviteId);
      if (isClosed) return;
      emit(
        invite == null
            ? const ShareState(loading: false, missing: true)
            : ShareState(invite: invite, loading: false),
      );
    } on InviteFailure catch (failure) {
      if (!isClosed) {
        emit(ShareState(loading: false, problem: failure.problem));
      }
    }
  }

  Future<void> copyLink(String link) async {
    await _copy(link);
    _feedback(ShareFeedbackKind.linkCopied);
  }

  Future<void> copyCode(String code) async {
    await _copy(code);
    _feedback(ShareFeedbackKind.codeCopied);
  }

  Future<void> share(String text, {String? subject}) =>
      _shareText(text, subject: subject);

  Future<void> sendWhatsApp(String text, {String? phone}) async {
    final opened = await _openWhatsApp(text, phoneE164: phone);
    if (!opened) _feedback(ShareFeedbackKind.whatsappUnavailable);
  }

  void _feedback(ShareFeedbackKind kind) => emit(
    state.copyWith(
      feedback: ShareFeedback(kind: kind, serial: ++_serial),
    ),
  );
}
