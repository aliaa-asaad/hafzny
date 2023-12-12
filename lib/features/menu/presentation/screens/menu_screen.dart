import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hafzny/app_widgets/custom_app_bar.dart';
import 'package:hafzny/app_widgets/custom_button.dart';
import 'package:hafzny/features/menu/presentation/widgets/menu_card.dart';
import 'package:hafzny/routing/navigator.dart';
import 'package:hafzny/routing/routes.dart';
import 'package:hafzny/utilities/images.dart';
import 'package:hafzny/utilities/text_style_helper.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const CustomAppBar(
                title: 'القائمة',
              ),
              const SizedBox(
                height: 40,
              ),
              const MenuCard(
                content: [
                  {
                    'title': 'بيانات الحساب',
                    'icon': ImagesHelper.profileDetailsIcon,
                    'route': Routes.editProfile
                
                  },
                  {
                    'title': 'الباقات',
                    'icon': ImagesHelper.packagesIcon,
                    'route': Routes.packages
                  }
                ],
              ),
              const MenuCard(
                content: [
                  {'title': 'القرآن الكريم', 'icon': ImagesHelper.quranIcon},
                  {'title': 'الخطة', 'icon': ImagesHelper.planIcon}
                ],
              ),
              const MenuCard(
                content: [
                  {
                    'title': 'الشروط والاحكام',
                    'icon': ImagesHelper.privacyPolicyIcon
                  },
                  {'title': 'الدعم الفني', 'icon': ImagesHelper.callCenterIcon}
                ],
              ),
              const Spacer(),
              CustomButton(
                onPressed: () {AppRoutes.pushNamedNavigator(
                  routeName: Routes.onboarding,
                  replacement: true,
                  arguments: 2);},
                background: Colors.red,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 20,
                    ),
                    SvgPicture.asset(
                      ImagesHelper.logoutIcon,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      'تسجيل الخروج',
                      style: TextStyleHelper.button16
                          .copyWith(color: Colors.white),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
