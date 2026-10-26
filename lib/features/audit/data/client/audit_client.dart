import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/constants/api_constants.dart';
import '../../domain/models/audit_event.dart';

part 'audit_client.g.dart';

@lazySingleton
@RestApi()
abstract class AuditClient {
  @factoryMethod
  factory AuditClient(@Named(DioNames.postgrest) Dio dio) = _AuditClient;

  @GET('/audit_log')
  Future<List<AuditEvent>> events(@Queries() Map<String, dynamic> query);
}
