import 'package:doctor_reservation/core/helpers/extensions.dart';
import 'package:doctor_reservation/features/login/logic/cubit/login_cubit.dart';
import 'package:doctor_reservation/features/login/logic/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/widgets/dialogs.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        state.whenOrNull(
          success: (data) {
            context.pop();
            context.pushNamedAndRemoveUntil(Routes.homeScreen ,  predicate: (route) => false,);
            
          },
          error: (error) {
            setupErrorState(context, error);
          },
          loading: () {
            loadingDialog(context);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
