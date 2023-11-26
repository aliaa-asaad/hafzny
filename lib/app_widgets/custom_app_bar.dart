import 'package:flutter/material.dart';
import 'package:hafzny/app_widgets/custom_notification_button.dart';
import 'package:hafzny/utilities/text_style_helper.dart';

class CustomAppBar extends StatelessWidget {
  final bool isHome;
  final String? title;
  const CustomAppBar({
    super.key,
    this.isHome = false,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CircleAvatar(
          radius: 35,
          //  backgroundImage: const AssetImage('assets/images/1.jpg'),
        ),
        const SizedBox(width: 10),
        isHome
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'اهلا بك',
                    style: TextStyleHelper.button16
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text('محمد ابراهيم احمد ',
                      style: TextStyleHelper.button13.copyWith(
                          color: const Color(
                            0xff545F71,
                          ),
                          fontWeight: FontWeight.normal)),
                ],
              )
            : Text(
                title!,
                style: TextStyleHelper.subtitle19,
              ),
        isHome ? const Spacer() : const SizedBox(),
        const CustomNotificationIcon(),
      ],
    );
  }
}
