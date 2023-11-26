import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hafzny/features/on_boarding/view/widgets/on_boarding_model.dart';
import 'package:hafzny/utilities/media_quary.dart';
import 'package:hafzny/utilities/text_style_helper.dart';

class StudentLevel extends StatefulWidget {
  const StudentLevel({super.key});

  @override
  State<StudentLevel> createState() => _StudentLevelState();
}

class _StudentLevelState extends State<StudentLevel> {
  int currentContent = -1;
  final List<OnBoardingModel> content = [
    OnBoardingModel(
        title: 'مبتدء', description: 'قليل الخبرة فى تعلم القران الكريم'),
    OnBoardingModel(
        title: 'متوسط',
        description:
            'متوسط الخبرة فى القرأه والتسميع'),
    OnBoardingModel(
        title: 'متقدم',
        description:
            'مستوي متقدم من القرأه والتسميع'),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'المسار التعليمي المراد تعلمة',
          style: TextStyleHelper.subtitle19
              .copyWith(color: const Color(0xff192C4A)),
        ),
        const SizedBox(
          height: 20,
        ),
        Column(
          children: List.generate(
            content.length,
            (index) => Padding(
              padding: EdgeInsets.only(bottom: 10.h),
              child: InkWell(
                borderRadius: BorderRadius.circular(4.r),
                onTap: () {
                  setState(() {
                    currentContent = index;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(4.r),
                  alignment: Alignment.center,
                  // margin: EdgeInsets.only(bottom: 10.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r),
                      border: Border.all(color: Colors.grey.shade300),
                      color: currentContent == index
                          ? Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(.1)
                          : const Color(0xff50617D).withOpacity(.02)),
                  height: MediaQueryHelper.height * .13,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Radio(
                          activeColor: Theme.of(context).colorScheme.primary,
                          value: index,
                          groupValue: currentContent,
                          onChanged: (value) {
                            setState(() {
                              currentContent = value!;
                            });
                          }),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              content[index].title,
                              style: TextStyleHelper.body15
                                  .copyWith(),
                            ),
                            Expanded(
                              child: Text(
                                content[index].description,
                                style: TextStyleHelper.body15.copyWith(color: const Color(0xff545F71)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
      ],
    );
  }
}
