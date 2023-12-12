import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hafzny/utilities/images.dart';


class RatingWidget extends StatefulWidget {
  @override
  _RatingWidgetState createState() => _RatingWidgetState();
}

class _RatingWidgetState extends State<RatingWidget> {
  int _rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, (index) {
            return IconButton(
              onPressed: () {
                setState(() {
                  _rating = index + 1;
                });
              },
              icon:index < _rating ? SvgPicture.asset(
                 ImagesHelper.starIcon ,
               
              ):SvgPicture.asset(
                 ImagesHelper.starIcon ,
               color: Colors.grey,
              )
            );
          }),
        ),
      ),
    );
  }
}
