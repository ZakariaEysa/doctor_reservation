import 'package:doctor_reservation/core/helpers/extensions.dart';
import 'package:doctor_reservation/core/helpers/spacing.dart';
import 'package:doctor_reservation/core/theming/styles.dart';
import 'package:doctor_reservation/core/widgets/app_text_button.dart';
import 'package:doctor_reservation/features/register/logic/cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/routing/routes.dart';
import '../../login/ui/widgets/already_have_account.dart';
import '../../login/ui/widgets/terms_and_conditions.dart';
import 'widgets/register_form.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text("Create Account", style: TextStyles.font24BlueBold),
                verticalSpace(8),
                Text(
                  "Sign up now and start exploring all that our app has to offer. We're excited to welcome you to our community!",
                  style: TextStyles.font14GrayRegular,
                ),
                verticalSpace(17),
                RegisterForm(),

                verticalSpace(40),
                AppTextButton(
                  buttonText: "Sign Up",
                  textStyle: TextStyles.font16WhiteSemiBold,
                  onPressed: () {
                    RegisterCubit.get(
                      context,
                    ).registerFormKey.currentState!.validate();
                    // context.pushReplacementNamed(Routes.homeScreen);
                  },
                ),
                verticalSpace(16),

                const TermsAndConditionsText(),
                verticalSpace(16),
                AlreadyHaveAccountText(
                  label: "Already have an account? ",
                  text: ' Log In',
                  onTap: () => context.pushReplacementNamed(Routes.loginScreen),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
