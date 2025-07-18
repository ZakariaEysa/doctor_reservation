import 'package:bloc/bloc.dart';
import 'package:doctor_reservation/core/helpers/shared_preferences_constants.dart';
import 'package:doctor_reservation/core/networking/api_error_handler.dart';
import 'package:doctor_reservation/core/networking/api_result.dart';
import 'package:doctor_reservation/core/networking/dio_factory.dart';
import 'package:doctor_reservation/features/login/data/models/login_request_body.dart';
import 'package:doctor_reservation/features/login/data/models/login_response_model.dart';
import 'package:doctor_reservation/features/login/data/repos/login_repo.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/helpers/shared_preferences_helper.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginRepo) : super(LoginState.initial());
  final LoginRepo _loginRepo;
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login() async {
    LoginRequestBody loginRequestBody = LoginRequestBody(
      email: emailController.text,
      password: passwordController.text,
    );

    emit(LoginState.loading());
    final response = await _loginRepo.login(loginRequestBody);
    response.when(
      success: (loginResponse) async {
        if (loginResponse.data != null) {
          await _cacheUserTokenAndLoginFlag(loginResponse.data!);
          emit(LoginState.success(loginResponse));
        } else {
          emit(LoginState.error(error: ApiErrorHandler.handle(null)));
        }
      },
      failure: (error) {
        emit(LoginState.error(error: ApiErrorHandler.handle(error)));
      },
    );
  }

  Future<void> _cacheUserTokenAndLoginFlag(LoginUserData loginResponse) async {
    await SharedPreferencesHelper.setData(
      SharedPreferencesConstants.loggedIn,
      true,
    );
    await SharedPreferencesHelper.setSecuredString(
      SharedPreferencesConstants.token,
      loginResponse.token ?? "",
    );
    DioFactory.setTokenIntoHeaderAfterLogin(loginResponse.token ?? "");
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
