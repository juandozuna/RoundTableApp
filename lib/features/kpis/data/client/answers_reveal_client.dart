import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../core/constants/api_constants.dart';
import '../../domain/models/revealed_answers.dart';

part 'answers_reveal_client.g.dart';

/// `answers-reveal` Edge Function: individual answers, audit-logged.
@lazySingleton
@RestApi()
abstract class AnswersRevealClient {
  @factoryMethod
  factory AnswersRevealClient(@Named(DioNames.edgeFunctions) Dio dio) =
      _AnswersRevealClient;

  @POST('/answers-reveal')
  Future<RevealedAnswers> reveal(@Body() Map<String, dynamic> body);
}
