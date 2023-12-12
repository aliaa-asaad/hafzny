import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hafzny/app_widgets/custom_arrow_back.dart';
import 'package:hafzny/app_widgets/custom_button.dart';
import 'package:hafzny/features/sessions/presentation/widgets/custom_rating.dart';
import 'package:hafzny/utilities/media_quary.dart';
import 'package:hafzny/utilities/text_style_helper.dart';

class SessionsRateScreen extends StatefulWidget {
  const SessionsRateScreen({super.key});

  @override
  State<SessionsRateScreen> createState() => _SessionsRateScreenState();
}

class _SessionsRateScreenState extends State<SessionsRateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: MediaQueryHelper.width * .17,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        title: Text(
          'تقييم الجلسة',
          style:
              TextStyleHelper.subtitle19 /* .copyWith(color: Colors.white) */,
        ),
        backgroundColor: Colors.white,
        elevation: .0,
        leading: const CustomArrowBack(),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        padding: EdgeInsets.all(20.0.r),
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(
              height: 32,
            ),
            const CircleAvatar(
              radius: 50,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'تقييم الجلسة',
              style: TextStyleHelper.subtitle17
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            /*  SizedBox(
              height: 10,
            ), */
            Text(
              'يوضع تقييم الجلسة في صفحة الجلسة',
              style: TextStyleHelper.body15
                  .copyWith(color: Theme.of(context).colorScheme.background),
            ),
            const SizedBox(
              height: 16,
            ),
            const CustomRating(
              height: 32,
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'اترك تعليق',
                style: TextStyleHelper.body15
                    .copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextFormField(
              maxLines: 3,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(8.0.r),
                hintText: 'قم بكتابة تعليقك هنا',
                hintStyle: TextStyleHelper.button13,
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(4),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              onPressed: () {},
              text: 'إرسال التقييم',
            )
          ],
        ),
      )),
    );
  }
}
