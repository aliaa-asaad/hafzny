import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hafzny/app_widgets/custom_app_bar.dart';
import 'package:hafzny/app_widgets/custom_button.dart';
import 'package:hafzny/features/menu/presentation/widgets/menu_card.dart';
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
              CustomAppBar(
                title: 'القائمة',
              ),
              SizedBox(
                height: 40,
              ),
              MenuCard(
                content: [
                  {
                    'title': 'بيانات الحساب',
                    'icon': ImagesHelper.profileDetailsIcon
                  },
                  {'title': 'الباقات', 'icon': ImagesHelper.packagesIcon}
                ],
              ),
              MenuCard(
                content: [
                  {'title': 'القرآن الكريم', 'icon': ImagesHelper.quranIcon},
                  {'title': 'الخطة', 'icon': ImagesHelper.planIcon}
                ],
              ),
              MenuCard(
                content: [
                  {
                    'title': 'الشروط والاحكام',
                    'icon': ImagesHelper.privacyPolicyIcon
                  },
                  {'title': 'الدعم الفني', 'icon': ImagesHelper.callCenterIcon}
                ],
              ),
              Spacer(),
              CustomButton(
                onPressed: () {},
                background: Colors.red,
                child: Row(
                  children: [
                    SizedBox(width: 20,),
                    SvgPicture.asset(ImagesHelper.logoutIcon,color: Colors.white,),
                    SizedBox(width: 20,),
                    Text(
                      'تسجيل الخروج',
                      style: TextStyleHelper.button16.copyWith(color: Colors.white),
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
