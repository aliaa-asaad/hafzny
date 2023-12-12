import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hafzny/app_widgets/custom_app_bar.dart';
import 'package:hafzny/app_widgets/teacher_rate.dart';
import 'package:hafzny/features/home/presentation/widgets/custom_package.dart';
import 'package:hafzny/features/home/presentation/widgets/custom_slider.dart';
import 'package:hafzny/utilities/images.dart';
import 'package:hafzny/utilities/text_style_helper.dart';

class StudentHomeScreen extends StatelessWidget {
  const StudentHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.all(20.0.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBar(isHome: true),
              const SizedBox(
                height: 10,
              ),
              const CustomSlider(),
              const SizedBox(
                height: 10,
              ),
              const CustomPackage(),
              Text('المعلمون الاكثر تقييما', style: TextStyleHelper.subtitle17.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 120,
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: 10,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  const CircleAvatar(
                                    radius: 35,
                                    backgroundColor: Colors.grey,
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 6,
                                    child: CircleAvatar(
                                      radius: 9,
                                      backgroundColor:
                                          Colors.green.withOpacity(.5),
                                      child: const CircleAvatar(
                                          radius: 7,
                                          backgroundColor: Colors.green),
                                      /*  child: const Icon(
                            Icons.star,
                            color: Colors.white,
                            size: 10,
                          ), */
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                'محمد ابراهيم احمد ',
                                style: TextStyleHelper.caption11,
                              ),
                              TeacherRate()
                            ],
                          ),
                        ),),
              )
            ],
          ),
        ),
      ),
    );
  }
}

