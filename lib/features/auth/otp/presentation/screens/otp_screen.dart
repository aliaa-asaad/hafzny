import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hafzny/app_widgets/custom_arrow_back.dart';
import 'package:hafzny/app_widgets/custom_button.dart';
import 'package:hafzny/app_widgets/custom_text_button.dart';
import 'package:hafzny/core/validations.dart';
import 'package:hafzny/features/auth/otp/data/view_model/bloc/otp_bloc.dart';
import 'package:hafzny/features/auth/otp/presentation/widgets/otp_code_field.dart';
import 'package:hafzny/routing/navigator.dart';
import 'package:hafzny/routing/routes.dart';
import 'package:hafzny/utilities/media_quary.dart';
import 'package:hafzny/utilities/text_style_helper.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> with Validations {
  @override
  Widget build(BuildContext context) {
    // var bloc = BlocProvider.of<AuthBloc>(context);
    return Scaffold(
      appBar: AppBar(
        leading: const CustomArrowBack(),
        leadingWidth: MediaQueryHelper.width * .17,
        toolbarHeight: MediaQueryHelper.height * .09,
        backgroundColor: Colors.transparent,
        title: const Text('تفعيل رقم الجوال'),
        iconTheme:
            IconTheme.of(context).copyWith(color: Colors.black, size: 17.r),
        elevation: 0.0,
        titleTextStyle: TextStyleHelper.title22.copyWith(
            color: Colors.black,
            fontFamily: 'Cairo',
            fontWeight: FontWeight.normal),
      ),
      body: SafeArea(
          child: Form(
        key: OTPBloc.instance.formKey,
        autovalidateMode: AutovalidateMode.always,
        child: InkWell(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          focusColor: Colors.transparent,
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(24.0.r),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: BlocBuilder<OTPBloc, OTPState>(
                  builder: (context, state) {
                    return Column(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'تم ارسال كود التفعيل المكون من 4 ارقام فى رسالة قصيرة على الرقم',
                          style: TextStyleHelper.body15
                              .copyWith(color: const Color(0xff545F71)),
                        ),
                        SizedBox(
                          height: MediaQueryHelper.height * .02,
                        ),
                        ///// make it list.generate
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              OTPCodeField(
                                controller: OTPBloc.instance.codeController4,
                              ),
                              OTPCodeField(
                                controller: OTPBloc.instance.codeController3,
                              ),
                              OTPCodeField(
                                controller: OTPBloc.instance.codeController2,
                              ),
                              OTPCodeField(
                                controller: OTPBloc.instance.codeController1,
                              ),
                            ]),
                        SizedBox(
                          height: MediaQueryHelper.height * .02,
                        ),

                        // if (state is loginLoaded) {
                        CustomButton(
                          width: state is OTPLoading
                              ? MediaQueryHelper.width * .13
                              : MediaQueryHelper.width,
                          onPressed: () {
                            if (OTPBloc.instance.formKey.currentState!
                                .validate()) {
                              log('valid');
                              log('log ${OTPBloc.instance.codeController1}');
                              log('log ${OTPBloc.instance.codeController1.text}');
                              //  log('log ${OTPBloc.instance.emailController}');
                              log([
                                OTPBloc.instance.codeController1.text,
                                OTPBloc.instance.codeController2.text,
                                OTPBloc.instance.codeController3.text,
                                OTPBloc.instance.codeController4.text,
                              ].join());
                              // _formKey.currentState!.save();
                              //log(name);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('تم حفظ البيانات')),
                                    
                              );
                              AppRoutes.pushNamedNavigator(routeName: Routes.home);
                             // OTPBloc.instance.add(OTPPost());
                            } else {
                              log('not valid');
                            }
                            log([
                              OTPBloc.instance.codeController1.text,
                              OTPBloc.instance.codeController2.text,
                              OTPBloc.instance.codeController3.text,
                              OTPBloc.instance.codeController4.text,
                            ].join());
                            //log('type= ${bloc.type}');
                          },
                          child: state is OTPLoading
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : Text(
                                  'تفعيل رقم الجوال',
                                  style: TextStyleHelper.button16.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                          /*  textColor: textColor */
                        ),
                        CustomTextButton(
                          text: 'اعادة ارسال الكود',
                          onPressed: () {},
                        ),
                        SizedBox(
                          height: MediaQueryHelper.height * .02,
                        ),
                        state is OTPError
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
        ),
      )),
    );
  }
}
