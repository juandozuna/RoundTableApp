import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/constants/api_constants.dart';

part 'calendar_client.g.dart';

/// PostgREST reads of the managers' calendar (ADR 0008). Filters use
/// PostgREST syntax in [query], e.g. `{'status': 'eq.active'}`. Rows are
/// returned untyped because retrofit_generator cannot decode
/// `List<Map<String, dynamic>>`; the remote data source casts them.
@lazySingleton
@RestApi()
abstract class CalendarClient {
  @factoryMethod
  factory CalendarClient(@Named(DioNames.postgrest) Dio dio) = _CalendarClient;

  @GET('/admin_tables')
  Future<dynamic> tables(@Queries() Map<String, dynamic> query);

  @GET('/sessions')
  Future<dynamic> sessions(@Queries() Map<String, dynamic> query);
}
