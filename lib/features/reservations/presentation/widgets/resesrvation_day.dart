import 'package:flutter/material.dart';
import 'package:hafzny/utilities/text_style_helper.dart';

class ReservationDay extends StatefulWidget {
  const ReservationDay({
    super.key,
  });

  @override
  State<ReservationDay> createState() => _ReservationDayState();
}

class _ReservationDayState extends State<ReservationDay> {
  int currentIndex = -1;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 7,
        itemBuilder: (context, index) => InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () {
            setState(() {
              currentIndex = index;
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              color: currentIndex == index
                  ? Theme.of(context).colorScheme.primary
                  : Colors.transparent,
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                'السبت',
                style: TextStyleHelper.caption11.copyWith(
                    color: currentIndex == index
                        ? Colors.white
                        : Theme.of(context)
                            .colorScheme
                            .primaryContainer
                            ),
              ),
              Text(
                '${index + 1}',
                style:
                    TextStyleHelper.body15.copyWith(color:currentIndex == index
                        ? Colors.white
                        : Theme.of(context)
                            .colorScheme
                            .background ,
                      fontWeight: FontWeight.bold),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
