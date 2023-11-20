import 'package:flutter/material.dart';
import 'package:hafzny/utilities/text_style_helper.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const CustomTextButton({
    super.key,
    required this.text,required this.onPressed,

  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyleHelper.button16
            .copyWith(color: Theme.of(context).colorScheme.primary),
      ),
    );
  }
}