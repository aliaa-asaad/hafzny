import 'package:hafzny/features/auth/forget_password/presentation/screens/forget_password_screen.dart';
import 'package:hafzny/features/auth/login/presentation/screens/login_screen.dart';
import 'package:hafzny/features/auth/otp/presentation/screens/otp_screen.dart';
import 'package:hafzny/features/auth/register/presentation/screens/sign_up_screen.dart';
import 'package:hafzny/features/home/presentation/screens/home_screen.dart';
import 'package:hafzny/features/on_boarding/view/screens/on_boarding_screen.dart';
import 'package:hafzny/features/splash/view/splash_screen.dart';
import 'package:hafzny/routing/routes.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static final GlobalKey<NavigatorState> navigatorState =
      GlobalKey<NavigatorState>();
  static final RouteObserver<PageRoute> routeObserver =
      RouteObserver<PageRoute>();
  static final GlobalKey<ScaffoldMessengerState> scaffoldState =
      GlobalKey<ScaffoldMessengerState>();

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case Routes.onboarding:
        return MaterialPageRoute(
            builder: (context) => const OnBoardingScreen());
      case Routes.login:
        return AppRoutes.aniamtedNavigation(screen: const LoginScreen());
      case Routes.signUp:
        return AppRoutes.aniamtedNavigation(screen: const SignUpScreen());
      case Routes.otp:
        return AppRoutes.aniamtedNavigation(screen: const OTPScreen());
      case Routes.forgetPassword:
        return AppRoutes.aniamtedNavigation(
            screen: const ForgetPasswordScreen());
            

      case Routes.home:
        return AppRoutes.aniamtedNavigation(screen: const HomeScreen());

      default:
        return AppRoutes.aniamtedNavigation(
            screen: const Scaffold(
          body: Center(child: Text('Error')),
        ));
    }
  }

  static aniamtedNavigation({
    required Widget screen,
  }) {
    return PageRouteBuilder(
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (context, animation, secondaryAnimation) => screen);
  }

  static pushNamedNavigator(
      {required String routeName,
      Object? arguments,
      bool replacement = false,
      bool replacementAll = false}) {
    if (replacement == true) {
      navigatorState.currentState!
          .pushReplacementNamed(routeName, arguments: arguments);
    } else if (replacementAll == true) {
      navigatorState.currentState!.pushNamedAndRemoveUntil(
          routeName, (route) => false,
          arguments: arguments);
    } else {
      navigatorState.currentState!.pushNamed(routeName, arguments: arguments);
    }
  }
}
