import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/constants/api_constants.dart';
import '../models/sync_upload_response.dart';

part 'session_sync_client.g.dart';

/// `sync-upload` Edge Function: the PowerSync `uploadData` target.
@lazySingleton
@RestApi()
abstract class SessionSyncClient {
  @factoryMethod
  factory SessionSyncClient(@Named(DioNames.edgeFunctions) Dio dio) =
      _SessionSyncClient;

  @POST('/sync-upload')
  Future<SyncUploadResponse> upload(@Body() Map<String, dynamic> body);
}
