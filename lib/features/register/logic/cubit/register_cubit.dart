import 'package:doctor_reservation/core/networking/api_result.dart';
import 'package:doctor_reservation/features/register/data/models/register_request_body.dart';
import 'package:doctor_reservation/features/register/data/repos/register_repo.dart';
import 'package:doctor_reservation/features/register/logic/cubit/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepo _registerRepo;
  RegisterCubit(this._registerRepo) : super(RegisterState.initial());
  static RegisterCubit get(BuildContext context) =>
      BlocProvider.of<RegisterCubit>(context);

  final registerFormKey = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  int gender = 0;

  void register(RegisterRequestBody registerRequestBody) async {
    emit(RegisterState.loading());
    final result = await _registerRepo.register(registerRequestBody);
    result.when(
      failure: (errorHandler) => emit(
        RegisterState.error(error: errorHandler.apiErrorModel.message ?? ""),
      ),
      success: (registerResponseModel) =>
          emit(RegisterState.success(registerResponseModel)),
    );
  }
}
