import 'package:flutter/material.dart';
import 'package:hafzny/utilities/text_style_helper.dart';

class SessionDetailsCard extends StatelessWidget {
  const SessionDetailsCard({
    super.key,
    required this.content,
  });

  final List<Map<String, dynamic>> content;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: const BorderRadius.all(Radius.circular(4)),
      ),
      child: Column(
          children: List.generate(
        content.length,
        (index) => Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                content[index]['title'],
                style: TextStyleHelper.body15
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                content[index]['subTitle'],
                style: TextStyleHelper.body15.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
