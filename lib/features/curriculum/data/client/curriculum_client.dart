import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/constants/api_constants.dart';

part 'curriculum_client.g.dart';

/// Curriculum administration through the `admin` Edge Function (online only,
/// platform administrators).
@lazySingleton
@RestApi()
abstract class CurriculumClient {
  @factoryMethod
  factory CurriculumClient(@Named(DioNames.edgeFunctions) Dio dio) =
      _CurriculumClient;

  @GET('/admin/curriculum')
  Future<dynamic> curriculum(@Query('locale') String? locale);

  @POST('/admin/curriculum/import')
  Future<dynamic> importCurriculum(@Body() Map<String, dynamic> body);

  @POST('/admin/curriculum/locales/{code}/import')
  Future<dynamic> importTranslations(
    @Path('code') String code,
    @Body() Map<String, dynamic> body,
  );

  @PATCH('/admin/curriculum/modules/{id}')
  Future<dynamic> editModule(
    @Path('id') String id,
    @Body() Map<String, dynamic> body,
  );

  @PATCH('/admin/curriculum/values/{id}')
  Future<dynamic> editValue(
    @Path('id') String id,
    @Body() Map<String, dynamic> body,
  );

  @PATCH('/admin/curriculum/questions/{id}')
  Future<dynamic> editQuestion(
    @Path('id') String id,
    @Body() Map<String, dynamic> body,
  );

  @POST('/admin/curriculum/values/{id}/questions')
  Future<dynamic> addQuestion(
    @Path('id') String valueId,
    @Body() Map<String, dynamic> body,
  );

  @POST('/admin/curriculum/locales')
  Future<dynamic> addLocale(@Body() Map<String, dynamic> body);

  @PATCH('/admin/curriculum/locales/{code}')
  Future<dynamic> updateLocale(
    @Path('code') String code,
    @Body() Map<String, dynamic> body,
  );
}
