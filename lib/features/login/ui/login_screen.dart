import 'package:doctor_reservation/core/helpers/extensions.dart';
import 'package:doctor_reservation/core/helpers/spacing.dart';
import 'package:doctor_reservation/core/routing/routes.dart';
import 'package:doctor_reservation/features/login/data/models/login_request_body.dart';
import 'package:doctor_reservation/features/login/logic/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theming/styles.dart';
import '../../../core/widgets/app_text_button.dart';
import 'widgets/already_have_account.dart';
import 'widgets/email_and_password.dart';
import 'widgets/login_bloc_listener.dart';
import 'widgets/terms_and_conditions.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Welcome Back", style: TextStyles.font24BlueBold),
                verticalSpace(8),
                Text(
                  "We're excited to have you back, can't wait to \nsee what you've been up to since you last \nlogged in.",
                  style: TextStyles.font14GrayRegular,
                ),
                verticalSpace(36),
                EmailAndPassword(),

                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Forgot Password?",
                    style: TextStyles.font14BlueSemiBold,
                  ),
                ),
                verticalSpace(40),
                AppTextButton(
                  buttonText: "Login",

                  textStyle: TextStyles.font16WhiteSemiBold,
                  onPressed: () {
                    if (context
                        .read<LoginCubit>()
                        .formKey
                        .currentState!
                        .validate()) {
                      context.read<LoginCubit>().login(
                        LoginRequestBody(
                          email: context
                              .read<LoginCubit>()
                              .emailController
                              .text,
                          password: context
                              .read<LoginCubit>()
                              .passwordController
                              .text,
                        ),
                      );
                    } else {
                      print("invalid");
                    }
                  },
                ),
                verticalSpace(16),
                const TermsAndConditionsText(),
                verticalSpace(60),
                AlreadyHaveAccountText(
                  label: "Don't have an account? ",
                  text: ' Sign Up',
                  onTap: () =>
                      context.pushReplacementNamed(Routes.registerScreen),
                ),
                const LoginBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
