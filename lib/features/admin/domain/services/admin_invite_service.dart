import '../models/invite_request.dart';
import '../models/invite_share.dart';

abstract interface class AdminInviteService {
  /// Registers the person and reserves their seat or role. Returns the code
  /// and link to share (ADR 0007).
  Future<InviteShare> create(InviteRequest request);
}
