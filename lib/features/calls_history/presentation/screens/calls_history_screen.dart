import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CallsHistoryScreen extends StatelessWidget {
  const CallsHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(body: SafeArea(child: SingleChildScrollView(
      padding: EdgeInsets.all(20.0.r),
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          
        ],
      ),
    )),);
  }
}