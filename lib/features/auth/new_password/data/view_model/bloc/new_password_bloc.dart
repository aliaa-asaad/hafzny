import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  _newPassword(NewPasswordEvent events, Emitter emit) async {
    emit(NewPasswordLoading());
    try {
      /* if (_resetPasswordValidation()) { */
      /*   Map<String, dynamic> data = {
        'email': phoneController.text,
        'otp': [
          OTPBloc.instance.codeController1.text,
          OTPBloc.instance.codeController2.text,
          OTPBloc.instance.codeController3.text,
          OTPBloc.instance.codeController4.text,
        ].join(),
        "password": passwordController.text,
        "type": SharedHandler.instance!
            .getData(key: SharedKeys().userType, valueType: ValueType.int)
      };
      userModel = await _authRepo.resetPasswordRequest(data);
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
