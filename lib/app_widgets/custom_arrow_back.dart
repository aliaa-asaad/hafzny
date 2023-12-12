import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hafzny/utilities/media_quary.dart';

class CustomArrowBack extends StatelessWidget {
  final bool isAuth;
  const CustomArrowBack({
    super.key,
    this.isAuth = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20.0.r) /* :EdgeInsets.zero */,
      child: Ink(
        decoration: BoxDecoration(
            color: const Color(0xff50617D).withOpacity(.1),
            shape: BoxShape.circle),
        child: IconButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Platform.isIOS
              ? Icon(
                  Icons.arrow_back_ios,
                  size: MediaQueryHelper.height * .025,
                )
              : Icon(
                  Icons.arrow_back,
                  size: MediaQueryHelper.height * .025,
                ),
        ),
      ),
    );
  }
}
