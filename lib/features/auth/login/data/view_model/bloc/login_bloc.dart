import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hafzny/core/user_model.dart';
import 'package:hafzny/core/validations.dart';
import 'package:hafzny/features/auth/login/data/model/login_repo.dart';
import 'package:hafzny/handlers/shared_handler.dart';
import 'package:hafzny/routing/navigator.dart';
import 'package:hafzny/routing/routes.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> with Validations {
  LoginBloc() : super(LoginInitial()) {
    /* on<LoginEvent>((event, emit) {
     
    }); */
    on<LoginPost>(_login);
  }
  ///////////instance//////////////
  static LoginBloc get instance =>
      BlocProvider.of(AppRoutes.navigatorState.currentContext!);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  /////////////////models////////////////
  final LoginRepo _loginRepo = LoginRepo();
  bool isForgetPassword = false;
  StudentModel studentModel = StudentModel();
  TeacherModel teacherModel = TeacherModel();

////////////////////variables/////////////
  TextEditingController phoneNumberController = TextEditingController();
  String phoneNumberError = '';

  TextEditingController passwordController = TextEditingController();
  String passwordError = '';
///////////////////validation////////////////
  bool _loginValidation() {
    phoneNumberError = isValidPhoneBloc(phoneNumberController.text);
    passwordError = isValidPasswordBloc(passwordController.text);
    return phoneNumberError.isEmpty && passwordError.isEmpty;
  }

//////////////////methods///////////////////
  _login(LoginEvent events, Emitter emit) async {
    emit(LoginLoading());
    try {
      if (_loginValidation()) {
        Map<String, dynamic> data = {
          "phoneNumber": phoneNumberController.text,
          "password": passwordController.text,
          /*  "type": SharedHandler.instance!
              .getData(key: SharedKeys().userType, valueType: ValueType.int) */
        };
        log('login data: ${data.toString()}');
        if (SharedHandler.instance!.getData(
                key: SharedKeys().userType, valueType: ValueType.int) ==
            0) {
          studentModel = await _loginRepo.loginRequest(data);
          SharedHandler.instance!
              .setData(SharedKeys().student, value: studentModel.toJson());
          SharedHandler.instance!
              .setData(SharedKeys().token, value: studentModel.token);
          log('student login token: ${studentModel.token}');
          log('student login isVerified: ${studentModel.data!.isVerified}');
          log('student login name: ${studentModel.data!.name}');
          log('student login email: ${studentModel.data!.email}');
          log('student login id: ${studentModel.data!.iId}');
          log('student login phoneNumber: ${studentModel.data!.phoneNumber}');

          log('studentModel: ${studentModel.toJson()}');
        } else {
          teacherModel = await _loginRepo.loginRequest(data);
          SharedHandler.instance!
              .setData(SharedKeys().teacher, value: teacherModel.toJson());
          SharedHandler.instance!
              .setData(SharedKeys().token, value: teacherModel.token);
          log('teacher login token: ${teacherModel.token}');
          // log('driver login name: ${teacherModel.fullName}');
          log('teacher: ${teacherModel.toString()}');
        }

        SharedHandler.instance!.setData(SharedKeys().isLogin, value: true);
        SharedHandler.instance!
            .setData(SharedKeys().isNotFirstTime, value: true);
        //SharedHandler.saveLoginData(_LoginModel);
        //SharedHandler.setData(_LoginModel);
        //log(' ${_loginModel.client!.accesxsToken!}');

        if (SharedHandler.instance!.getData(
                key: SharedKeys().userType, valueType: ValueType.int) ==
            0) {
          if (studentModel.data!.isVerified!) {
            AppRoutes.pushNamedNavigator(
                routeName: Routes.navBar, replacementAll: true);
            clearData();
          } else {
            AppRoutes.pushNamedNavigator(
                routeName: Routes.otpScreen, replacement: true);
          }
        } else {
          if (teacherModel.data!.isVerified!) {
            AppRoutes.pushNamedNavigator(
                routeName: Routes.navBar, replacementAll: true);
            clearData();
          } else {
            AppRoutes.pushNamedNavigator(
                routeName: Routes.otpScreen, replacement: true);
          }
        }
        emit(LoginLoaded());
      }
    } catch (e) {
      log('login error :${e.toString()}');
      emit(LoginError());
    }
  }

  clearData() {
    phoneNumberController.clear();
    passwordController.clear();
  }
}
