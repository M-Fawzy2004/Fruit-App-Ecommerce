import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class InActiveStepItem extends StatelessWidget {
  const InActiveStepItem({super.key, required this.text, required this.index});

  final String text;
  final String index;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 10,
          backgroundColor: Colors.grey,
          child: FittedBox(
            child: Text(
              index,
            ),
          ),
        ),
        SizedBox(
          width: screenWidth * .02,
        ),
        Text(
          text,
          style: Styles.fontText13(context).copyWith(
            color: Colors.grey,
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }
}
