import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hafzny/app_widgets/custom_arrow_back.dart';
import 'package:hafzny/app_widgets/custom_button.dart';
import 'package:hafzny/app_widgets/custom_form_field.dart';
import 'package:hafzny/core/validations.dart';
import 'package:hafzny/features/auth/login/data/view_model/bloc/login_bloc.dart';
import 'package:hafzny/routing/navigator.dart';
import 'package:hafzny/routing/routes.dart';
import 'package:hafzny/utilities/images.dart';
import 'package:hafzny/utilities/media_quary.dart';
import 'package:hafzny/utilities/text_style_helper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with Validations {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomArrowBack(),
        leadingWidth: MediaQueryHelper.width * .17,
        toolbarHeight: MediaQueryHelper.height * .09,
        backgroundColor: Colors.transparent,
        title: const Text('تسجيل الدخول'),
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
        key: LoginBloc.instance.formKey,
        autovalidateMode: AutovalidateMode.always,
        child: InkWell(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          focusColor: Colors.transparent,
          child: Padding(
            padding: EdgeInsets.all(24.0.r),
            child: SingleChildScrollView(
              child:
                  BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQueryHelper.height * .04,
                    ),
                    CustomFormField(
                        labelText: 'رقم الجوال',
                        validator: isValidPhone,
                        icon: ImagesHelper.phone,
                        hintText: 'ادخل رقم الجوال',
                        keyboardType: TextInputType.phone,
                        controller: LoginBloc.instance.phoneNumberController),
                    SizedBox(
                      height: MediaQueryHelper.height * .02,
                    ),
                    CustomFormField(
                        labelText: 'كلمة المرور',
                        validator: isValidPassword,
                        icon: ImagesHelper.password,
                        hintText: 'ادخل كلمة المرور',
                        keyboardType: TextInputType.visiblePassword,
                        isPassword: true,
                        controller: LoginBloc.instance.passwordController),
                    SizedBox(
                      height: MediaQueryHelper.height * .02,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () {
                          AppRoutes.pushNamedNavigator(
                              routeName: Routes.forgetPassword);
                          /* AuthBloc.instance.isForgetPassword = true;
                           */
                        },
                        child: Text(
                          'نسيت كلمة المرور!',
                          style: TextStyleHelper.body15.copyWith(
                              color: Theme.of(context).colorScheme.primary),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQueryHelper.height * .02,
                    ),
                    state is LoginError
                        ? Text(
                            'هناك خطا في البيانات',
                            style: TextStyleHelper.subtitle19,
                          )
                        : const SizedBox(),
                    // if (state is loginLoaded) {
                    CustomButton(
                      width: state is LoginLoading
                          ? MediaQueryHelper.width * .13
                          : MediaQueryHelper.width,
                      child: state is LoginLoading
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text(
                              'تسجيل الدخول',
                              style: TextStyleHelper.button16.copyWith(
                                color: Colors.white,
                              ),
                            ),
                      onPressed: () {
                        if (LoginBloc.instance.formKey.currentState!
                            .validate()) {
                          // _formKey.currentState!.save();
                          //log(name);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('تم حفظ البيانات')),
                          );
                          AppRoutes.pushNamedNavigator(routeName: Routes.home);
                          //LoginBloc.instance.add(LoginPost());
                          //BlocProvider.of<NotificationCubit>(context).getPusherBeams();
                        } else {
                          log('not valid');
                        }
                        // log('type= ${bloc.type}');
                      },
                      /*  textColor: textColor */
                    ),

                    CustomButton(
                      background: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(.1),
                      width: state is LoginLoading
                          ? MediaQueryHelper.width * .13
                          : MediaQueryHelper.width,
                      child: state is LoginLoading
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text(
                              'ليس لديك حساب ؟ انشاء حساب جديد',
                              style: TextStyleHelper.button16.copyWith(
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                      onPressed: () {
                        AppRoutes.pushNamedNavigator(routeName: Routes.signUp);
                        /*  if (LoginBloc.instance.formKey.currentState!
                            .validate()) {
                          // _formKey.currentState!.save();
                          //log(name);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('تم حفظ البيانات')),
                          );
                          LoginBloc.instance.add(LoginPost());
                          //BlocProvider.of<NotificationCubit>(context).getPusherBeams();
                        } else {
                          log('not valid');
                        } */
                        // log('type= ${bloc.type}');
                      },
                      /*  textColor: textColor */
                    ),
                  ],
                );

                //return const Text('');
              }),
            ),
          ),
        ),
      )),
    );
  }
}
