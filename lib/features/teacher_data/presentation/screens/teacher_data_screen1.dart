import 'package:flutter/material.dart';
import 'package:hafzny/app_widgets/custom_button.dart';
import 'package:hafzny/routing/navigator.dart';
import 'package:hafzny/routing/routes.dart';
import 'package:hafzny/utilities/media_quary.dart';
import 'package:hafzny/utilities/text_style_helper.dart';

class TeacherDataScreen1 extends StatefulWidget {
  const TeacherDataScreen1({super.key});

  @override
  State<TeacherDataScreen1> createState() => _TeacherDataScreen1State();
}

class _TeacherDataScreen1State extends State<TeacherDataScreen1> {
  int chosenContent = -1;
  int partMemorized = -1;
  List<String> content = [
    'الكل',
    'تلقين',
    'مراجعة',
    'إقراء واجازة',
    'حفظ وتثبيت',
    'تصحيح التلاوة'
  ];
  List<String> partMemorizedList = [
    'الكل',
    'جزء',
    'سورة',
    'صفحات',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'التوافق مع رغبات المتعلم',
                style: TextStyleHelper.subtitle19,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ',
                style: TextStyleHelper.body15
                    .copyWith(color: Theme.of(context).colorScheme.background),
              ),
              const SizedBox(
                height: 20,
              ),
              Text('حدد مسار الاتقان للمتعلم', style: TextStyleHelper.body15),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                // color: Colors.amber,
                height: 130,
                child: GridView.builder(
                  itemCount: content.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: .3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: MediaQueryHelper.width * .03,
                      mainAxisExtent: 50),
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      setState(() {
                        chosenContent = index;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: chosenContent == index
                              ? Theme.of(context).colorScheme.primary
                              : Colors.transparent,
                          border: chosenContent == index
                              ? const Border()
                              : Border.all(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .background
                                      .withOpacity(.1),
                                  width: 1),
                          borderRadius: BorderRadius.circular(8)),
                      child: Text(
                        content[index],
                        style: TextStyleHelper.button13.copyWith(
                            fontWeight: FontWeight.normal,
                            color: chosenContent == index
                                ? Colors.white
                                : Theme.of(context).colorScheme.background),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text('حدد تنظيم الخطة بالاجزاء ام السور',
                  style: TextStyleHelper.body15),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                // color: Colors.amber,
                height: 130,
                child: GridView.builder(
                  itemCount: partMemorizedList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: .3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: MediaQueryHelper.width * .03,
                      mainAxisExtent: 50),
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      setState(() {
                        partMemorized = index;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: partMemorized == index
                              ? Theme.of(context).colorScheme.primary
                              : Colors.transparent,
                          border: partMemorized == index
                              ? const Border()
                              : Border.all(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .background
                                      .withOpacity(.1),
                                  width: 1),
                          borderRadius: BorderRadius.circular(8)),
                      child: Text(
                        partMemorizedList[index],
                        style: TextStyleHelper.button13.copyWith(
                            fontWeight: FontWeight.normal,
                            color: partMemorized == index
                                ? Colors.white
                                : Theme.of(context).colorScheme.background),
                      ),
                    ),
                  ),
                ),
              ),
              Spacer(),
              CustomButton(
                  text: 'التالي',
                  onPressed: () {
                    AppRoutes.pushNamedNavigator(
                        routeName: Routes.teacherData2);
                  }),
              CustomButton(
                onPressed: () {
                  AppRoutes.pushNamedNavigator(routeName: Routes.navBar);
                },
                text: 'تخطي اعداد التوافق',
                textColor: Theme.of(context).colorScheme.secondary,
                background: Theme.of(context).colorScheme.secondary.withOpacity(.1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
