import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hafzny/app_widgets/custom_arrow_back.dart';
import 'package:hafzny/utilities/images.dart';
import 'package:hafzny/utilities/media_quary.dart';
import 'package:hafzny/utilities/text_style_helper.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQueryHelper.height * .09,
        leadingWidth: MediaQueryHelper.width * .17,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        title: Text(
          'الاشعارات',
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
            children: List.generate(
              10,
              (index) {
                return Container(
                  padding: const EdgeInsets.all(8),
                  margin: EdgeInsets.only(bottom: 12.h),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context)
                              .colorScheme
                              .background
                              .withOpacity(.1),
                          width: 1),
                      borderRadius: BorderRadius.circular(8.r),
                      color: Colors.white),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: SvgPicture.asset(
                          ImagesHelper.notificationIcon,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'موعد حجزك اليوم مع محمد على ابراهيم بعد 30 دقيقة لات نسى ذلك',
                              style: TextStyleHelper.body15
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'منذ 10 دقائق',
                              style: TextStyleHelper.button13.copyWith(
                                /*  overflow: TextOverflow.ellipsis, */
                                fontWeight: FontWeight.w300,
                                color: Theme.of(context).colorScheme.background,
                              ),
                              /* overflow: TextOverflow.ellipsis, */
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
