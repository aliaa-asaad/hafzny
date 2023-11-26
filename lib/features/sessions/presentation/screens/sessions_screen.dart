import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hafzny/app_widgets/custom_app_bar.dart';
import 'package:hafzny/app_widgets/teacher_details_card.dart';
import 'package:hafzny/routing/navigator.dart';
import 'package:hafzny/routing/routes.dart';

class SessionsScreen extends StatelessWidget {
  const SessionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        padding: EdgeInsets.all(20.0.r),
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            CustomAppBar(
              title: 'الجلسات',
            ),
            SizedBox(
              height: 40,
            ),
            TeacherDetailsCard(
              isSessions: true,
              onTap: () {
                AppRoutes.pushNamedNavigator(routeName: Routes.sessionsDetails);
              },
            )
          ],
        ),
      )),
    );
  }
}
