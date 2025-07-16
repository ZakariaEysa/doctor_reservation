import 'package:dio/dio.dart';
import 'package:doctor_reservation/core/helpers/shared_preferences_constants.dart';
import 'package:doctor_reservation/core/helpers/shared_preferences_helper.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  /// Private constructor to prevent instantiation
  DioFactory._();

  static Dio? dio;

  /// Main method to get configured Dio instance
  static Future<Dio> getDio() async {
    Duration timeOut = const Duration(seconds: 30);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;

      await _addDioHeaders(); // Await required here
      _addDioInterceptor();
    }

    return dio!;
  }

  /// Set headers with Authorization token
  static Future<void> _addDioHeaders() async {
    final token = await SharedPreferencesHelper.getSecuredString(
      SharedPreferencesConstants.token,
    );

    dio?.options.headers = {
      'Accept': 'application/json',
      if (token != null && token.isNotEmpty) 'Authorization': 'Bearer $token',
    };
  }

  /// Update Authorization header after login
  static void setTokenIntoHeaderAfterLogin(String token) {
    dio?.options.headers = {
      ...?dio?.options.headers,
      'Authorization': 'Bearer $token',
    };
  }

  /// Add logging interceptor for debugging
  static void _addDioInterceptor() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }
}
