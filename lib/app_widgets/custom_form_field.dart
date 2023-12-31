import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hafzny/utilities/images.dart';
import 'package:hafzny/utilities/media_quary.dart';
import 'package:hafzny/utilities/text_style_helper.dart';

class CustomFormField extends StatefulWidget {
  final String? hintText;
  final TextInputType keyboardType;
  final bool isPassword;
  final bool isAuth;
  final Color? fillColor;
  final String icon;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final Widget? iconWidget;
  final Widget? customSuffixIconButton;
  final Widget? customPreffixIconButton;
  final Color? hintColor;
  final bool isReadOnly;
  final bool isLabeled;
  final String labelText;
  final bool isWidget;
  const CustomFormField({
    super.key,
    required this.hintText,
    required this.keyboardType,
    this.isPassword = false,
    required this.controller,
    this.icon = '',
    this.validator,
    this.isAuth = true,
    this.fillColor,
    this.iconWidget,
    this.hintColor,
    this.labelText = '',
    this.isWidget = false,
    this.customSuffixIconButton,
    this.customPreffixIconButton,
    this.isLabeled = true,
    this.isReadOnly = false,
  });

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  bool passwordVisible = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.isLabeled
            ? Text(widget.labelText,
                style: TextStyleHelper.body15
                    .copyWith(fontWeight: FontWeight.bold))
            : const SizedBox(),
        SizedBox(
          height: MediaQueryHelper.height * .01,
        ),
        TextFormField(
          readOnly: widget.isReadOnly ? true : false,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: widget.validator,
          keyboardType: widget.keyboardType,
          textInputAction: TextInputAction.next,
          obscureText: widget.isPassword ? passwordVisible : false,
          controller: widget.controller,
          enabled: true,
          style: TextStyleHelper.button13.copyWith(
              height: 1.h,
              fontWeight: FontWeight
                  .normal) /* TextStyle(
            height: 1.1.h,
            fontSize: 16.sp,
          ) */
          ,
          decoration: InputDecoration(
            //check this
            //  focusedBorder: InputBorder.none,
            //  errorStyle: TextStyleHelper.caption11,
            fillColor: widget.fillColor ??
                Theme.of(context).colorScheme.background.withOpacity(.02),
            filled: true,
            suffixIcon: widget.isWidget
                ? widget.customSuffixIconButton
                : widget.isAuth
                    ? widget.isPassword
                        ? IconButton(
                            onPressed: () {
                              setState(() {
                                passwordVisible = !passwordVisible;
                              });
                            },
                            icon: passwordVisible
                                ? SvgPicture.asset(
                                    ImagesHelper.invisiblePassword,
                                    height: MediaQueryHelper.height * .03,
                                  )
                                : SvgPicture.asset(
                                    ImagesHelper.visiblePassword,
                                    height: MediaQueryHelper.height * .03,
                                  ),
                          )
                        : const SizedBox()
                    : Padding(
                        padding: EdgeInsets.all(12.0.r),
                        child: widget.iconWidget,
                      ),
            prefixIcon: widget.isWidget
                ? widget.customPreffixIconButton
                : widget.isAuth
                    ? Padding(
                        padding: EdgeInsets.all(12.0.r),
                        child: SvgPicture.asset(
                          widget.icon,
                          height: MediaQueryHelper.height * .02,
                        ),
                      )
                    : null,
            hintStyle: TextStyleHelper.button13.copyWith(
                color:
                    widget.hintColor ?? const Color(0xff50617D).withOpacity(.5),
                fontWeight: FontWeight.normal),
            hintText: widget.hintText,
            border: OutlineInputBorder(
              /* borderSide: BorderSide(
                style: BorderStyle.solid,
                color: Colors.green,
              ), */
              borderRadius: BorderRadius.all(
                Radius.circular(8.0.r),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                style: BorderStyle.solid,
                color: const Color(0xff545F71).withOpacity(.1),
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(8.0.r),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
