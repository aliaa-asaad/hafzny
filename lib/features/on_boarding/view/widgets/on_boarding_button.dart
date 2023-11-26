import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hafzny/utilities/media_quary.dart';
import 'package:hafzny/utilities/text_style_helper.dart';

class OnBoardingButton extends StatelessWidget {
  final String title;
  final Color color;
  final Color textColor;
  final double width;
  final double height;
  final Function() onPressed;
  const OnBoardingButton({
    super.key,
    required this.title,
    required this.color,
    required this.textColor,
    required this.onPressed, required this.width, required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.r),
        ),
        minimumSize: Size(
          MediaQueryHelper.width * width /* .3 */,
          MediaQueryHelper.height * height /* .053 */,
        ),
      ),
      child: Text(
        title,
        style: TextStyleHelper.button13.copyWith(color: textColor),
      ),
    );
  }
}
