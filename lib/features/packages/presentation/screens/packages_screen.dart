import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hafzny/app_widgets/custom_arrow_back.dart';
import 'package:hafzny/app_widgets/custom_sized_button.dart';
import 'package:hafzny/utilities/images.dart';
import 'package:hafzny/utilities/media_quary.dart';
import 'package:hafzny/utilities/text_style_helper.dart';

class PackagesScreen extends StatelessWidget {
  const PackagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQueryHelper.height * .09,
        leadingWidth: MediaQueryHelper.width * .17,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        title: Text(
          'الباقات',
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
              Container(
                padding: const EdgeInsets.fromLTRB(12, 0, 12, 16),
                margin: EdgeInsets.only(bottom: 12.h),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context)
                          .colorScheme
                          .background
                          .withOpacity(.1),
                      width: 1),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Row(
                  //  crossAxisAlignment: CrossAxisAlignment.center,
                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        SvgPicture.asset(
                          ImagesHelper.diamondIcon,
                          height: 64,
                          // color: Theme.of(context).colorScheme.primary,
                        ),
                        Text(
                          'الباقة الفضية',
                          style: TextStyleHelper.body15
                              .copyWith(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SizedBox(width: MediaQueryHelper.width * .235),
                    Column(
                      children: [
                        Text.rich(
                          TextSpan(
                            text: '130',
                            style: TextStyleHelper.title22,
                            children: [
                              TextSpan(
                                  text: ' دقيقة',
                                  style: TextStyleHelper.body15),
                            ],
                          ),
                        ),
                        Text(
                          'صالحة لمدة 180 يوم',
                          style: TextStyleHelper.body15,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        CustomSizedButton(
                          title: '300 ريال',
                          size: const Size(140, 48),
                          onPressed: () {},
                          textStyle: TextStyleHelper.title22
                              .copyWith(color: Colors.white),
                        )
                      ],
                    )
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
