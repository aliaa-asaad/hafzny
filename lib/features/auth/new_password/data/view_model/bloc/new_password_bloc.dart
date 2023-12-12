import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hafzny/features/auth/forget_password/data/view_model/bloc/forget_password_bloc.dart';
import 'package:hafzny/features/auth/new_password/data/model/new_password_model.dart';
import 'package:hafzny/features/auth/new_password/data/model/new_password_repo.dart';
import 'package:hafzny/features/auth/otp/data/view_model/bloc/otp_bloc.dart';
import 'package:hafzny/handlers/shared_handler.dart';
import 'package:hafzny/routing/navigator.dart';
import 'package:hafzny/routing/routes.dart';
import 'package:meta/meta.dart';

part 'new_password_event.dart';
part 'new_password_state.dart';

class NewPasswordBloc extends Bloc<NewPasswordEvent, NewPasswordState> {
  NewPasswordBloc() : super(NewPasswordInitial()) {
    /*  on<NewPasswordEvent>((event, emit) {
      // TODO: implement event handler
    }); */
    on<NewPasswordPost>(_newPassword);
  }
  static NewPasswordBloc get instance =>
      BlocProvider.of(AppRoutes.navigatorState.currentContext!);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  NewPasswordModel newPasswordModel = NewPasswordModel();
  NewPasswordRepo _newPasswordRepo = NewPasswordRepo();
  _newPassword(NewPasswordEvent events, Emitter emit) async {
    emit(NewPasswordLoading());
    try {
      /* if (_resetPasswordValidation()) { */
      Map<String, dynamic> data = {
        'phoneNumber': ForgetPasswordBloc.instance.phoneController.text,
        'code': int.parse([
          OTPBloc.instance.codeController1.text,
          OTPBloc.instance.codeController2.text,
          OTPBloc.instance.codeController3.text,
          OTPBloc.instance.codeController4.text,
        ].join()),
        "password": passwordController.text,
        'passwordConfirmation': confirmPasswordController.text,
        /*   "type": SharedHandler.instance!
            .getData(key: SharedKeys().userType, valueType: ValueType.int) */
      };
      /* if (SharedHandler.instance!
              .getData(key: SharedKeys().userType, valueType: ValueType.int) ==
          0) { */
      newPasswordModel = await _newPasswordRepo.newPasswordRequest(data);
      SharedHandler.instance!.setData(SharedKeys().isLogin, value: true);
      AppRoutes.pushNamedNavigator(
          routeName: Routes.navBar, replacementAll: true);

      /*  SharedHandler.instance!
            .setData(SharedKeys().student, value: newPasswordModel.toJson());
        SharedHandler.instance!
            .setData(SharedKeys().token, value: newPasswordModel.token);
        log('student otp token: ${newPasswordModel.token}');
        log('studentModel otp: ${newPasswordModel.toString()}');
      } else {
        log('data to repo : ${data.toString()}');
        teacherModel = await _newPasswordRepo.otpRequest(data);
        SharedHandler.instance!
            .setData(SharedKeys().teacher, value: teacherModel.toJson());
        SharedHandler.instance!
            .setData(SharedKeys().token, value: teacherModel.token);
        log('teacher otp token: ${teacherModel.token}');
        log('teacherModel register: ${teacherModel.toString()}'); */
      // }
      /* userModel = await _authRepo.resetPasswordRequest(data);
      await SharedHandler.instance!
          .setData(SharedKeys().user, value: userModel.client!.toJson());
      await SharedHandler.instance!.setData(SharedKeys().isLogin, value: true);
      await SharedHandler.instance!
          .setData(SharedKeys().isNotFirstTime, value: true); */
      //SharedHandler.saveLoginData(_authModel);
      //SharedHandler.setData(_authModel);
      //log(' ${_loginModel.client!.accessToken!}');
      /* _userModel.client!.isValid!
   /*          ?  */
      SharedHandler.instance!.getData(
                  key: SharedKeys().userType, valueType: ValueType.int) ==
              0
          ? AppRoutes.pushNamedNavigator(
              routeName: Routes.clientNavBar, replacementAll: true)
          : AppRoutes.pushNamedNavigator(
              routeName: Routes.driverNavBar, replacementAll: true); */
      /* : AppRoutes.pushNamedNavigator(
                routeName: Routes.emailVerification, replacement: true); */
      emit(NewPasswordLoaded());
      //}
    } catch (e) {
      log('reset Password :${e.toString()}');
      emit(NewPasswordError());
    }
  }
}
