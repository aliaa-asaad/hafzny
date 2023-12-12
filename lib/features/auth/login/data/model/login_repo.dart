import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hafzny/config/end_points.dart';
import 'package:hafzny/core/user_model.dart';
import 'package:hafzny/handlers/shared_handler.dart';
import 'package:hafzny/network/web_services.dart';

class LoginRepo{
   Future loginRequest(Map<String, dynamic> data) async {
    try {
      Response res = await Network.instance!
          .post(url: ApiNames.loginEndPoint, body: data, withToken: false);
      log('res.data: ${res.data.toString()}');
      
      if (SharedHandler.instance!
              .getData(key: SharedKeys().userType, valueType: ValueType.int) ==
          0) {
        return StudentModel.fromJson(res.data);
      } else {
        return TeacherModel.fromJson(res.data);
      }
    } catch (e) {
      rethrow;
    }
  }
}