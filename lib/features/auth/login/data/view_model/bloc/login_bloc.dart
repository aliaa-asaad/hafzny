import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  /* UserModel userModel = UserModel();
  DriverModel driverModel = DriverModel(); */

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
          "type": SharedHandler.instance!
              .getData(key: SharedKeys().userType, valueType: ValueType.int)
        };
        log('login data: ${data.toString()}');
       /*  if (SharedHandler.instance!.getData(
                key: SharedKeys().userType, valueType: ValueType.int) ==
            0) {
          userModel = await _loginRepo.loginRequest(data);
          SharedHandler.instance!
              .setData(SharedKeys().user, value: userModel.client!.toJson());
          SharedHandler.instance!
              .setData(SharedKeys().token, value: userModel.authToken);
          log('client login token: ${userModel.authToken}');
          log('userModel: ${userModel.toString()}');
        } else {
          driverModel = await _loginRepo.loginRequest(data);
          SharedHandler.instance!
              .setData(SharedKeys().driver, value: driverModel.client!.toJson());
          SharedHandler.instance!
              .setData(SharedKeys().token, value: driverModel.authToken);
          log('driver login token: ${driverModel.authToken}');
          log('driver login name: ${driverModel.client!.fullName}');
          log('driver: ${driverModel.toString()}');
        } */

        SharedHandler.instance!.setData(SharedKeys().isLogin, value: true);
        SharedHandler.instance!
            .setData(SharedKeys().isNotFirstTime, value: true);
        //SharedHandler.saveLoginData(_LoginModel);
        //SharedHandler.setData(_LoginModel);
        //log(' ${_loginModel.client!.accesxsToken!}');
       

       /*  if (SharedHandler.instance!.getData(
                key: SharedKeys().userType, valueType: ValueType.int) ==
            0) {
          if (userModel.client!.isValid!) {
            AppRoutes.pushNamedNavigator(
                routeName: Routes.clientNavBar, replacementAll: true);
            clearData();
          } else {
            AppRoutes.pushNamedNavigator(
                routeName: Routes.emailVerification, replacement: true);
          }
        } else {
          if (driverModel.client!.isValid!) {
            AppRoutes.pushNamedNavigator(
                routeName: Routes.driverNavBar, replacementAll: true);
            clearData();
          } else {
            AppRoutes.pushNamedNavigator(
                routeName: Routes.emailVerification, replacement: true);
          }
        } */
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
