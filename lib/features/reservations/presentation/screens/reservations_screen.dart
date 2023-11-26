import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hafzny/app_widgets/active_avatar.dart';
import 'package:hafzny/app_widgets/custom_app_bar.dart';
import 'package:hafzny/app_widgets/teacher_details_text.dart';
import 'package:hafzny/features/reservations/presentation/widgets/reservation_month.dart';
import 'package:hafzny/features/reservations/presentation/widgets/resesrvation_day.dart';
import 'package:hafzny/utilities/images.dart';
import 'package:hafzny/utilities/media_quary.dart';
import 'package:hafzny/utilities/text_style_helper.dart';

class ReservationsScreen extends StatelessWidget {
  const ReservationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.0.r),
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBar(
                title: 'الحجوزات',
              ),
              const SizedBox(
                height: 20,
              ),
              const ReservationMonth(),
              const ReservationDay(),
              const SizedBox(
                height: 10,
              ),
              Text(
                'حجوزات اليوم',
                style: TextStyleHelper.body15
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                children: List.generate(
                    4,
                    (index) => Container(
                          padding: const EdgeInsets.all(16),
                          margin: const EdgeInsets.only(bottom: 16),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Column(children: [
                            Row(
                              children: [
                                const ActiveAvatar(),
                                const SizedBox(
                                  width: 10,
                                ),
                                const TeacherDetailsText(),
                                const Spacer(),
                                IconButton(
                                  onPressed: () {},
                                  icon:
                                      SvgPicture.asset(ImagesHelper.deleteIcon),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                      minimumSize: Size(
                                          MediaQueryHelper.width * .45, 44),
                                      backgroundColor:
                                          Theme.of(context).colorScheme.primary,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(28),
                                      )),
                                  onPressed: () {},
                                  icon:
                                      SvgPicture.asset(ImagesHelper.videoIcon),
                                  label: const Text('دخول الجلسة'),
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                      minimumSize: Size(
                                          MediaQueryHelper.width * .32, 44),
                                      backgroundColor: Theme.of(context)
                                          .colorScheme
                                          .primary
                                          .withOpacity(.1),
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              width: 1,
                                              color: Colors.grey.shade300),
                                          borderRadius:
                                              BorderRadius.circular(28))),
                                  child: Text(
                                    'الان',
                                    style: TextStyleHelper.body15
                                        .copyWith(fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          ]),
                        )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
