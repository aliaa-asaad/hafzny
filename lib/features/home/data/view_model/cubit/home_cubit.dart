import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hafzny/features/home/data/model/home_repo.dart';
import 'package:hafzny/features/home/data/model/slider_model.dart';
import 'package:hafzny/routing/navigator.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
   static HomeCubit get instance =>
      BlocProvider.of(AppRoutes.navigatorState.currentContext!);
  List<SlidderImages> imageSlider = [];
  SliderRepo homeRepo = SliderRepo();
  Future<void> getImageSlider() async {
    try {
      emit(HomeLoading());
      imageSlider = await homeRepo.getHomeSlider();
      log(imageSlider.toString());

      emit(HomeLoaded());
    } catch (e) {
      log(e.toString());
      emit(HomeError());
    }
  }
}


