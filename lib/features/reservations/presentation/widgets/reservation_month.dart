import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hafzny/utilities/images.dart';
import 'package:hafzny/utilities/text_style_helper.dart';

class ReservationMonth extends StatelessWidget {
  const ReservationMonth({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'حدد يوم الحجز',
          style: TextStyleHelper.body15.copyWith(fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        Row(
          children: [
            SvgPicture.asset(ImagesHelper.calenderIcon),
            const SizedBox(
              width: 10,
            ),
            Text(
              'اغسطس',
              style:
                  TextStyleHelper.body15.copyWith(fontWeight: FontWeight.bold),
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                ImagesHelper.dropDownIcon,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
