import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hafzny/utilities/images.dart';
import 'package:hafzny/utilities/media_quary.dart';
import 'package:hafzny/utilities/text_style_helper.dart';

class CustomPackage extends StatelessWidget {
  const CustomPackage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      //color: Colors.green,
      width: MediaQueryHelper.width,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: 200,
            width: 200,
            child: CircularProgressIndicator(
              semanticsLabel: '50%',
              color: Theme.of(context).colorScheme.secondary,
              backgroundColor: Colors.white,
              strokeWidth: 80,
              value: .9,
              strokeAlign: -1,
            ),
          ),
          Container(
            height: 170,
            width: 170,
            padding: EdgeInsets.all(8.0.r),
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 6.r,
                    offset: const Offset(0, 0),
                  )
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'الباقة الفضية',
                  style: TextStyleHelper.subtitle17
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                Text('30:00', style: TextStyleHelper.title22),
                Text(
                  'صالحة لمدة 28 يوم',
                  style: TextStyleHelper.caption11,
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          Positioned(
            top: 10,
            child: CircleAvatar(
              radius: 25,
              backgroundColor: Theme.of(context).colorScheme.secondary,
              child: CircleAvatar(
                  radius: 22,
                  backgroundColor: Colors.white,
                  child: SvgPicture.asset(
                    ImagesHelper.diamondIcon,
                    height: 30,
                    width: 30,
                    /*   color: Colors.white, */
                  )
                  //    backgroundImage: AssetImage('assets/images/1.jpg'),
                  ),
            ),
          ),
          Positioned(
            bottom: 10,
            child: Container(
              height: 60,
              width: 120,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 4.r,
                    offset: const Offset(0, 0),
                  )
                ],
                borderRadius: BorderRadius.circular(28),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'الدقائق المتبقية',
                    style: TextStyleHelper.caption11.copyWith(
                        color: const Color(
                          0xff545F71,
                        ),
                        fontWeight: FontWeight.normal),
                  ),
                  Text(
                    '28:00',
                    style: TextStyleHelper.subtitle17.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
