import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hafzny/utilities/images.dart';

class CustomUploadImage extends StatelessWidget {
  const CustomUploadImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 60,
          backgroundColor: Colors.grey[300],
          child:/*  state is ProfileLoading
              ? CircleAvatar(
                  radius: 55.r,
                  backgroundColor: Theme.of(context)
                      .colorScheme
                      .primary,
                  child:
                      const CircularProgressIndicator())
              : */ CircleAvatar(
                  foregroundImage: NetworkImage(
                   'https://picsum.photos/200/300'
                  ),
                  radius: 55,
                ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: InkWell(
            onTap: () async {
              /* setState(() {
                image = null;
              });
              image = await ImagePickerHandler()
                  .getSingleImage();
              ProfileBloc.instance.image = image;
              ProfileBloc.instance.add(UploadImage()); */
            },
            child: CircleAvatar(
              radius: 20.r,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 18.r,
                backgroundColor: Colors.grey.shade300,
                child: SvgPicture.asset(
                  ImagesHelper.uploadImageIcon,
                  height: 20,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
