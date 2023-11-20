import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hafzny/handlers/shared_handler.dart';
import 'package:hafzny/routing/navigator.dart';
import 'package:hafzny/routing/routes.dart';
import 'package:hafzny/utilities/images.dart';
import 'package:hafzny/utilities/media_quary.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>   with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  @override
  void initState() {
    super.initState();

    splashAnimation();
  }

// function that controls animation of logo
  void splashAnimation() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..forward();
    animation = CurvedAnimation(parent: controller, curve: Curves.linear);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
 

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.delayed(const Duration(seconds: 3), () async {
       /*    AppRoutes.pushNamedNavigator(
                routeName: Routes.onboarding, replacement: true); */
 AppRoutes.pushNamedNavigator(routeName: Routes.login,replacement: true);
         /*  if (SharedHandler.instance!.getData(
              key: SharedKeys().isNotFirstTime, valueType: ValueType.bool)) {
            log('isFirstTime=false');
            if (SharedHandler.instance!.getData(
                key: SharedKeys().isLogin, valueType: ValueType.bool)) {
              SharedHandler.instance!.getData(
                          key: SharedKeys().userType,
                          valueType: ValueType.int) ==
                      0
                  ? AppRoutes.pushNamedNavigator(
                      routeName: Routes.clientNavBar, replacement: true)
                  : AppRoutes.pushNamedNavigator(
                      routeName: Routes.driverNavBar, replacement: true);
            } else {
              AppRoutes.pushNamedNavigator(
                  routeName: Routes.check, replacement: true);
            }
           
          } else {
             AppRoutes.pushNamedNavigator(
                routeName: Routes.onboarding, replacement: true);
          } */
        }),
        builder: (context, snapshot) {
          return Scaffold(
          //  backgroundColor: Colors.green,
            body: FadeTransition(
              opacity: animation,
              child: Center(
                child: Image.asset(
                  ImagesHelper.logo,
               //   fit: BoxFit.contain,color: Colors.white,
                  height: MediaQueryHelper.height * .6,
                  width: MediaQueryHelper.width * .8,
                ),
              ),
            ),
          );
        });
    /* }); */
  }
}
