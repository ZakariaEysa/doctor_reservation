import 'package:dio/dio.dart';
import 'package:doctor_reservation/core/networking/api_service.dart';
import 'package:doctor_reservation/core/networking/dio_factory.dart';
import 'package:doctor_reservation/features/register/data/repos/register_repo.dart';
import 'package:doctor_reservation/features/register/logic/cubit/register_cubit.dart';
import 'package:get_it/get_it.dart';

import '../../features/login/data/repos/login_repo.dart';
import '../../features/login/logic/cubit/login_cubit.dart';

final getIt = GetIt.instance;

void setUpGetIt() {
  // dio factory and Api services
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => (ApiService(dio)));

  // login repo and cubit
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt()));
  // register repo and cubit
  getIt.registerLazySingleton<RegisterRepo>(() => RegisterRepo(getIt()));
  getIt.registerLazySingleton<RegisterCubit>(() => RegisterCubit(getIt()));
}
