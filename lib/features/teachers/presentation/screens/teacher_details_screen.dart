import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hafzny/app_widgets/teacher_rate.dart';
import 'package:hafzny/features/teachers/presentation/widgets/profile_buttons.dart';
import 'package:hafzny/features/teachers/presentation/widgets/reserve_session.dart';
import 'package:hafzny/utilities/media_quary.dart';
import 'package:hafzny/utilities/text_style_helper.dart';

class TeacherDetialsScreen extends StatefulWidget {
  const TeacherDetialsScreen({super.key});

  @override
  State<TeacherDetialsScreen> createState() => _TeacherDetialsScreenState();
}

class _TeacherDetialsScreenState extends State<TeacherDetialsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'تفاصيل المعلم',
          style: TextStyleHelper.subtitle19.copyWith(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: .0,
        /* leading: CustomArrowBack(), */
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        // padding: EdgeInsets.all(20.0.r),
        physics: const ClampingScrollPhysics(),
        child: Container(
          width: MediaQueryHelper.width,
          height: MediaQueryHelper.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.primary,
                Colors.white,
                Colors.white,
                Colors.white
              ],
            ),
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 81,
                  ),
                  Container(
                    padding: EdgeInsets.all(20.0.r),
                    width: MediaQueryHelper.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 48,
                        ),
                        Text(
                          'محمد ابراهيم احمد',
                          style: TextStyleHelper.subtitle19,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const CircleAvatar(
                              radius: 6,
                              backgroundColor: Colors.green,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'متصل الأن',
                              style: TextStyleHelper.body15,
                            ),
                          ],
                        ),
                        const TeacherRate(),
                        const SizedBox(
                          height: 21,
                        ),
                        const ProfileButtons(),
                        const SizedBox(
                          height: 21,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'نبذه عن المعلم',
                            style: TextStyleHelper.body15.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Text(
                          'يساعدك تحديد هذه المعلومات على تجربة تعليمية مناسبة لك وتسهيل الوصول لمعلم القران المناسب',
                          style: TextStyleHelper.body15.copyWith(
                              color: Theme.of(context).colorScheme.background),
                        ),
                        const SizedBox(
                          height: 21,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.check_circle,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              'اجازة رواية حفص عن عاصم',
                              style: TextStyleHelper.body15.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        const ReserveSession()
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                right: MediaQueryHelper.width * .35,
                top: 24,
                child: const CircleAvatar(
                  radius: 55,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey,
                    //  backgroundImage: const AssetImage('assets/images/1.jpg'),
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
