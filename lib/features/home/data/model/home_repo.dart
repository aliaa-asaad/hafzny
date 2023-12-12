import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hafzny/config/end_points.dart';
import 'package:hafzny/features/home/data/model/slider_model.dart';
import 'package:hafzny/network/web_services.dart';

class SliderRepo {
 
  Future<List<SlidderImages>> getHomeSlider() async {
    final Response res = await Network.instance!
        .get(url: ApiNames.imageSliderEndPoint, withToken: false);
    log('home slider repo data: ${res.data.toString()}');
    log('home slider repo datatype: ${res.data.runtimeType}');
    if (res.statusCode! >= 200 && res.statusCode! < 300) {
      log('repo status code:${res.statusCode}');
      if (res.data.isNotEmpty) {
        return SliderModel.fromJson(res.data).data!.slidderData!.slidderImages!;
      } else {
        log('home slider is empty');
        return [];
      }
    } else {
      log('get home slider repo error:${res.data}');
      throw Exception('Failed to load data!');
    }
  }
}