import 'package:doctor_reservation/core/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/app_regex.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../login/ui/widgets/password_validation.dart';
import '../../logic/cubit/register_cubit.dart';
import 'gender_selector.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool isObscureText = true;
  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  late TextEditingController passwordController;

  @override
  void initState() {
    // TODO: implement initState
    passwordController = RegisterCubit.get(context).passwordController;
    setupPasswordControllerListener();

    super.initState();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowercase = AppRegex.hasLowerCase(passwordController.text);
        hasUppercase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters = AppRegex.hasSpecialCharacter(
          passwordController.text,
        );
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: RegisterCubit.get(context).registerFormKey,
      child: Column(
        children: [
          AppTextFormField(
            controller: RegisterCubit.get(context).userNameController,

            hintText: "userName",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return " please enter a valid userName";
              }
            },
          ),
          verticalSpace(16),
          AppTextFormField(
            controller: RegisterCubit.get(context).emailController,
            hintText: "Email",
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return " please enter a valid email";
              }
            },
          ),
          verticalSpace(16),
          AppTextFormField(
            controller: RegisterCubit.get(context).phoneController,
            hintText: "Phone",
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isPhoneNumberValid(value)) {
                return " please enter a valid phone number";
              }
            },
          ),

          verticalSpace(16),
          GenderSelector(),
          verticalSpace(16),
          AppTextFormField(
            isObscureText: isObscureText,
            suffixIcon: IconButton(
              icon: isObscureText
                  ? const Icon(Icons.visibility)
                  : const Icon(Icons.visibility_off),
              onPressed: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
            ),
            controller: RegisterCubit.get(context).passwordController,
            hintText: "Password",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return " please enter a valid password";
              }
            },
          ),
          verticalSpace(16),
          AppTextFormField(
            isObscureText: isObscureText,
            suffixIcon: IconButton(
              icon: isObscureText
                  ? const Icon(Icons.visibility)
                  : const Icon(Icons.visibility_off),
              onPressed: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
            ),
            controller: RegisterCubit.get(context).confirmPasswordController,
            hintText: "Confirm Password",
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  value != passwordController.text) {
                return " password does not match";
              }
            },
          ),
          verticalSpace(16),

          PasswordValidations(
            hasLowerCase: hasLowercase,
            hasUpperCase: hasUppercase,
            hasSpecialCharacters: hasSpecialCharacters,
            hasNumber: hasNumber,
            hasMinLength: hasMinLength,
          ),
        ],
      ),
    );
  }
}
