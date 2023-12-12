import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hafzny/config/end_points.dart';
import 'package:hafzny/core/user_model.dart';
import 'package:hafzny/handlers/shared_handler.dart';
import 'package:hafzny/network/web_services.dart';

class SignUpRepo {
  Future registerRequest(Map<String, dynamic> data) async {
    try {
      Response res = await Network.instance!.post(
          url: 'http://venusdigital.ink:8080/student'/* SharedHandler.instance!.getData(
                      key: SharedKeys().userType, valueType: ValueType.int) ==
                  0
              ? ApiNames.studentRegisterEndPoint
              : ApiNames.teacherRegisterEndPoint */,
          withToken: false,
          body: data);
      log('res.data: ${res.data}');
      if (SharedHandler.instance!
              .getData(key: SharedKeys().userType, valueType: ValueType.int) ==
          0) {
        return StudentModel.fromJson(res.data);
      } else {
        log('driver repo: ${res.data}');
        log('driver model: ${TeacherModel.fromJson(res.data)}');
        return TeacherModel.fromJson(res.data);
      }
    } catch (e) {
      rethrow;
    }
  }


}
