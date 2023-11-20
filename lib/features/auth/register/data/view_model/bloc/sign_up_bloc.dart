import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hafzny/core/validations.dart';
import 'package:hafzny/features/auth/register/data/model/sign_up_repo.dart';
import 'package:hafzny/handlers/shared_handler.dart';
import 'package:hafzny/routing/navigator.dart';
import 'package:hafzny/routing/routes.dart';
import 'package:meta/meta.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';




class SignUpBloc extends Bloc<SignUpEvent, SignUpState> with Validations {
 SignUpBloc() : super(SignUpInitial()) {
   /*  on<SignUpEvent>((event, emit) {
      // TODO: implement event handler
    }); */
    on<SignUpPost>( _signUp);
  }
  ///////////instance//////////////
  static SignUpBloc get instance =>
      BlocProvider.of(AppRoutes.navigatorState.currentContext!);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  /////////////////models////////////////
  final SignUpRepo _signUpRepo = SignUpRepo();

  /* UserModel userModel = UserModel();
  DriverModel driverModel = DriverModel(); */

////////////////////variables/////////////
  TextEditingController fullNameController = TextEditingController();
  String fullNameError = '';
  TextEditingController confirmPasswordController = TextEditingController();
  String confirmPasswordError = '';
  TextEditingController phoneNumberController = TextEditingController();
  String phoneNumberError = '';
  TextEditingController emailController = TextEditingController();
  String emailError = '';
  TextEditingController passwordController = TextEditingController();
  String passwordError = '';
  ///////////////////validation////////////////
  bool _signUpValidation() {
    phoneNumberError = isValidPhoneBloc(phoneNumberController.text);
    passwordError = isValidPasswordBloc(passwordController.text);
    fullNameError = isValidNameBloc(fullNameController.text);
    confirmPasswordError = isValidConfirmPasswordBloc(
        passwordController.text, confirmPasswordController.text);
    emailError = isValidEmailBloc(emailController.text);
    return phoneNumberError.isEmpty &&
        fullNameError.isEmpty &&
        passwordError.isEmpty &&
        confirmPasswordError.isEmpty &&
        emailError.isEmpty;
  }

  //////////////////methods///////////////////

  _signUp(SignUpEvent events, Emitter emit) async {
    emit(SignUpLoading());
    try {
      if (_signUpValidation()) {
        Map<String, dynamic> data = {
          'fullName': fullNameController.text,
          'email': emailController.text,
          'password': passwordController.text,
          'phoneNumber': phoneNumberController.text,
        };
        log( 'data: ${data.toString()}');
        if (SharedHandler.instance!.getData(
                key: SharedKeys().userType, valueType: ValueType.int) ==
            0) {
        /*   userModel = await _registerRepo.registerRequest(data);
           log('userModel register: ${userModel.toString()}'); */
        }
        else{
          log( 'data to repo : ${data.toString()}');
          /* driverModel = await _registerRepo.registerRequest(data);
          log('driverModel register: ${driverModel.toString()}'); */}
        log('success');
       
        
       /*  AppRoutes.pushNamedNavigator(
            routeName: Routes.emailVerification, replacement: true); */

        emit(SignUpLoaded());
      }
    } catch (e) {
      log('sign up error :${e.toString()}');
      emit(SignUpError());
    }
  }

  clearData() {
    fullNameController.clear();
    phoneNumberController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    emailController.clear();
  }
}