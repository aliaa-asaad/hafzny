import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hafzny/core/user_model.dart';
import 'package:hafzny/features/auth/forget_password/data/model/forget_password_repo.dart';
import 'package:hafzny/handlers/shared_handler.dart';
import 'package:hafzny/routing/navigator.dart';
import 'package:hafzny/routing/routes.dart';

part 'forget_password_event.dart';
part 'forget_password_state.dart';

class ForgetPasswordBloc
    extends Bloc<ForgetPasswordEvent, ForgetPasswordState> {
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
  String value = '';
  final ForgetPasswordRepo _forgetPasswordRepo = ForgetPasswordRepo();
  /* StudentModel studentModel = StudentModel();
  TeacherModel teacherModel = TeacherModel(); */

  _forgetPassword(ForgetPasswordEvent events, Emitter emit) async {
    emit(ForgetPasswordLoading());
    try {
      Map<String, dynamic> data = {
        'phoneNumber': phoneController.text,
        //'type': type,
      };
      log(data.toString());
     value= await _forgetPasswordRepo.forgetPasswordRequest(data);
     log('value of repo:$value');
      log('data to repo : ${_forgetPasswordRepo.forgetPasswordRequest(data).then((value) => log("value :${value.toString()}"))}');
      AppRoutes.pushNamedNavigator(routeName: Routes.otpScreen);
      /*   if (SharedHandler.instance!
              .getData(key: SharedKeys().userType, valueType: ValueType.int) ==
          0) {
        studentModel = await _forgetPasswordRepo.forgetPasswordRequest(data);

        SharedHandler.instance!
            .setData(SharedKeys().student, value: studentModel.toJson());
        SharedHandler.instance!
            .setData(SharedKeys().token, value: studentModel.token);
        log('student otp token: ${studentModel.token}');
        log('studentModel otp: ${studentModel.toString()}');
      } else {
        log('data to repo : ${data.toString()}');
        teacherModel = await _forgetPasswordRepo.forgetPasswordRequest(data);
        SharedHandler.instance!
            .setData(SharedKeys().teacher, value: teacherModel.toJson());
        SharedHandler.instance!
            .setData(SharedKeys().token, value: teacherModel.token);
        log('teacher otp token: ${teacherModel.token}');
        log('teacherModel register: ${teacherModel.toString()}');
      } */

      emit(ForgetPasswordLoaded());
    } catch (e) {
      log('forget password error :${e.toString()}');
      emit(ForgetPasswordError());
    }
  }
}
