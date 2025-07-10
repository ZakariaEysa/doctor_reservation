import 'package:dio/dio.dart';
import 'package:doctor_reservation/core/networking/api_constants.dart';
import 'package:doctor_reservation/features/register/data/models/register_response_model.dart';
import 'package:retrofit/retrofit.dart';

import '../../features/login/data/models/login_request_body.dart';
import '../../features/login/data/models/login_response_model.dart';
import '../../features/register/data/models/register_request_body.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponse> login(@Body() LoginRequestBody loginRequestBody);

  @POST(ApiConstants.register)
  Future<RegisterResponseModel> register(
    @Body() RegisterRequestBody loginRequestBody,
  );
}
