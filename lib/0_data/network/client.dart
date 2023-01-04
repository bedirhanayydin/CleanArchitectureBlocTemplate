import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/advice_model.dart';

part 'client.g.dart';

// *** CLIENT *** //
@RestApi(baseUrl: "")
abstract class APIClient {
  factory APIClient(Dio dio, {String baseUrl}) = _APIClient;

  // ===== GET ===== //
  @GET('api/v1/advice')
  Future<AdviceModel> getAdvice();
}
