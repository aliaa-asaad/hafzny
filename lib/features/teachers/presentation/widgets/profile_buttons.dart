import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hafzny/app_widgets/custom_button.dart';
import 'package:hafzny/utilities/images.dart';
import 'package:hafzny/utilities/text_style_helper.dart';

class ProfileButtons extends StatelessWidget {
  const ProfileButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(
          isOpacity: true,
          background: Theme.of(context)
              .colorScheme
              .primary
              .withOpacity(.04),
          onPressed: () {},
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('مكالمة صوتية',
                    style: TextStyleHelper.button16),
                const SizedBox(
                  width: 10,
                ),
                SvgPicture.asset(
                  ImagesHelper.callIcon,
                )
              ]),
        ),
        CustomButton(
          isOpacity: true,
          background: Theme.of(context)
              .colorScheme
              .secondary
              .withOpacity(.04),
          onPressed: () {},
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('مكالمة فيديو',
                    style: TextStyleHelper.button16),
                const SizedBox(
                  width: 10,
                ),
                SvgPicture.asset(
                  ImagesHelper.videoIcon,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ]),
        ),
      ],
    );
  }
}
