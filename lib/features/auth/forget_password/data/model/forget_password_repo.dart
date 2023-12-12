import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hafzny/config/end_points.dart';
import 'package:hafzny/network/web_services.dart';

class ForgetPasswordRepo {
  Future forgetPasswordRequest(Map<String, dynamic> data) async {
    try {
      Response res = await Network.instance!.post(
          url: ApiNames.forgetPasswordEndPoint, body: data, withToken: false);
      log('res.data: ${res.data}');
      return res.data;
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
