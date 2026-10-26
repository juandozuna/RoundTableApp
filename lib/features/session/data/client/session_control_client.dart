import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/constants/api_constants.dart';

part 'session_control_client.g.dart';

/// `sessions` Edge Function: facilitator controls while online.
@lazySingleton
@RestApi()
abstract class SessionControlClient {
  @factoryMethod
  factory SessionControlClient(@Named(DioNames.edgeFunctions) Dio dio) =
      _SessionControlClient;

  @POST('/sessions/{id}/open')
  Future<void> open(@Path('id') String id, @Body() Map<String, dynamic> body);

  @POST('/sessions/{id}/stage')
  Future<void> setStage(
    @Path('id') String id,
    @Body() Map<String, dynamic> body,
  );

  @POST('/sessions/{id}/close-answers')
  Future<void> closeAnswers(
    @Path('id') String id,
    @Body() Map<String, dynamic> body,
  );

  @POST('/sessions/{id}/close')
  Future<void> close(@Path('id') String id, @Body() Map<String, dynamic> body);
}
