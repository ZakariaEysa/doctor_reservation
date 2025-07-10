import 'package:doctor_reservation/core/networking/api_error_handler.dart';
import 'package:doctor_reservation/core/networking/api_result.dart';
import 'package:doctor_reservation/core/networking/api_service.dart';
import 'package:doctor_reservation/features/register/data/models/register_response_model.dart';

import '../models/register_request_body.dart';

class RegisterRepo {
  ApiService _apiService;

  RegisterRepo(this._apiService);
  Future<ApiResult<RegisterResponseModel>> register(
    RegisterRequestBody registerRequestBody,
  ) async {
    try {
      final result = await _apiService.register(registerRequestBody);
      return ApiResult.success(result);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
