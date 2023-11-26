import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hafzny/app_widgets/custom_button.dart';
import 'package:hafzny/app_widgets/custom_dots.dart';
import 'package:hafzny/features/on_boarding/view/widgets/on_boarding_button.dart';
import 'package:hafzny/features/on_boarding/view/widgets/on_boarding_model.dart';
import 'package:hafzny/utilities/images.dart';
import 'package:hafzny/utilities/media_quary.dart';
import 'package:hafzny/utilities/text_style_helper.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int _currentPage = 0;
  int _currentContent = 0;
  List<OnBoardingModel> content = [
    OnBoardingModel(
        title: 'حفظنى معك فى تعلم القرأن',
        description:
            'هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها',
        image: ImagesHelper.onBoarding1),
    OnBoardingModel(
        title: 'اكثر من معلم ومعلمة',
        description:
            'هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها',
        image: ImagesHelper.onBoarding2),
    OnBoardingModel(
        title: 'مختلف الاعمار والمستويات',
        description:
            'هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها',
        image: ImagesHelper.onBoarding3),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.0.r),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: MediaQueryHelper.height * .15),
                AnimatedOpacity(
                  duration: const Duration(seconds: 2),
                  opacity: _currentPage == _currentContent ? 1.0 : 0.0,
                  child: Column(
                    children: [
                      Image.asset(
                        content[_currentContent].image!,
                        height: MediaQueryHelper.height * .28,
                        //color: Colors.green,
                      ),
                      SizedBox(height: MediaQueryHelper.height * .08),
                      Text(
                        content[_currentContent].title,
                        style: TextStyleHelper.title26.copyWith(
                            color: const Color(0xff192C4A),
                            fontWeight: FontWeight.normal),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        content[_currentContent].description,
                        style: TextStyleHelper.body15.copyWith(
                          color: const Color(0xff545F71),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQueryHelper.height * .02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    content.length,
                    (index) => CustomDots(
                     // height: .004,
                      width: .05,
                      color: _currentContent == index
                          ? Theme.of(context).colorScheme.primary
                          : const Color(0xff50617D).withOpacity(.1),
                    ),
                  ),
                ),
                const Spacer(),
                _currentContent == content.length - 1
                    ? AnimatedOpacity(
                        duration: const Duration(seconds: 2),
                        opacity: _currentContent == _currentContent ? 1.0 : 0.0,
                        child: Column(
                          children: [
                            CustomButton(
                              onPressed: () {},
                              text: 'الدخول كطالب',
                            ),
                            CustomButton(
                              onPressed: () {},
                              text: 'الدخول كمعلم',
                              textColor: Colors.black,
                              background:
                                  Theme.of(context).colorScheme.secondary,
                            ),
                          ],
                        ),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OnBoardingButton(
                            width: .3,
                            height: .053,
                            onPressed: () {
                              if (_currentPage == content.length - 1) {
                                // Handle the action when reaching the last page
                                // For example, navigate to the next screen
                                print("Reached the last page");
                              } else {
                                setState(() {
                                  _currentPage++;
                                  Future.delayed(
                                      const Duration(milliseconds: 800), () {
                                    setState(() {
                                      _currentContent = _currentPage;
                                    });
                                  });
                                });
                              }
                            },
                            title: 'التالي',
                            color: Theme.of(context).colorScheme.primary,
                            textColor: Colors.white,
                          ),
                          OnBoardingButton(
                            width: .3,
                            height: .053,
                            onPressed: () {
                              if (_currentPage == 0) {
                                // Handle the action when reaching the last page
                                // For example, navigate to the next screen
                                print("Reached the last page");
                              } else {
                                setState(() {
                                  _currentPage--;
                                  Future.delayed(
                                      const Duration(milliseconds: 800), () {
                                    setState(() {
                                      _currentContent = _currentPage;
                                    });
                                  });
                                });
                              }
                            },
                            title: 'تخطي',
                            color: Theme.of(context)
                                .colorScheme
                                .secondary
                                .withOpacity(.1),
                            textColor: Theme.of(context).colorScheme.secondary,
                          ),
                        ],
                      ),
                SizedBox(height: MediaQueryHelper.height * .02),
              ]),
        ),
      ),
    );
  }
}
