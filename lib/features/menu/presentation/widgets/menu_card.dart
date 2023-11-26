import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hafzny/utilities/text_style_helper.dart';

class MenuCard extends StatelessWidget {
  final List<Map<String, dynamic>> content;
  const MenuCard({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        children: List.generate(
          2,
          (index) => InkWell(
            onTap: () {},
            child: Row(
              children: [
                SvgPicture.asset(content[index]['icon']),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  content[index]['title'],
                  style: TextStyleHelper.subtitle17
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
