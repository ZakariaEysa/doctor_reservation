import 'package:flutter/material.dart';

import '../../features/login/ui/widgets/screens/login_screen.dart';
import '../../features/onboarding/onboarding_screen.dart';
import 'routes.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (context) => const OnboardingScreen(),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
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
