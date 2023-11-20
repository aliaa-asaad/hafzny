import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hafzny/routing/navigator.dart';
import 'package:hafzny/routing/routes.dart';
import 'package:meta/meta.dart';

part 'forget_password_event.dart';
part 'forget_password_state.dart';

class ForgetPasswordBloc extends Bloc<ForgetPasswordEvent, ForgetPasswordState> {
  ForgetPasswordBloc() : super(ForgetPasswordInitial()) {
   /*  on<ForgetPasswordEvent>((event, emit) {
      // TODO: implement event handler
    }); */
    on<ForgetPasswordPost>(_forgetPassword);
  }
  static ForgetPasswordBloc get instance =>
      BlocProvider.of(AppRoutes.navigatorState.currentContext!);
       final GlobalKey<FormState> formKey = GlobalKey<FormState>();
   TextEditingController phoneController = TextEditingController();
  
  _forgetPassword(ForgetPasswordEvent events, Emitter emit) async {
    emit(ForgetPasswordLoading());
    try {
     /*  Map<String, dynamic> data = {
        'email': phoneController.text,
        'type': type,
      };
      log(data.toString());
      _forgetPasswordModel = await _authRepo.forgetPasswordRequest(data);
      log('verified'); */
      /* SharedHandler.instance!
          .setData(SharedKeys().user, value: _userModel.client!.toJson());
      SharedHandler.instance!.setData(SharedKeys().isLogin, value: true);
      SharedHandler.instance!
          .setData(SharedKeys().token, value: _userModel.authToken);
      SharedHandler.instance!.setData(SharedKeys().isFirstTime, value: true); */
      //SharedHandler.instance!.setData(SharedKeys().userType, value: type);
      AppRoutes.pushNamedNavigator(routeName: Routes.otp);

      emit(ForgetPasswordLoaded());
    } catch (e) {
      log('forget password error :${e.toString()}');
      emit(ForgetPasswordError());
    }
  }
}
