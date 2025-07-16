import 'package:doctor_reservation/core/networking/api_error_handler.dart';
import 'package:doctor_reservation/core/networking/api_result.dart';
import 'package:doctor_reservation/features/home/data/apis/home_services.dart';
import 'package:doctor_reservation/features/home/data/models/specializations_response_model.dart';

class HomeRepo {
  final HomeServices _homeServices;
  HomeRepo(this._homeServices);

  Future<ApiResult<SpecializationsResponseModel>> getAllSpecialization() async {
    try {
      final response = await _homeServices.getAllSpecialization();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
