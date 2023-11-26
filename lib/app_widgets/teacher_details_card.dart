import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hafzny/app_widgets/active_avatar.dart';
import 'package:hafzny/app_widgets/teacher_details_text.dart';

class TeacherDetailsCard extends StatelessWidget {
  final bool isSessions;
  final Function()? onTap;
  const TeacherDetailsCard({
    super.key,
    this.isSessions = false, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        10,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: InkWell(
            onTap: onTap,
            child: ListTile(
              minVerticalPadding: 10,
              titleAlignment: ListTileTitleAlignment.center,
              //  contentPadding: EdgeInsets.zero,
          
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.grey.shade300, width: 1),
                  borderRadius: BorderRadius.circular(4)),
              horizontalTitleGap: 8,
          
              leading: ActiveAvatar(isSessions: isSessions),
              contentPadding: const EdgeInsetsDirectional.only(start: 12),
          
              subtitle: TeacherDetailsText(isSessions: isSessions),
          
              trailing: IconButton(
                  onPressed: () {},
                  icon: Platform.isIOS
                      ? const Icon(Icons.arrow_forward_ios)
                      : const Icon(Icons.arrow_forward)),
            ),
          ),
        ),
      ),
    );
  }
}
