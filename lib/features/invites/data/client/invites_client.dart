import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/constants/api_constants.dart';
import '../../domain/models/redeem_result.dart';
import '../models/invite_envelope.dart';
import '../models/invite_list_envelope.dart';
import '../models/invite_preview_envelope.dart';

part 'invites_client.g.dart';

/// `/functions/v1/invites` (api-contract.md §5).
@lazySingleton
@RestApi()
abstract class InvitesClient {
  @factoryMethod
  factory InvitesClient(@Named(DioNames.edgeFunctions) Dio dio) =
      _InvitesClient;

  @GET('/invites/preview')
  Future<InvitePreviewEnvelope> preview(@Query('code') String code);

  @POST('/invites/redeem')
  Future<RedeemResult> redeem(@Body() Map<String, dynamic> body);

  @POST('/invites')
  Future<InviteEnvelope> create(@Body() Map<String, dynamic> body);

  @GET('/invites')
  Future<InviteListEnvelope> list({
    @Query('organization_id') String? organizationId,
    @Query('round_table_id') String? roundTableId,
    @Query('status') String? status,
  });

  @POST('/invites/{id}/revoke')
  Future<InviteEnvelope> revoke(@Path('id') String id);

  @POST('/invites/{id}/renew')
  Future<InviteEnvelope> renew(
    @Path('id') String id,
    @Body() Map<String, dynamic> body,
  );
}
