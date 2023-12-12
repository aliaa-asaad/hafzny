import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hafzny/app_widgets/custom_app_bar.dart';
import 'package:hafzny/app_widgets/custom_form_field.dart';
import 'package:hafzny/app_widgets/custom_sized_button.dart';
import 'package:hafzny/app_widgets/teacher_details_card.dart';
import 'package:hafzny/routing/navigator.dart';
import 'package:hafzny/routing/routes.dart';
import 'package:hafzny/utilities/images.dart';
import 'package:hafzny/utilities/text_style_helper.dart';

class TeachersScreen extends StatelessWidget {
  const TeachersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.all(20.0.r),
          child: Column(
            children: [
              const CustomAppBar(
                title: 'المعلمون',
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomSizedButton(
                      title: 'كل المعلمين',
                      size: const Size(165, 48),
                      onPressed: () {}),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        side: BorderSide(color: Colors.grey.shade300, width: 1),
                        minimumSize: const Size(165, 48)),
                    child: Text(
                      'المفضلون',
                      style: TextStyleHelper.body15.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .background
                              .withOpacity(.5)),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              CustomFormField(
                  customSuffixIconButton: Padding(
                    padding: EdgeInsets.all(12.0.r),
                    child: SvgPicture.asset(
                      ImagesHelper.filterIcon,
                      // height: MediaQueryHelper.height * .02,
                    ),
                  ),
                  customPreffixIconButton: Padding(
                    padding: EdgeInsets.all(12.0.r),
                    child: SvgPicture.asset(
                      ImagesHelper.searchIcon,
                      // height: MediaQueryHelper.height * .02,
                    ),
                  ),
                  isLabeled: false,
                  isWidget: true,
                  hintText: 'ابحث عن معلم',
                  keyboardType: TextInputType.text,
                  controller: controller),
              const SizedBox(
                height: 10,
              ),
              TeacherDetailsCard(
                onTap: () => AppRoutes.pushNamedNavigator(
                    routeName: Routes.teacherDetails),
              )
            ],
          ),
        ),
      ),
    );
  }
}
