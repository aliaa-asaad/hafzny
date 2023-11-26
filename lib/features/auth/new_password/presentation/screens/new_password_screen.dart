import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hafzny/app_widgets/custom_arrow_back.dart';
import 'package:hafzny/app_widgets/custom_button.dart';
import 'package:hafzny/app_widgets/custom_form_field.dart';
import 'package:hafzny/core/validations.dart';
import 'package:hafzny/features/auth/new_password/data/view_model/bloc/new_password_bloc.dart';
import 'package:hafzny/utilities/images.dart';
import 'package:hafzny/utilities/media_quary.dart';
import 'package:hafzny/utilities/text_style_helper.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> with Validations {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomArrowBack(isAuth: true),
        leadingWidth: MediaQueryHelper.width * .17,
        toolbarHeight: MediaQueryHelper.height * .09,
        backgroundColor: Colors.transparent,
        title: const Text('كلمة مرور جديدة'),
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
        key: NewPasswordBloc.instance.formKey,
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
              child: BlocBuilder<NewPasswordBloc, NewPasswordState>(
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      
                      SizedBox(
                        height: MediaQueryHelper.height * .02,
                      ),

                      CustomFormField(
                          icon: ImagesHelper.password,
                          labelText: 'كلمة المرور الجديدة',
                          validator: isValidPassword,
                          hintText: 'قم بادخال كلمة المرور الجديدة',
                          keyboardType: TextInputType.visiblePassword,
                          isPassword: true,
                          controller:
                              NewPasswordBloc.instance.passwordController),
                      SizedBox(
                        height: MediaQueryHelper.height * .02,
                      ),
                      CustomFormField(
                        labelText: 'تأكيد كلمة المرور الجديدة',
                        icon: ImagesHelper.password,
                        hintText: 'تأكيد كلمة المرور',
                        keyboardType: TextInputType.visiblePassword,
                        controller:
                            NewPasswordBloc.instance.confirmPasswordController,
                        isPassword: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "الرجاء ادخال كلمة المرور التأكيدية";
                          } else if (value !=
                              NewPasswordBloc
                                  .instance.passwordController.text) {
                            return "كلمة المرور غير متطابقة";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: MediaQueryHelper.height * .02,
                      ),

                      // if (state is loginLoaded) {
                      CustomButton(
                        width: state is NewPasswordLoading
                            ? MediaQueryHelper.width * .13
                            : MediaQueryHelper.width,
                        onPressed: () {
                          if (NewPasswordBloc.instance.formKey.currentState!
                              .validate()) {
                            // _formKey.currentState!.save();
                            //log(name);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('تم حفظ البيانات')),
                            );
                            //  NewPasswordBloc.instance.add(NewPasswordPost());
                          } else {
                            log('not valid');
                          }
                          //  log('type= ${bloc.type}');
                        },
                        child: state is NewPasswordLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Text(
                                'تأكيد كلمة المرور',
                                style: TextStyleHelper.subtitle19.copyWith(
                                  color: Colors.white,
                                ),
                              ), /*  textColor: textColor */
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
