import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hafzny/app_widgets/custom_button.dart';
import 'package:hafzny/app_widgets/custom_form_field.dart';
import 'package:hafzny/routing/routes.dart';
import 'package:hafzny/utilities/images.dart';
import 'package:hafzny/utilities/text_style_helper.dart';

class TeacherDataScreen2 extends StatelessWidget {
  const TeacherDataScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
               'استكمال بيانات المعلم',
                style: TextStyleHelper.subtitle19,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ',
                style: TextStyleHelper.body15
                    .copyWith(color: Theme.of(context).colorScheme.background),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomFormField(
                  isLabeled: true,
                  labelText: 'نبذه مختصرة',
                  hintText: 'قم بكتابة نبذة مختصرة عنك',
                  keyboardType: TextInputType.text,
                  controller: controller),
                  const SizedBox(
                height: 10,
              ),
              CustomFormField(
                  isLabeled: true,
                  labelText: 'حدد الاجازات',
                  hintText: 'رواية حفص عن عاصم',
                  keyboardType: TextInputType.text,
                  customSuffixIconButton: IconButton(
                    onPressed: () {},
                    icon:  SvgPicture.asset(ImagesHelper.dropDownIcon)
                  ),
                  controller: controller),
                  const SizedBox(
                height: 10,
              ),
              CustomFormField(
                  isLabeled: true,
                  labelText: 'مستوى التعلم',
                  hintText: 'رواية حفص عن عاصم',
                  keyboardType: TextInputType.text,
                  customSuffixIconButton: IconButton(
                    onPressed: () {},
                    icon:  SvgPicture.asset(ImagesHelper.dropDownIcon)
                  ),
                  controller: controller),
                  Spacer(),
                  CustomButton(onPressed: (){
                    Navigator.of(context).pushNamed(Routes.navBar);
                  }, text: 'التالى')
            ],
          ),
        ),
      ),
    );
  }
}
