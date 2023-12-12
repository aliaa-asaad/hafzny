import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hafzny/app_widgets/custom_button.dart';
import 'package:hafzny/app_widgets/custom_form_field.dart';
import 'package:hafzny/app_widgets/custom_sized_button.dart';
import 'package:hafzny/routing/navigator.dart';
import 'package:hafzny/routing/routes.dart';
import 'package:hafzny/utilities/images.dart';
import 'package:hafzny/utilities/media_quary.dart';
import 'package:hafzny/utilities/text_style_helper.dart';

class ReserveSession extends StatefulWidget {
  const ReserveSession({super.key});

  @override
  State<ReserveSession> createState() => _ReserveSessionState();
}

class _ReserveSessionState extends State<ReserveSession> {
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  DateTime? date;

  startDateMethod() async {
    await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2001, 1, 1),
      lastDate: DateTime(2025, 12, 30),
    ).then((value) {
      setState(() {
        date = value;
        log('start :${date.toString()}');

        dateController.text = '${date!.day}/${date!.month}/${date!.year}';
      });
      if (value == null) {
        return;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomSizedButton(
          title: 'حجز موعد لوقت لاحق',
          size: Size(MediaQueryHelper.width * .7, 48),
          onPressed: () {
            showModalBottomSheet(
              shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(32))),
              context: context,
              builder: (_) => Container(
                padding: EdgeInsets.all(16.0.r),
                height: 410,
                width: MediaQueryHelper.width,
                child: Column(
                  children: [
                    Text(
                      'حجز موعد',
                      style: TextStyleHelper.subtitle19,
                    ),
                    Text(
                      'قم بحجز جلسة مع محمد ابراهيم احمد',
                      style: TextStyleHelper.body15.copyWith(
                          color: Theme.of(context).colorScheme.background),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomFormField(
                        isReadOnly: true,
                        labelText: 'اختر يوم الحجز',
                        isWidget: true,
                        customSuffixIconButton: IconButton(
                          onPressed: () {
                            startDateMethod();
                          },
                          icon: SvgPicture.asset(
                            ImagesHelper.sessionDateIcon,
                          ),
                        ),
                        hintText: 'قم بتحديد يوم الحجز',
                        keyboardType: TextInputType.text,
                        controller: dateController),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomFormField(
                        isReadOnly: true,
                        labelText: 'حدد الوقت',
                        isWidget: true,
                        customSuffixIconButton: IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            ImagesHelper.dropDownIcon,
                          ),
                        ),
                        hintText: 'قم بتحديد وقت الحجز',
                        keyboardType: TextInputType.text,
                        controller: timeController),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomButton(
                      onPressed: () {
                        AppRoutes.pushNamedNavigator(
                            routeName: Routes.teacherReservationSuccess);
                      },
                      child: Text(
                        'حجز',
                        style: TextStyleHelper.button16
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        const SizedBox(
          width: 10,
        ),
        ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                minimumSize: const Size(48, 48),
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(
                        width: 1,
                        color: Theme.of(context)
                            .colorScheme
                            .background
                            .withOpacity(.1))),
                backgroundColor: const Color(0xffD04545).withOpacity(.2)),
            child: SvgPicture.asset(
              ImagesHelper.favoriteIcon,
              //   color: Theme.of(context).colorScheme.primary,
            ))
      ],
    );
  }
}
