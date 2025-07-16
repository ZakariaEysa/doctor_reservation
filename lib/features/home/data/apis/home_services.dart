import 'package:dio/dio.dart';
import 'package:doctor_reservation/core/networking/api_constants.dart';
import 'package:doctor_reservation/features/home/data/apis/home_constants.dart';
import 'package:doctor_reservation/features/home/data/models/specializations_response_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'home_services.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class HomeServices {
  factory HomeServices(Dio dio) = _HomeServices;

  @GET(HomeConstants.specializationEP)
  Future<SpecializationsResponseModel> getAllSpecialization();
}
