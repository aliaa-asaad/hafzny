import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hafzny/core/user_model.dart';
import 'package:hafzny/core/validations.dart';
import 'package:hafzny/features/auth/forget_password/data/view_model/bloc/forget_password_bloc.dart';
import 'package:hafzny/features/auth/login/data/view_model/bloc/login_bloc.dart';
import 'package:hafzny/features/auth/otp/data/model/otp_repo.dart';
import 'package:hafzny/features/auth/register/data/view_model/bloc/sign_up_bloc.dart';
import 'package:hafzny/handlers/shared_handler.dart';
import 'package:hafzny/routing/navigator.dart';
import 'package:hafzny/routing/routes.dart';

part 'otp_event.dart';
part 'otp_state.dart';

class OTPBloc extends Bloc<OTPEvent, OTPState> with Validations {
  OTPBloc() : super(OtpInitial()) {
    /*  on<OTPEvent>((event, emit) {
      // TODO: implement event handler
    }); */
    on<OTPPost>(_verifyCode);
  }
///////////instance//////////////

  static OTPBloc get instance =>
      BlocProvider.of(AppRoutes.navigatorState.currentContext!);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
/////////////////models////////////////

  final OTPRepo _otpRepo = OTPRepo();
  StudentModel
      studentModel = /*  ForgetPasswordBloc.instance.value.isEmpty
      ?LoginBloc.instance.studentModel.data!.iId == null
          ? SignUpBloc.instance.studentModel
          : LoginBloc.instance.studentModel 
      : */
      StudentModel();
  TeacherModel
      teacherModel = /*  ForgetPasswordBloc.instance.value.isEmpty
      ?LoginBloc.instance.teacherModel.data!.iId == null
          ? SignUpBloc.instance.teacherModel
          : LoginBloc.instance.teacherModel 
      :  */
      TeacherModel();
////////////////////variables/////////////
  TextEditingController codeController1 = TextEditingController();
  String codeError1 = '';
  TextEditingController codeController2 = TextEditingController();
  String codeError2 = '';
  TextEditingController codeController3 = TextEditingController();
  String codeError3 = '';
  TextEditingController codeController4 = TextEditingController();
  String codeError4 = '';
  ///////////////////validation////////////////
/*   bool _validateCode() {
    codeError1 = isValidCodeBloc(codeController1.text);
    codeError2 = isValidCodeBloc(codeController2.text);
    codeError3 = isValidCodeBloc(codeController3.text);
    codeError4 = isValidCodeBloc(codeController4.text);
    return codeError1.isEmpty &&
        codeError2.isEmpty &&
        codeError3.isEmpty &&
        codeError4.isEmpty;
  } */

  /////////////////////methods///////////////////
  _verifyCode(OTPEvent events, Emitter emit) async {
    emit(OTPLoading());
    try {
      Map<String, dynamic> data = {
        'phoneNumber': ForgetPasswordBloc.instance.value.isNotEmpty
            ? ForgetPasswordBloc.instance.phoneController.text
            : LoginBloc.instance.phoneNumberController.text.isNotEmpty
                ? LoginBloc.instance.phoneNumberController.text
                : SignUpBloc.instance.phoneNumberController.text,
        'code': int.parse([
          codeController1.text,
          codeController2.text,
          codeController3.text,
          codeController4.text,
        ].join()),
        /*  'type': SharedHandler.instance!
            .getData(key: SharedKeys().userType, valueType: ValueType.int) */
      };
      log('data :${data.toString()}');
      if (SharedHandler.instance!
              .getData(key: SharedKeys().userType, valueType: ValueType.int) ==
          0) {
        studentModel = await _otpRepo.otpRequest(data);

        SharedHandler.instance!
            .setData(SharedKeys().student, value: studentModel.toJson());
        SharedHandler.instance!
            .setData(SharedKeys().token, value: studentModel.token);
        log('student otp token: ${studentModel.token}');
        log('studentModel otp: ${studentModel.toString()}');
      } else {
        log('data to repo : ${data.toString()}');
        teacherModel = await _otpRepo.otpRequest(data);
        SharedHandler.instance!
            .setData(SharedKeys().teacher, value: teacherModel.toJson());
        SharedHandler.instance!
            .setData(SharedKeys().token, value: teacherModel.token);
        log('teacher otp token: ${teacherModel.token}');
        log('teacherModel register: ${teacherModel.toString()}');
      }
      log('success');

      log('verified');
      log('isForgetPassword : ${LoginBloc.instance.isForgetPassword}');
      if (LoginBloc.instance.isForgetPassword == false) {
        await SharedHandler.instance!
            .setData(SharedKeys().isLogin, value: true);
        /* log('user model token: ${.authToken}');
        log('driver model token: ${teacherModel.authToken}'); */
        await SharedHandler.instance!
            .setData(SharedKeys().isNotFirstTime, value: true);
      }

      if (LoginBloc.instance.isForgetPassword) {
        AppRoutes.pushNamedNavigator(routeName: Routes.newPassword);
      } else {
        if (SharedHandler.instance!.getData(
                key: SharedKeys().userType, valueType: ValueType.int) ==
            0) {
          if (studentModel.data!.isVerified == true) {
            AppRoutes.pushNamedNavigator(
                routeName: Routes.navBar, replacementAll: true);
          }
          else{
            AppRoutes.pushNamedNavigator(
                routeName: Routes.studentData, replacementAll: true);
          }
        }
        SignUpBloc.instance.clearData();
      }

      emit(OTPLoaded());
    } catch (e) {
      log('verify code error :${e.toString()}');
      emit(OTPError());
    }
  }
}
