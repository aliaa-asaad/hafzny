import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hafzny/features/auth/forget_password/data/view_model/bloc/forget_password_bloc.dart';
import 'package:hafzny/features/auth/login/data/view_model/bloc/login_bloc.dart';
import 'package:hafzny/features/auth/new_password/data/view_model/bloc/new_password_bloc.dart';
import 'package:hafzny/features/auth/otp/data/view_model/bloc/otp_bloc.dart';
import 'package:hafzny/features/auth/register/data/view_model/bloc/sign_up_bloc.dart';
import 'package:hafzny/features/nav_bar/custom_navigation_bar.dart';
import 'package:hafzny/handlers/localization.dart';
import 'package:hafzny/handlers/shared_handler.dart';
import 'package:hafzny/network/web_services.dart';
import 'package:hafzny/routing/navigator.dart';
import 'package:hafzny/utilities/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedHandler.init();
  Network.init();
  runApp(
    ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(),
        ),
        BlocProvider<SignUpBloc>(
          create: (context) => SignUpBloc(),
        ),
        BlocProvider<OTPBloc>(
          create: (context) => OTPBloc(),
        ),
        BlocProvider<ForgetPasswordBloc>(
          create: (context) => ForgetPasswordBloc(),
        ),
        BlocProvider<NewPasswordBloc>(
          create: (context) => NewPasswordBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Hafzny',
        theme: ThemeHelper().lightTheme,
        onGenerateRoute: AppRoutes.onGenerateRoute,
        //initialRoute: Routes.onboarding,
        navigatorKey: AppRoutes.navigatorState,
        navigatorObservers: [AppRoutes.routeObserver],
        scaffoldMessengerKey: AppRoutes.scaffoldState,
        localizationsDelegates: const [
          AppLocale.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale("ar")],
        locale: const Locale("ar"),

        home: const CustomNavigationBar(),
      ),
    );
  }
}
