import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hafzny/utilities/media_quary.dart';
import 'package:hafzny/utilities/text_style_helper.dart';

class CustomButton extends StatelessWidget {
  final Function() onPressed;
  final String? text;
  final Color? background;
  final Color? textColor;
  final bool isOpacity;
  final Widget? child;
  final double? width;
  const CustomButton(
      {super.key,
      required this.onPressed,
      this.text,
      this.background,
      this.textColor,
      this.child,
      this.width,
      this.isOpacity = false});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onPressed,
        child: AnimatedContainer(
          // padding: EdgeInsets.symmetric(horizontal: 16.w),
          width: width ?? MediaQueryHelper.width,
          margin: EdgeInsets.symmetric(
            vertical: 8.r, /* horizontal: 16.r */
          ),
          height: MediaQueryHelper.height * .06,
          curve: Curves.easeInOut,
          alignment: Alignment.center,
          /* padding: EdgeInsets.symmetric(
                            vertical: 8.r, horizontal: 32.r), */
          decoration: BoxDecoration(
            color: background ?? Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(4.r),
            border: Border.all(
                color: Theme.of(context).colorScheme.background.withOpacity(.1), width: isOpacity ? 1 : 0),
            /* shape: state is RegisterLoading
                              ? BoxShape.circle
                              : null, */
          ),
          duration: const Duration(seconds: 1),
          child: child ??
              Text(text!,
                  style: TextStyleHelper.button16
                      .copyWith(color: textColor ?? Colors.white)),
        ),
      ),
    );
  }
}
