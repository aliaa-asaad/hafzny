import 'package:flutter/material.dart';
import 'package:hafzny/app_widgets/custom_arrow_back.dart';
import 'package:hafzny/app_widgets/custom_button.dart';
import 'package:hafzny/utilities/text_style_helper.dart';

class TeacherReservationSuccessScreen extends StatelessWidget {
  const TeacherReservationSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> content = [
      {
        'subTitle': 'محمد ابراهيم احمد',
        'title': 'اسم المعلم',
      },
      {
        'subTitle': '#CODE',
        'title': 'كود الطلب',
      },
      {
        'subTitle': '15 اغسطس 2023',
        'title': 'تاريخ الطلب',
      },
      {
        'subTitle': '03:00 م',
        'title': 'الوقت',
      },
    ];
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Align(alignment: Alignment.centerRight, child: CustomArrowBack()),
            SizedBox(
              height: 20,
            ),
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey,
              //  backgroundImage: const AssetImage('assets/images/1.jpg'),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'تهانينا تم الحجز بنجاح',
              style: TextStyleHelper.subtitle19,
            ),
            Text(
              'تم حجز الحصة بنجاح وسيتم التواصل معك من قبل المعلم',
              style: TextStyleHelper.body15
                  .copyWith(color: Theme.of(context).colorScheme.background),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              children: List.generate(
                content.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        content[index]['title'],
                        style: TextStyleHelper.body15
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        content[index]['subTitle'],
                        style: TextStyleHelper.body15.copyWith(
                            color: Theme.of(context).colorScheme.background,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Spacer(),
            CustomButton(
              onPressed: () {},
              text: 'راجع قائمة الحجوزات',
            ),
            CustomButton(
              onPressed: () {},
              text: 'العودة للرئيسية',
              textColor: Theme.of(context).colorScheme.secondary,
              background:
                  Theme.of(context).colorScheme.secondary.withOpacity(.1),
            )
          ],
        ),
      )),
    );
  }
}
