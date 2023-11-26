import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hafzny/utilities/media_quary.dart';
import 'package:hafzny/utilities/text_style_helper.dart';

class StudentAgeGroup extends StatefulWidget {
  const StudentAgeGroup({super.key});

  @override
  State<StudentAgeGroup> createState() => _StudentAgeGroupState();
}

class _StudentAgeGroupState extends State<StudentAgeGroup> {
  int currentIndex = -1;
  List content = ['5-12', '13-19', '20-29', '30-39', '40-49', '+50'];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'الفئة العمرية التى تنتمي إليها',
          style: TextStyleHelper.subtitle19
              .copyWith(color: const Color(0xff192C4A)),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 250,
          child: GridView.builder(
            itemCount: content.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 300,
                childAspectRatio: 4 / 5,
                crossAxisSpacing: 20,
                mainAxisSpacing: 6,
                mainAxisExtent: 75),
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(bottom: 10.h),
              child: InkWell(
                borderRadius: BorderRadius.circular(4.r),
                onTap: () {
                  setState(() {
                    currentIndex = index;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(4.r),
                  alignment: Alignment.center,
                  // margin: EdgeInsets.only(bottom: 10.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(color: Colors.grey.shade300),
                      color: currentIndex == index
                          ? Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(.1)
                          : const Color(0xff50617D).withOpacity(.02)),
                  height: MediaQueryHelper.height * .13,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Radio(
                          activeColor: Theme.of(context).colorScheme.primary,
                          value: index,
                          groupValue: currentIndex,
                          onChanged: (value) {
                            setState(() {
                              currentIndex = value!;
                            });
                          }),
                      Text(
                        content[index],
                        style: TextStyleHelper.body15
                            ,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 148,
        )
      ],
    );
  }
}
