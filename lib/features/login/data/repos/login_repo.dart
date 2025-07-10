import 'package:doctor_reservation/core/networking/api_error_handler.dart';
import 'package:doctor_reservation/core/networking/api_result.dart';
import 'package:doctor_reservation/core/networking/api_service.dart';

import '../models/login_request_body.dart';
import '../models/login_response_model.dart';

class LoginRepo {
  final ApiService _apiService;
  LoginRepo(this._apiService);

  Future<ApiResult<LoginResponse>> login(
    LoginRequestBody loginRequestBody,
  ) async {
    try {
      final response = await _apiService.login(loginRequestBody);
      return ApiResult.success(response);
    } catch (errro) {
      return ApiResult.failure(ErrorHandler.handle(errro));
    }
  }
}

