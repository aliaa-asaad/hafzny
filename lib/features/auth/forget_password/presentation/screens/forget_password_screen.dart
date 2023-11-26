import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hafzny/app_widgets/custom_arrow_back.dart';
import 'package:hafzny/app_widgets/custom_button.dart';
import 'package:hafzny/app_widgets/custom_form_field.dart';
import 'package:hafzny/core/validations.dart';
import 'package:hafzny/features/auth/forget_password/data/view_model/bloc/forget_password_bloc.dart';
import 'package:hafzny/routing/navigator.dart';
import 'package:hafzny/routing/routes.dart';
import 'package:hafzny/utilities/images.dart';
import 'package:hafzny/utilities/media_quary.dart';
import 'package:hafzny/utilities/text_style_helper.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen>
    with Validations {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomArrowBack(isAuth: true),
        leadingWidth: MediaQueryHelper.width * .17,
        toolbarHeight: MediaQueryHelper.height * .09,
        backgroundColor: Colors.transparent,
        title: const Text('نسيت كلمة المرور'),
        iconTheme:
            IconTheme.of(context).copyWith(color: Colors.black, size: 17.r),
        elevation: 0.0,
        titleTextStyle: TextStyleHelper.title22.copyWith(
            color: Colors.black,
            fontFamily: 'Cairo',
            fontWeight: FontWeight.normal),
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(24.0.r),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.always,
          child: InkWell(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            focusColor: Colors.transparent,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: BlocBuilder<ForgetPasswordBloc, ForgetPasswordState>(
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      
                      SizedBox(
                        height: MediaQueryHelper.height * .02,
                      ),
                      CustomFormField(
                        labelText: 'رقم الجوال',
                          validator: isValidPhone,
                          icon: ImagesHelper.phone,
                          hintText: 'قم بادخال رقم الجوال',
                          keyboardType: TextInputType.phone,
                          controller:
                              ForgetPasswordBloc.instance.phoneController),
                      SizedBox(
                        height: MediaQueryHelper.height * .02,
                      ),
                      CustomButton(
                        width: state is ForgetPasswordLoading
                            ? MediaQueryHelper.width * .13
                            : MediaQueryHelper.width,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            log('valid');
                            AppRoutes.pushNamedNavigator(
                                routeName: Routes.newPassword);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('تم ارسال الكود')),
                            );
                            //    ForgetPasswordBloc.instance.add(ForgetPasswordPost());
                          } else {
                            log('not valid');
                          }

                          //log('type= ${bloc.type}');
                        },
                        child: state is ForgetPasswordLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Text(
                                'تفعيل رقم الجوال',
                                style: TextStyleHelper.button16.copyWith(
                                  color: Colors.white,
                                ),
                              ), /*  textColor: textColor */
                      ),
                      SizedBox(
                        height: MediaQueryHelper.height * .02,
                      ),
                      state is ForgetPasswordError
                          ? Text(
                              'هناك خطا في البيانات',
                              style: TextStyleHelper.button16,
                            )
                          : const SizedBox()
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      )),
    );
  }
}
