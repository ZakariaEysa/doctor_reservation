import 'package:doctor_reservation/core/helpers/extensions.dart';
import 'package:doctor_reservation/features/register/logic/cubit/register_cubit.dart';
import 'package:doctor_reservation/features/register/logic/cubit/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/routing/routes.dart' show Routes;
import '../../../../core/widgets/dialogs.dart';

class RegisterBlocListener extends StatelessWidget {
  const RegisterBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (data) {
            context.pop();
            context.pushNamed(Routes.homeScreen);
          },
          error: (error) {
            context.pop();
            errorDialog(context, error);
          },
          loading: () {
            loadingDialog(context);
          },
        );
      },
      child: SizedBox.shrink(),
    );
  }
}
