import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hafzny/app_widgets/active_avatar.dart';
import 'package:hafzny/app_widgets/custom_arrow_back.dart';
//import 'package:hafzny/app_widgets/custom_back_app_bar.dart';
import 'package:hafzny/app_widgets/custom_button.dart';
import 'package:hafzny/app_widgets/teacher_details_text.dart';
import 'package:hafzny/features/sessions/presentation/widgets/custom_rating.dart';
import 'package:hafzny/features/sessions/presentation/widgets/session_details_card.dart';
import 'package:hafzny/routing/navigator.dart';
import 'package:hafzny/routing/routes.dart';
import 'package:hafzny/utilities/images.dart';
import 'package:hafzny/utilities/media_quary.dart';
import 'package:hafzny/utilities/text_style_helper.dart';

class SessionsDetailsScreen extends StatelessWidget {
  const SessionsDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> content = [
      {
        'subTitle': 'مكتمل',
        'title': 'السجل',
      },
      {
        'subTitle': '5.8',
        'title': 'عدد الأوجة المنجزة',
      },
      {
        'subTitle': '34',
        'title': 'أخطاء الكلمات',
      },
      {
        'subTitle': '45',
        'title': 'التردد',
      },
      {
        'subTitle': '1',
        'title': 'أخطاء التجويد',
      },
    ];
    return Scaffold(
         appBar: AppBar(
        leadingWidth: MediaQueryHelper.width * .17,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        title: Text(
           'تفاصيل الجلسة',
          style:
              TextStyleHelper.subtitle19 /* .copyWith(color: Colors.white) */,
        ),
        backgroundColor: Colors.white,
        elevation: .0,
        leading: const CustomArrowBack(),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
             // const CustomBackAppBar(title:),
              const SizedBox(
                height: 40,
              ),
              Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                ),
                child: Row(
                  children: [
                    const ActiveAvatar(isSessions: true),
                    const SizedBox(
                      width: 10,
                    ),
                    const TeacherDetailsText(
                      isSessions: true,
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(ImagesHelper.deleteIcon),
                    ),
                  ],
                ),
              ),
              SessionDetailsCard(content: content),
              Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'تعليق',
                          style: TextStyleHelper.body15
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                        const CustomRating()
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                   
                    Text(
                      'يساعدك تحديد هذه المعلومات على تجربة تعليمية مناسبة لك وتسهيل الوصول لمعلم القران المناسب',
                      style: TextStyleHelper.body15.copyWith(
                          color: Theme.of(context).colorScheme.background),
                    ),
                  ],
                ),
              ),
              CustomButton(
                onPressed: () {
                  AppRoutes.pushNamedNavigator(routeName: Routes.sessionsRate);
                },
                child: Text(
                  'تقييم الجلسة',
                  style: TextStyleHelper.button16.copyWith(color: Colors.white),
                ),
              ),
              CustomButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                background: Theme.of(context).colorScheme.secondary,
                child: Text(
                  'العودة للجلسات',
                  style: TextStyleHelper.button16.copyWith(color: Colors.white),
                ),
                //textColor: Theme.of(context).colorScheme.secondary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
