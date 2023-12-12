import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hafzny/config/end_points.dart';
import 'package:hafzny/features/auth/new_password/data/model/new_password_model.dart';
import 'package:hafzny/handlers/shared_handler.dart';
import 'package:hafzny/network/web_services.dart';

class NewPasswordRepo {
  Future newPasswordRequest(Map<String, dynamic> data) async {
    try {
      Response res = await Network.instance!.patch(
          url:'http://localhost:8080/student/resetPassword' /* SharedHandler.instance!.getData(
                      key: SharedKeys().userType, valueType: ValueType.int) ==
                  0
              ? ApiNames.studentResetPasswordEndPoint
              : ApiNames.teacherResetPasswordEndPoint */,
          body: data,
          withToken: false);
      log('res.data: ${res.data}');
      return NewPasswordModel.fromJson(res.data);
      /* if (SharedHandler.instance!
              .getData(key: SharedKeys().userType, valueType: ValueType.int) ==
          0) {
        return StudentModel.fromJson(res.data);
      } else {
        log('teacher repo: ${res.data}');
        log('teacher model: ${TeacherModel.fromJson(res.data)}');
        return TeacherModel.fromJson(res.data);
      } */
    } catch (e) {
      rethrow;
    }
  }
}
