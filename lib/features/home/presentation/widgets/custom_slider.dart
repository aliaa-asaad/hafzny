import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hafzny/app_widgets/custom_dots.dart';
import 'package:hafzny/config/end_points.dart';
import 'package:hafzny/features/home/data/view_model/cubit/home_cubit.dart';
import 'package:hafzny/utilities/media_quary.dart';

class CustomSlider extends StatefulWidget {
  const CustomSlider({super.key});

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  int currentImage = 0;
  /*  List<String> imageSlider = [
    'https://picsum.photos/200/300',
    'https://picsum.photos/200/300',
    'https://picsum.photos/200/300',
  ]; */
  final PageController _pageController =
      PageController(initialPage: 0, viewportFraction: 1);

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        currentImage = _pageController.page!.round();
      });
    });
    Future.delayed(const Duration(seconds: 2), () {
      _animateSlider();
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animateSlider();
    super.dispose();
  }

  void _animateSlider() {
    if (currentImage < HomeCubit.instance.imageSlider.length - 1) {
      currentImage++;
    } else {
      currentImage = 0;
    }
    if (mounted) {
      _pageController.animateToPage(
        currentImage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    }

    Future.delayed(const Duration(seconds: 2), () {
      _animateSlider();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return const Center(child: CircularProgressIndicator());
            } else
              if (state is HomeError) {
              return const Center(child: Text('error'));
            } else {
              return SizedBox(
                height: MediaQueryHelper.height * .2,
                width: MediaQueryHelper.width,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: HomeCubit.instance.imageSlider.length,
                  itemBuilder: (BuildContext context, int index) {
                    return AnimatedBuilder(
                      animation: _pageController,
                      builder: (BuildContext context, Widget? widget) {
                        double value = 1.0;
                        if (_pageController.position.haveDimensions) {
                          value = _pageController.page! - index;
                          value = (1 - (value.abs() * 0.1)).clamp(0.0, 2.0);
                        }
                        return Center(
                          child: SizedBox(
                            height: Curves.easeOut.transform(value) *
                                MediaQueryHelper.height *
                                .15,
                            width: Curves.easeOut.transform(value) *
                                MediaQueryHelper.width,
                            child: Container(
                              padding: const EdgeInsets.all(
                                  0), // Remove padding around the image
                              child: widget,
                            ),
                          ),
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 3.0.r),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4.r),
                          child: Image.network(
                            ApiNames.baseUrl +
                                ApiNames.sliderImagesPath +
                                HomeCubit
                                    .instance.imageSlider[index].imageName!,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            }
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            HomeCubit.instance.imageSlider.length,
            (index) => CustomDots(
              width: .045,
              color: currentImage == index
                  ? Theme.of(context).colorScheme.primary
                  : Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
