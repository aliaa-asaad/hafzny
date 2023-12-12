import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hafzny/handlers/shared_handler.dart';
import 'package:hafzny/routing/navigator.dart';
import 'package:hafzny/routing/routes.dart';
import 'package:hafzny/utilities/images.dart';
import 'package:hafzny/utilities/media_quary.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
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
        AnimationController(vsync: this, duration: const Duration(seconds: 3))
          ..forward()
          ..repeat();
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
          
          if (SharedHandler.instance!.getData(
              key: SharedKeys().isNotFirstTime, valueType: ValueType.bool)) {
            //remember to delete this line
           // SharedHandler.instance!.setData(SharedKeys().isLogin, value: false);
            log('isFirstTime=false');
            if (SharedHandler.instance!.getData(
                key: SharedKeys().isLogin, valueType: ValueType.bool)) {
              AppRoutes.pushNamedNavigator(
                  routeName: Routes.navBar, replacement: true);
            } else {
              AppRoutes.pushNamedNavigator(
                  routeName: Routes.onboarding,
                  replacement: true,
                  arguments: 2);
            }
          } else {
            AppRoutes.pushNamedNavigator(
                routeName: Routes.onboarding, replacement: true, arguments: 0);
          }
        }),
        builder: (context, snapshot) {
          return Scaffold(
            //  backgroundColor: Colors.green,
            body: Center(
              child: Lottie.asset(ImagesHelper.logo,
                  //   fit: BoxFit.contain,color: Colors.white,
                  height: MediaQueryHelper.height * .6,
                  width: MediaQueryHelper.width * .8,
                  animate: true,
                  controller: controller),
            ),
            /*  FadeTransition(
              opacity: animation,
              child: 
            ), */
          );
        });
    /* }); */
  }
}
