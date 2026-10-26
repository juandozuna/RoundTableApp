import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../../core/network/api_exception.dart';
import '../../../../domain/models/admin_organization.dart';
import '../../../../domain/models/admin_table.dart';
import '../../../../domain/models/invite_request.dart';
import '../../../../domain/models/invite_share.dart';

part 'invite_person_state.freezed.dart';

enum InvitePersonStatus { loading, editing, submitting, shared, failure }

@freezed
abstract class InvitePersonState with _$InvitePersonState {
  const factory InvitePersonState({
    @Default(InvitePersonStatus.loading) InvitePersonStatus status,
    @Default(InviteRoleKind.facilitator) InviteRoleKind role,
    String? organizationId,
    String? tableId,
    @Default([]) List<AdminOrganization> organizations,

    /// Tables of the chosen organization (seats shown for members).
    @Default([]) List<AdminTable> tables,
    ApiException? error,
    InviteShare? invite,
  }) = _InvitePersonState;
}
