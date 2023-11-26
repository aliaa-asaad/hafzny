import 'package:flutter/material.dart';
import 'package:hafzny/app_widgets/custom_arrow_back.dart';
import 'package:hafzny/utilities/text_style_helper.dart';

class CustomBackAppBar extends StatelessWidget {
  final String? title;
  const CustomBackAppBar({
    super.key,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const CustomArrowBack(),
        const SizedBox(width: 10),
        Text(
          title!,
          style: TextStyleHelper.subtitle19,
        ),
      ],
    );
  }
}
