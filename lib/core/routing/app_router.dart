import 'package:doctor_reservation/core/di/dependency_injection.dart';
import 'package:doctor_reservation/core/helpers/shared_preferences_constants.dart';
import 'package:doctor_reservation/core/helpers/shared_preferences_helper.dart';
import 'package:doctor_reservation/features/home/logic/cubit/home_cubit.dart';
import 'package:doctor_reservation/features/login/logic/cubit/login_cubit.dart';
import 'package:doctor_reservation/features/register/logic/cubit/register_cubit.dart';
import 'package:flutter/material.dart';

import '../../features/home/ui/home_screen.dart';
import '../../features/login/ui/login_screen.dart';
import '../../features/onboarding/onboarding_screen.dart';
import '../../features/register/ui/register_screen.dart';
import 'routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> getInitialRoute() async {
  if (!await SharedPreferencesHelper.getBool(
    SharedPreferencesConstants.passedOnboarding,
  )) {
    initialRoute = Routes.onBoardingScreen;
  } else if (!await SharedPreferencesHelper.getBool(
    SharedPreferencesConstants.loggedIn,
  )) {
    initialRoute = Routes.loginScreen;
  } else {
    initialRoute = Routes.homeScreen;
  }
}

String? initialRoute;

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (context) => const OnboardingScreen(),
        );
      case Routes.registerScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => RegisterCubit(getIt()),
            child: const RegisterScreen(),
          ),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => LoginCubit(getIt()),
            child: const LoginScreen(),
          ),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => HomeCubit(getIt())..getAllSpecialization(),
            child: HomeScreen(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text(
                'Error: no route defined for this route name: ${settings.name}',
              ),
            ),
          ),
        );
      // return MaterialPageRoute(builder: (context) => const ErrorScreen());
    }
  }
}
