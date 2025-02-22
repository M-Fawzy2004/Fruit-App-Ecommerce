import 'package:e_commerce_app/constant.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class ActiveStepItem extends StatelessWidget {
  const ActiveStepItem({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 11,
          backgroundColor: activeDotColor,
          child: Icon(
            Icons.check,
            size: 17,
          ),
        ),
        SizedBox(
          width: screenWidth * .02,
        ),
        Text(
          text,
          style: Styles.fontText13(context).copyWith(
            color: activeDotColor,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}
