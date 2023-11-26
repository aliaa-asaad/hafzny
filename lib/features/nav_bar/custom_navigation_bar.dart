import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hafzny/features/home/presentation/screens/student_home_screen.dart';
import 'package:hafzny/features/home/presentation/screens/teacher_home_screen.dart';
import 'package:hafzny/features/menu/presentation/screens/menu_screen.dart';
import 'package:hafzny/features/nav_bar/widgets/custom_indicator.dart';
import 'package:hafzny/features/reservations/presentation/screens/reservations_screen.dart';
import 'package:hafzny/features/sessions/presentation/screens/sessions_screen.dart';
import 'package:hafzny/features/teachers/presentation/screens/teachers_screen.dart';
import 'package:hafzny/utilities/images.dart';
import 'package:hafzny/utilities/media_quary.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({
    super.key,
  });

  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 5, vsync: this);

    log('test ');
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: clientScreens[selectedIndex]['screen'],
      bottomNavigationBar: Container(
        //   padding: EdgeInsets.symmetric(horizontal: 16.0.w),
        padding: EdgeInsets.symmetric(horizontal: 8.0.w),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 12.r,
              offset: const Offset(0, 0),
            ),
          ],
          /*borderRadius: BorderRadius.circular(25), */
        ), // Background color of the tab bar
        height: 70, // Adjust the height of the tab bar
        child: TabBar(
          padding: EdgeInsets.zero,
          labelPadding: EdgeInsets.zero,
          
          indicatorPadding: EdgeInsets.zero,
          controller: _tabController,
          tabs: List.generate(
            clientScreens.length,
            (index) => Tab(
              height: 60,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    clientScreens[index]['icon'],
                    height: MediaQueryHelper.height * .033,
                    width: MediaQueryHelper.width * .036,
                    colorFilter: index == selectedIndex
                        ? ColorFilter.mode(
                            Theme.of(context).colorScheme.primary,
                            BlendMode.srcIn)
                        : ColorFilter.mode(
                            Theme.of(context).colorScheme.background,
                            BlendMode.srcIn),
                  ),
                  //  SizedBox(height: MediaQueryHelper.width * .01),
                  Text(
                    clientScreens[index]['title'],
                    style: TextStyle(
                      fontSize: MediaQueryHelper.width * .03,
                      color: index == selectedIndex
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.background,
                    ),
                  ),
                 /*  SizedBox(
                    height: MediaQueryHelper.height * .01,
                  ) */
                ],
              ),
            ),
          ),
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          indicator: CustomTabIndicator(
            //indicatorWidth: 20,
            indicatorHeight: 3.0,
            indicatorColor: Theme.of(context).colorScheme.primary,
            tabBarIndicatorSize: 2.0.r,
            tabBarIndicatorRadius: 10.0.r,
          ),
        ),
      ),
    );
  }
}

List<Map<String, dynamic>> clientScreens = [
  {
    'title': 'الرئيسية',
    'icon': ImagesHelper.homeIcon,
    'screen': const StudentHomeScreen()
  },
  {
    'title': 'المعلمون',
    'icon': ImagesHelper.teachersIcon,
    'screen': const TeachersScreen()
  },
  {
    'title': 'الحجوزات',
    'icon': ImagesHelper.reservationsIcon,
    'screen': const ReservationsScreen()
  },
  ////////////test
  {
    'title': 'الجلسات',
    'icon': ImagesHelper.sessionsIcon,
    'screen': const SessionsScreen()
  },
  {
    'title': 'القائمة',
    'icon': ImagesHelper.menuIcon,
    'screen': const MenuScreen()
  },
];
