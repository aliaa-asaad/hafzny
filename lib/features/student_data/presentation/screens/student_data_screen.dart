import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hafzny/app_widgets/custom_button.dart';
import 'package:hafzny/app_widgets/custom_dots.dart';
import 'package:hafzny/features/student_data/presentation/widgets/favorite_educational_path.dart';
import 'package:hafzny/features/student_data/presentation/widgets/student_age_group.dart';
import 'package:hafzny/features/student_data/presentation/widgets/student_level.dart';
import 'package:hafzny/routing/navigator.dart';
import 'package:hafzny/routing/routes.dart';
import 'package:hafzny/utilities/text_style_helper.dart';

class StudentDataScreen extends StatefulWidget {
  const StudentDataScreen({super.key});

  @override
  State<StudentDataScreen> createState() => _StudentDataScreenState();
}

class _StudentDataScreenState extends State<StudentDataScreen> {
  int _currentPage = 0;
  List<Widget> content = [
    const FavoriteEducationalPath(),
    const StudentAgeGroup(),
    const StudentLevel()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(24.0.r),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        content.length,
                        (index) => CustomDots(
                          color: _currentPage == index
                              ? Theme.of(context).colorScheme.primary
                              : const Color(0xff50617D).withOpacity(.1),
                          width: .22,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      'تفضيلاتي التعليمية',
                      style: TextStyleHelper.subtitle19
                          .copyWith(color: const Color(0xff192C4A)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'يساعدك تحديد هذه المعلومات على تجربة تعليمية مناسبة لك وتسهيل الوصول لمعلم القران المناسب',
                      style: TextStyleHelper.body15
                          .copyWith(color: const Color(0xff545F71)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    content[_currentPage],
                    CustomButton(
                      child: Text('التالي',
                          style: TextStyleHelper.button16.copyWith(
                            color: Colors.white,
                          )),
                      onPressed: () {
                        if (_currentPage == content.length - 1) {
                          AppRoutes.pushNamedNavigator(routeName: Routes.signUp);
                        } else {
                          setState(() {
                            _currentPage++;
                          });
                        }
                        /*  if (LoginBloc.instance.formKey.currentState!
                              .validate()) {
                            // _formKey.currentState!.save();
                            //log(name);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('تم حفظ البيانات')),
                            );
                            AppRoutes.pushNamedNavigator(routeName: Routes.home);
                            //LoginBloc.instance.add(LoginPost());
                            //BlocProvider.of<NotificationCubit>(context).getPusherBeams();
                          } else {
                            log('not valid');
                          } */
                        // log('type= ${bloc.type}');
                      },
                      /*  textColor: textColor */
                    ),
                    CustomButton(
                      background: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(.1),
                      child: Text('تخطي اعداد التفضيلات',
                          style: TextStyleHelper.button16.copyWith(
                              color: Theme.of(context).colorScheme.secondary)),
                      onPressed: () {
                        AppRoutes.pushNamedNavigator(routeName: Routes.signUp);
                        //    AppRoutes.pushNamedNavigator(routeName: Routes.signUp);
                        /*  if (LoginBloc.instance.formKey.currentState!
                              .validate()) {
                            // _formKey.currentState!.save();
                            //log(name);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('تم حفظ البيانات')),
                            );
                            LoginBloc.instance.add(LoginPost());
                            //BlocProvider.of<NotificationCubit>(context).getPusherBeams();
                          } else {
                            log('not valid');
                          } */
                        // log('type= ${bloc.type}');
                      },
                      /*  textColor: textColor */
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
