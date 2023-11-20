import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hafzny/app_widgets/custom_arrow_back.dart';
import 'package:hafzny/app_widgets/custom_button.dart';
import 'package:hafzny/app_widgets/custom_form_field.dart';
import 'package:hafzny/core/validations.dart';
import 'package:hafzny/features/auth/register/data/view_model/bloc/sign_up_bloc.dart';
import 'package:hafzny/routing/navigator.dart';
import 'package:hafzny/routing/routes.dart';
import 'package:hafzny/utilities/images.dart';
import 'package:hafzny/utilities/media_quary.dart';
import 'package:hafzny/utilities/text_style_helper.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> with Validations {
//  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //var bloc = BlocProvider.of<AuthBloc>(context);
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
      ), body: SafeArea(
          child: Form(
        key: SignUpBloc.instance.formKey,
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
              physics: const BouncingScrollPhysics(),
              child: BlocBuilder<SignUpBloc, SignUpState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      SizedBox(
                        height: MediaQueryHelper.height * .02,
                      ),
                      CustomFormField(
                          labelText: 'الاسم بالكامل',
                          validator: isValidName,
                          icon: ImagesHelper.name,
                          hintText: 'قم بادخال الاسم',
                          keyboardType: TextInputType.name,
                          controller: SignUpBloc.instance.fullNameController),
                      SizedBox(
                        height: MediaQueryHelper.height * .02,
                      ),
                      CustomFormField(
                          labelText: 'رقم الجوال',
                          validator: isValidPhone,
                          icon: ImagesHelper.phone,
                          hintText: 'قم بادخال رقم الهاتف ',
                          keyboardType: TextInputType.phone,
                          controller:
                              SignUpBloc.instance.phoneNumberController),
                      SizedBox(
                        height: MediaQueryHelper.height * .02,
                      ),
                      CustomFormField(
                        labelText: 'البريد الالكتروني',
                        validator: isValidEmail,
                        icon: ImagesHelper.email,
                        hintText: 'قم بادخال البريد الالكتروني ',
                        keyboardType: TextInputType.emailAddress,
                        controller: SignUpBloc.instance.emailController,
                      ),
                      SizedBox(
                        height: MediaQueryHelper.height * .02,
                      ),
                      CustomFormField(
                        labelText: 'كلمة المرور',
                        validator: isValidPassword,
                        icon: ImagesHelper.password,
                        hintText: 'قم بادخال كلمة المرور ',
                        keyboardType: TextInputType.visiblePassword,
                        isPassword: true,
                        controller: SignUpBloc.instance.passwordController,
                      ),
                      SizedBox(
                        height: MediaQueryHelper.height * .02,
                      ),
                      CustomFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "الرجاء ادخال كلمة المرور التأكيدية";
                            } else if (value !=
                                SignUpBloc.instance.passwordController.text) {
                              return "كلمة المرور غير متطابقة";
                            }
                            return null;
                          },
                          labelText: 'تأكيد كلمة المرور',
                          icon: ImagesHelper.password,
                          hintText: 'قم بادخال تأكيد كلمة المرور',
                          isPassword: true,
                          keyboardType: TextInputType.visiblePassword,
                          controller:
                              SignUpBloc.instance.confirmPasswordController),
                      SizedBox(
                        height: MediaQueryHelper.height * .02,
                      ),
                      state is SignUpError
                          ? Text(
                              'هناك خطا في البيانات',
                              style: TextStyleHelper.button16,
                            )
                          : const SizedBox(),
                      CustomButton(
                        width: state is SignUpLoading
                            ? MediaQueryHelper.width * .13
                            : MediaQueryHelper.width,
                        onPressed: () {
                          if (SignUpBloc.instance.formKey.currentState!
                              .validate()) {
                            // _formKey.currentState!.save();
                            //log(name);
                            AppRoutes.pushNamedNavigator(routeName: Routes.otp);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('تم حفظ البيانات')),
                            );
                          //  SignUpBloc.instance.add(SignUpPost());
                          } else {
                            log('not valid');
                          }
                          // log('type= ${AuthBloc.instance.type}');
                        },
                        child: state is SignUpLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Text(
                                'انشاء حساب جديد',
                                style: TextStyleHelper.button16.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                        /*  textColor: textColor */
                      ),
                      CustomButton(
                        background: Theme.of(context)
                            .colorScheme
                            .secondary
                            .withOpacity(.1),
                        width: state is SignUpLoading
                            ? MediaQueryHelper.width * .13
                            : MediaQueryHelper.width,
                        child: state is SignUpLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Text(
                                'لدي حساب بالفعل',
                                style: TextStyleHelper.button16.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                              ),
                        onPressed: () {
                          AppRoutes.pushNamedNavigator(routeName: Routes.login);
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
                },
              ),
            ),
          ),
        ),
      )),
    );
  }
}
