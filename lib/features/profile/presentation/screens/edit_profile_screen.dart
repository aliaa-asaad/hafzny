import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hafzny/app_widgets/custom_arrow_back.dart';
import 'package:hafzny/app_widgets/custom_button.dart';
import 'package:hafzny/app_widgets/custom_form_field.dart';
import 'package:hafzny/features/profile/data/view_model/bloc/profile_bloc.dart';
import 'package:hafzny/features/profile/presentation/widgets/custom_uplaod_image.dart';
import 'package:hafzny/utilities/images.dart';
import 'package:hafzny/utilities/media_quary.dart';
import 'package:hafzny/utilities/text_style_helper.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQueryHelper.height * .09,
        leadingWidth: MediaQueryHelper.width * .17,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        title: Text(
          'بيانات الحساب',
          style:
              TextStyleHelper.subtitle19 /* .copyWith(color: Colors.white) */,
        ),
        backgroundColor: Colors.white,
        elevation: .0,
        leading: const CustomArrowBack(),
      ),
      body: SafeArea(
        child: Form(
          key: ProfileBloc.instance.formKey,
          child: InkWell(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            focusColor: Colors.transparent,
            child: BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, state) {
                return SingleChildScrollView(
                  padding: EdgeInsets.all(20.0.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(child: CustomUploadImage()),
                      const SizedBox(
                        height: 10,
                      ),

                      Text('بيانات الحساب',
                          style: TextStyleHelper.title22.copyWith(
                              color: Theme.of(context).colorScheme.primary)),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomFormField(
                          isLabeled: true,
                          labelText: 'الاسم الكامل',
                          //   validator: isValidName,
                          hintText:
                              ProfileBloc.instance.fullNameController.text,
                          iconWidget:
                              SvgPicture.asset(ImagesHelper.editFieldIcon),
                          isAuth: false,
                          keyboardType: TextInputType.name,
                          controller: ProfileBloc.instance.fullNameController),
                      SizedBox(
                        height: MediaQueryHelper.height * .02,
                      ),
                      CustomFormField(
                          // validator: isValidPhone,
                          isLabeled: true,
                          labelText: 'رقم الجوال',
                          iconWidget:
                              SvgPicture.asset(ImagesHelper.editFieldIcon),
                          isAuth: false,
                          hintText:
                              ProfileBloc.instance.phoneNumberController.text,
                          keyboardType: TextInputType.number,
                          controller:
                              ProfileBloc.instance.phoneNumberController),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomFormField(
                          isLabeled: true,
                          labelText: 'البريد الالكتروني',
                          //  validator: isValidEmail,
                          iconWidget:
                              SvgPicture.asset(ImagesHelper.editFieldIcon),
                          isAuth: false,
                          hintText: ProfileBloc.instance.emailController.text,
                          keyboardType: TextInputType.emailAddress,
                          controller: ProfileBloc.instance.emailController),
                      const SizedBox(
                        height: 10,
                      ),
                      // const Spacer(),
                      CustomFormField(
                          // validator: isValidPhone,
                          isLabeled: true,
                          labelText: 'حدد الجنس',
                          iconWidget:
                              SvgPicture.asset(ImagesHelper.dropDownIcon),
                          isAuth: false,
                          hintText:
                              ProfileBloc.instance.phoneNumberController.text,
                          keyboardType: TextInputType.number,
                          controller:
                              ProfileBloc.instance.phoneNumberController),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomFormField(
                          // validator: isValidPhone,
                          isLabeled: true,
                          labelText: 'حدد الجنسية',
                          iconWidget:
                              SvgPicture.asset(ImagesHelper.dropDownIcon),
                          isAuth: false,
                          hintText:
                              ProfileBloc.instance.phoneNumberController.text,
                          keyboardType: TextInputType.number,
                          controller:
                              ProfileBloc.instance.phoneNumberController),
                      const SizedBox(
                        height: 40,
                      ),
                      Text(
                        'تفضيلات المعلم',
                        style: TextStyleHelper.title22.copyWith(
                            color: Theme.of(context).colorScheme.primary),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomFormField(
                          // validator: isValidPhone,
                          isLabeled: true,
                          labelText: 'المسار التعليمي المراد تعلمة',
                          iconWidget:
                              SvgPicture.asset(ImagesHelper.dropDownIcon),
                          isAuth: false,
                          hintText:
                              ProfileBloc.instance.phoneNumberController.text,
                          keyboardType: TextInputType.number,
                          controller:
                              ProfileBloc.instance.phoneNumberController),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomFormField(
                          // validator: isValidPhone,
                          isLabeled: true,
                          labelText: 'الفئة العمرية التى تنتمي إليها',
                          iconWidget:
                              SvgPicture.asset(ImagesHelper.dropDownIcon),
                          isAuth: false,
                          hintText:
                              ProfileBloc.instance.phoneNumberController.text,
                          keyboardType: TextInputType.number,
                          controller:
                              ProfileBloc.instance.phoneNumberController),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomFormField(
                          // validator: isValidPhone,
                          isLabeled: true,
                          labelText: 'مستوي القراء والتسميع',
                          iconWidget:
                              SvgPicture.asset(ImagesHelper.dropDownIcon),
                          isAuth: false,
                          hintText:
                              ProfileBloc.instance.phoneNumberController.text,
                          keyboardType: TextInputType.number,
                          controller:
                              ProfileBloc.instance.phoneNumberController),
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: CustomButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'حفظ التعديلات',
                            style: TextStyleHelper.button16.copyWith(
                              color: Colors.white,
                            ),
                          ),
                          /*  textColor: textColor */
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
