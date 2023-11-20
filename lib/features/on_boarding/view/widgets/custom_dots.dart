import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDots extends StatelessWidget {
  final Color color;
  const CustomDots({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      margin: EdgeInsets.symmetric(horizontal: 6),
      height: MediaQuery.of(context).size.height * .004,
      width: MediaQuery.of(context).size.height * .021,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        //shape: BoxShape.circle,
        color:color,
      ),
    );
  }
}