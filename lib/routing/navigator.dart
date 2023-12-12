import 'package:flutter/material.dart';
import 'package:hafzny/features/auth/forget_password/presentation/screens/forget_password_screen.dart';
import 'package:hafzny/features/auth/login/presentation/screens/login_screen.dart';
import 'package:hafzny/features/auth/new_password/presentation/screens/new_password_screen.dart';
import 'package:hafzny/features/auth/otp/presentation/screens/otp_screen.dart';
import 'package:hafzny/features/auth/register/presentation/screens/sign_up_screen.dart';
import 'package:hafzny/features/home/presentation/screens/student_home_screen.dart';
import 'package:hafzny/features/nav_bar/custom_navigation_bar.dart';
import 'package:hafzny/features/notification/presentation/screens/notification_screen.dart';
import 'package:hafzny/features/on_boarding/view/screens/on_boarding_screen.dart';
import 'package:hafzny/features/packages/presentation/screens/packages_screen.dart';
import 'package:hafzny/features/profile/presentation/screens/edit_profile_screen.dart';
import 'package:hafzny/features/sessions/presentation/screens/sessions_details_screen.dart';
import 'package:hafzny/features/sessions/presentation/screens/sessions_rate_screen.dart';
import 'package:hafzny/features/splash/view/splash_screen.dart';
import 'package:hafzny/features/student_data/presentation/screens/student_data_screen.dart';
import 'package:hafzny/features/teacher_data/presentation/screens/teacher_data_screen1.dart';
import 'package:hafzny/features/teacher_data/presentation/screens/teacher_data_screen2.dart';
import 'package:hafzny/features/teachers/presentation/screens/teacher_details_screen.dart';
import 'package:hafzny/features/teachers/presentation/screens/teacher_reservation_success_screen.dart';
import 'package:hafzny/routing/routes.dart';

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
            builder: (context) => OnBoardingScreen(
                   currentPage: settings.arguments as int,
                ));
      case Routes.login:
        return AppRoutes.aniamtedNavigation(screen: const LoginScreen());
      case Routes.signUp:
        return AppRoutes.aniamtedNavigation(screen: const SignUpScreen());
      
      case Routes.otpScreen:
        return AppRoutes.aniamtedNavigation(screen: const OTPScreen());
       case Routes.newPassword:
        return AppRoutes.aniamtedNavigation(screen: const NewPasswordScreen()); 
      case Routes.forgetPassword:
        return AppRoutes.aniamtedNavigation(
            screen: const ForgetPasswordScreen());
      case Routes.navBar:
        return AppRoutes.aniamtedNavigation(
            screen: const CustomNavigationBar());
      case Routes.studentData:
        return AppRoutes.aniamtedNavigation(screen: const StudentDataScreen());
      case Routes.teacherData1:
        return AppRoutes.aniamtedNavigation(screen: const TeacherDataScreen1());
      case Routes.teacherData2:
        return AppRoutes.aniamtedNavigation(screen: const TeacherDataScreen2());
      case Routes.home:
        return AppRoutes.aniamtedNavigation(screen: const StudentHomeScreen());

      case Routes.sessionsDetails:
        return AppRoutes.aniamtedNavigation(
            screen: const SessionsDetailsScreen());
      case Routes.sessionsRate:
        return AppRoutes.aniamtedNavigation(screen: const SessionsRateScreen());
      case Routes.teacherDetails:
        return AppRoutes.aniamtedNavigation(
            screen: const TeacherDetialsScreen());
      case Routes.teacherReservationSuccess:
        return AppRoutes.aniamtedNavigation(
            screen: const TeacherReservationSuccessScreen());
      case Routes.notification:
        return AppRoutes.aniamtedNavigation(screen: const NotificationScreen());
      case Routes.packages:
        return AppRoutes.aniamtedNavigation(screen: const PackagesScreen());
      case Routes.editProfile:
        return AppRoutes.aniamtedNavigation(screen: const EditProfileScreen());

      default:
        return AppRoutes.aniamtedNavigation(
          screen: const Scaffold(
            body: Center(child: Text('Error')),
          ),
        );
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
