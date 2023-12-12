import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hafzny/core/user_model.dart';
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
    on<SignUpPost>(_signUp);
    //on<SignUpPostAge>(_postAge);
  }

  ///////////instance//////////////
  static SignUpBloc get instance =>
      BlocProvider.of(AppRoutes.navigatorState.currentContext!);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  /////////////////models////////////////
  final SignUpRepo _signUpRepo = SignUpRepo();

  StudentModel studentModel = StudentModel();
  TeacherModel teacherModel = TeacherModel();

////////////////////variables/////////////
  TextEditingController fullNameController = TextEditingController();

  TextEditingController phoneNumberController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  TextEditingController ageController = TextEditingController();

  String genderValue = 'اختر';
  List<String> genderList = ['ذكر', 'أنثي'];
  ///////////////////validation////////////////
  /* bool _signUpValidation() {
    phoneNumberError = isValidPhoneBloc(phoneNumberController.text);
    passwordError = isValidPasswordBloc(passwordController.text);
    fullNameError = isValidNameBloc(fullNameController.text);
    confirmPasswordError = isValidConfirmPasswordBloc(
        passwordController.text, confirmPasswordController.text);
    emailError = isValidAgeBloc(emailController.text);
    ageError=
    return phoneNumberError.isEmpty &&
        fullNameError.isEmpty &&
        passwordError.isEmpty &&
        confirmPasswordError.isEmpty &&
        emailError.isEmpty;
  } */

  //////////////////methods///////////////////

  void updateGender(String value) {
    genderValue = value;
    log('gender value: $genderValue');
    emit(SignUpUpdateGender());
  }

  _signUp(SignUpEvent events, Emitter emit) async {
    emit(SignUpLoading());

    try {
      //   if (_signUpValidation()) {
      num age =ageController.text.isEmpty?0: int.parse(ageController.text)  /* int.parse(ageController.text) */;
      Map<String, dynamic> data = {
        'name': fullNameController.text,
        'email': emailController.text,
        'password': passwordController.text,
        'passwordConfirmation': confirmPasswordController.text,
        'phoneNumber': phoneNumberController.text,
        "gender": genderValue,
        /*  "nationality": "Egypt", */

        "age": age
      };
      log('data: ${data.toString()}');
      if (SharedHandler.instance!
              .getData(key: SharedKeys().userType, valueType: ValueType.int) ==
          0) {
        studentModel = await _signUpRepo.registerRequest(data);
        log('studentModel register: ${studentModel.toString()}');
      } else {
        log('data to repo : ${data.toString()}');
        teacherModel = await _signUpRepo.registerRequest(data);
        log('teacherModel register: ${teacherModel.toString()}');
      }
      await SharedHandler.instance!
          .setData(SharedKeys().isNotFirstTime, value: true);
      log('success');

      AppRoutes.pushNamedNavigator(routeName: Routes.otpScreen);

      /*  AppRoutes.pushNamedNavigator(
            routeName: Routes.emailVerification, replacement: true); */

      emit(SignUpLoaded());
      //    }
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
